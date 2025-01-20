@interface TPSCarrierBundleController
- (id)localizedCarrierNameForSubscriptionContext:(id)a3;
- (id)localizedStringForKey:(id)a3 subscriptionContext:(id)a4;
- (id)localizedStringForKey:(id)a3 subscriptionContext:(id)a4 error:(id *)a5;
- (id)objectForKey:(id)a3 subscriptionContext:(id)a4;
- (id)objectForKey:(id)a3 subscriptionContext:(id)a4 error:(id *)a5;
- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4;
- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5;
- (void)carrierBundleChange:(id)a3;
- (void)operatorBundleChange:(id)a3;
@end

@implementation TPSCarrierBundleController

- (id)localizedCarrierNameForSubscriptionContext:(id)a3
{
  return [(TPSCarrierBundleController *)self objectForKey:@"CarrierName" subscriptionContext:a3];
}

- (id)localizedStringForKey:(id)a3 subscriptionContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  v5 = [(TPSCarrierBundleController *)self localizedStringForKey:a3 subscriptionContext:a4 error:&v13];
  id v6 = v13;
  if (v6)
  {
    v7 = TPSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      id v11 = v10;
      v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v15 = v10;
      __int16 v16 = 2112;
      v17 = v12;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_error_impl(&dword_1E4DD4000, v7, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", buf, 0x20u);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (id)localizedStringForKey:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(TPSTelephonyController *)self telephonyClient];
  id v11 = [v10 localizedCarrierBundleStringForKey:v9 subscription:v8 error:a5];

  return v11;
}

- (id)objectForKey:(id)a3 subscriptionContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  v5 = [(TPSCarrierBundleController *)self objectForKey:a3 subscriptionContext:a4 error:&v13];
  id v6 = v13;
  if (v6)
  {
    v7 = TPSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      id v11 = v10;
      v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v15 = v10;
      __int16 v16 = 2112;
      v17 = v12;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_error_impl(&dword_1E4DD4000, v7, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", buf, 0x20u);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (id)objectForKey:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F23938];
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v8 alloc] initWithBundleType:1];
  v12 = [(TPSTelephonyController *)self telephonyClient];
  id v13 = (void *)[v12 copyCarrierBundleValue:v9 key:v10 bundleType:v11 error:a5];

  return v13;
}

- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  v5 = [(TPSCarrierBundleController *)self objectForKeyHierarchy:a3 subscriptionContext:a4 error:&v13];
  id v6 = v13;
  if (v6)
  {
    v7 = TPSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_opt_class();
      id v11 = v10;
      v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v15 = v10;
      __int16 v16 = 2112;
      v17 = v12;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_error_impl(&dword_1E4DD4000, v7, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", buf, 0x20u);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F23938];
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v8 alloc] initWithBundleType:1];
  v12 = [(TPSTelephonyController *)self telephonyClient];
  id v13 = (void *)[v12 copyCarrierBundleValueWithDefault:v9 keyHierarchy:v10 bundleType:v11 error:a5];

  return v13;
}

- (void)carrierBundleChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "Carrier bundle changed for subscription context %@.", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__TPSCarrierBundleController_carrierBundleChange___block_invoke;
  v7[3] = &unk_1E6EB22C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(TPSController *)self performAtomicDelegateBlock:v7];
}

void __50__TPSCarrierBundleController_carrierBundleChange___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          id v8 = [*(id *)(a1 + 32) delegateToQueue];
          id v9 = [v8 objectForKey:v7];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __50__TPSCarrierBundleController_carrierBundleChange___block_invoke_2;
          block[3] = &unk_1E6EB2180;
          uint64_t v10 = *(void *)(a1 + 32);
          uint64_t v11 = *(void **)(a1 + 40);
          block[4] = v7;
          block[5] = v10;
          id v13 = v11;
          dispatch_async(v9, block);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

uint64_t __50__TPSCarrierBundleController_carrierBundleChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) carrierBundleController:*(void *)(a1 + 40) carrierBundleDidChangeForSubscriptionContext:*(void *)(a1 + 48)];
}

- (void)operatorBundleChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "Operator bundle changed for subscription context %@.", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__TPSCarrierBundleController_operatorBundleChange___block_invoke;
  v7[3] = &unk_1E6EB22C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(TPSController *)self performAtomicDelegateBlock:v7];
}

void __51__TPSCarrierBundleController_operatorBundleChange___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          id v8 = [*(id *)(a1 + 32) delegateToQueue];
          id v9 = [v8 objectForKey:v7];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __51__TPSCarrierBundleController_operatorBundleChange___block_invoke_2;
          block[3] = &unk_1E6EB2180;
          uint64_t v10 = *(void *)(a1 + 32);
          uint64_t v11 = *(void **)(a1 + 40);
          block[4] = v7;
          block[5] = v10;
          id v13 = v11;
          dispatch_async(v9, block);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

uint64_t __51__TPSCarrierBundleController_operatorBundleChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) carrierBundleController:*(void *)(a1 + 40) operatorBundleDidChangeForSubscriptionContext:*(void *)(a1 + 48)];
}

@end