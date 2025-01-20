@interface PHCallBlockingServiceProviderController
- (BOOL)supportsCallBlockingForSubscriptionContext:(id)a3;
- (NSArray)serviceProviders;
- (NSArray)serviceProvidersSupportingSpamBlocking;
- (OS_dispatch_queue)queue;
- (PHCallBlockingServiceProviderController)init;
- (PHCallBlockingServiceProviderControllerDelegate)delegate;
- (TPSCarrierBundleController)carrierBundleController;
- (id)fetchServiceProviders;
- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5;
- (id)stringForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5;
- (void)carrierBundleController:(id)a3 carrierBundleDidChangeForSubscriptionContext:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setServiceProviders:(id)a3;
@end

@implementation PHCallBlockingServiceProviderController

- (PHCallBlockingServiceProviderController)init
{
  v11.receiver = self;
  v11.super_class = (Class)PHCallBlockingServiceProviderController;
  v2 = [(PHCallBlockingServiceProviderController *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("PHCallBlockingServiceProviderController", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(TPSCarrierBundleController);
    carrierBundleController = v2->_carrierBundleController;
    v2->_carrierBundleController = v5;

    [(TPSController *)v2->_carrierBundleController addDelegate:v2 queue:v2->_queue];
    v7 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PHCallBlockingServiceProviderController_init__block_invoke;
    block[3] = &unk_1E6EB2258;
    v10 = v2;
    dispatch_async(v7, block);
  }
  return v2;
}

void __47__PHCallBlockingServiceProviderController_init__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) fetchServiceProviders];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;
}

- (NSArray)serviceProviders
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  objc_super v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(PHCallBlockingServiceProviderController *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PHCallBlockingServiceProviderController_serviceProviders__block_invoke;
  v6[3] = &unk_1E6EB2280;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __59__PHCallBlockingServiceProviderController_serviceProviders__block_invoke(uint64_t a1)
{
}

- (NSArray)serviceProvidersSupportingSpamBlocking
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  objc_super v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(PHCallBlockingServiceProviderController *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__PHCallBlockingServiceProviderController_serviceProvidersSupportingSpamBlocking__block_invoke;
  v6[3] = &unk_1E6EB2280;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __81__PHCallBlockingServiceProviderController_serviceProvidersSupportingSpamBlocking__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
  uint64_t v3 = [v2 filteredArrayUsingPredicate:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __81__PHCallBlockingServiceProviderController_serviceProvidersSupportingSpamBlocking__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 supportsSpamBlocking];
}

- (void)setServiceProviders:(id)a3
{
  id v4 = a3;
  id v5 = [(PHCallBlockingServiceProviderController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PHCallBlockingServiceProviderController_setServiceProviders___block_invoke;
  v7[3] = &unk_1E6EB22C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __63__PHCallBlockingServiceProviderController_setServiceProviders___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2 != v1)
  {
    id v4 = v2;
    uint64_t v5 = [v1 copy];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = v5;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PHCallBlockingServiceProviderController_setServiceProviders___block_invoke_2;
    block[3] = &unk_1E6EB2258;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __63__PHCallBlockingServiceProviderController_setServiceProviders___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didChangeServiceProvidersForCallBlockingServiceProviderController:*(void *)(a1 + 32)];
}

- (id)fetchServiceProviders
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PHCallBlockingServiceProviderController *)self carrierBundleController];
  uint64_t v5 = [v4 activeSubscriptions];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 isSimHidden])
        {
          id v12 = TPSLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_1E4DD4000, v12, OS_LOG_TYPE_DEFAULT, "Subscription is hidden", v16, 2u);
          }
        }
        else
        {
          v13 = [(PHCallBlockingServiceProviderController *)self carrierBundleController];
          id v12 = [v13 localizedCarrierNameForSubscriptionContext:v11];

          if ([v12 length])
          {
            v14 = [[PHCallBlockingServiceProvider alloc] initWithLocalizedName:v12 supportsSpamBlocking:[(PHCallBlockingServiceProviderController *)self supportsCallBlockingForSubscriptionContext:v11]];
            [v3 addObject:v14];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v3;
}

- (BOOL)supportsCallBlockingForSubscriptionContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v12 = 0;
  uint64_t v5 = [(PHCallBlockingServiceProviderController *)self stringForKeyHierarchy:&unk_1F40C93B8 subscriptionContext:v4 error:&v12];
  id v6 = v12;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = TPSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v4;
      uint64_t v9 = "Retrieved call blocking value '%@' for subscription %@";
LABEL_7:
      _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0x16u);
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    uint64_t v8 = TPSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v7;
      uint64_t v9 = "Retrieving call blocking value for subscription %@ failed with error %@";
      goto LABEL_7;
    }
  }

LABEL_9:
  if ([v5 isEqualToIgnoringCase:@"Enabled"]) {
    char v10 = 1;
  }
  else {
    char v10 = [v5 isEqualToIgnoringCase:@"Dynamic"];
  }

  return v10;
}

- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F23938];
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = (void *)[[v8 alloc] initWithBundleType:1];
  id v12 = [(PHCallBlockingServiceProviderController *)self carrierBundleController];
  v13 = [v12 telephonyClient];
  id v14 = (void *)[v13 copyCarrierBundleValue:v9 keyHierarchy:v10 bundleType:v11 error:a5];

  return v14;
}

- (id)stringForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  uint64_t v5 = [(PHCallBlockingServiceProviderController *)self objectForKeyHierarchy:a3 subscriptionContext:a4 error:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)carrierBundleController:(id)a3 carrierBundleDidChangeForSubscriptionContext:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = TPSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1E4DD4000, v6, OS_LOG_TYPE_DEFAULT, "Carrier bundle changed for subscription context %@", buf, 0xCu);
  }

  uint64_t v7 = [(PHCallBlockingServiceProviderController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__PHCallBlockingServiceProviderController_carrierBundleController_carrierBundleDidChangeForSubscriptionContext___block_invoke;
  block[3] = &unk_1E6EB2258;
  void block[4] = self;
  dispatch_async(v7, block);
}

void __112__PHCallBlockingServiceProviderController_carrierBundleController_carrierBundleDidChangeForSubscriptionContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetchServiceProviders];
  [*(id *)(a1 + 32) setServiceProviders:v2];
}

- (PHCallBlockingServiceProviderControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PHCallBlockingServiceProviderControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TPSCarrierBundleController)carrierBundleController
{
  return self->_carrierBundleController;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_carrierBundleController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceProviders, 0);
}

@end