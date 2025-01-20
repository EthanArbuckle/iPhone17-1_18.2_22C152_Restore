@interface TPSTelephonyController
- (BOOL)isSubscriptionOrderedSet:(id)a3 equivalentToSubscriptionOrderedSet:(id)a4;
- (BOOL)supportsCellularNetworkSelectionForSubscriptionContext:(id)a3;
- (BOOL)supportsSystemCapabilityCallForwardingForSubscriptionContext:(id)a3;
- (BOOL)supportsSystemCapabilityCallWaitingForSubscriptionContext:(id)a3;
- (BOOL)supportsSystemCapabilityCallerIDForSubscriptionContext:(id)a3;
- (BOOL)supportsSystemCapabilityWithName:(id)a3 subscriptionContext:(id)a4;
- (CoreTelephonyClient)telephonyClient;
- (NSDictionary)systemCapabilities;
- (NSOrderedSet)activeSubscriptions;
- (NSOrderedSet)subscriptions;
- (OS_dispatch_queue)serialDispatchQueue;
- (TPSTelephonyController)init;
- (id)fetchNonHiddenSubscriptions;
- (id)fetchSubscriptions;
- (id)fetchSubscriptionsInUse;
- (id)fetchSystemCapabilitiesForSubscriptions:(id)a3;
- (id)systemCapabilitiesForSubscriptionContext:(id)a3;
- (id)systemCapabilitiesForSubscriptionContext:(id)a3 error:(id *)a4;
- (os_unfair_lock_s)accessorLock;
- (void)context:(id)a3 capabilitiesChanged:(id)a4;
- (void)performAtomicAccessorBlock:(id)a3;
- (void)setAccessorLock:(os_unfair_lock_s)a3;
- (void)setActiveSubscriptions:(id)a3;
- (void)setSubscriptions:(id)a3;
- (void)setSystemCapabilities:(id)a3;
@end

@implementation TPSTelephonyController

- (TPSTelephonyController)init
{
  v15.receiver = self;
  v15.super_class = (Class)TPSTelephonyController;
  v2 = [(TPSController *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = NSString;
    v5 = objc_msgSend((id)objc_opt_class(), "tps_classIdentifier");
    v6 = NSStringFromSelector(sel_serialDispatchQueue);
    v7 = [v4 stringWithFormat:@"%@.%@", v5, v6];

    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    id v9 = v7;
    dispatch_queue_t v10 = dispatch_queue_create((const char *)[v9 UTF8String], v8);
    serialDispatchQueue = v3->_serialDispatchQueue;
    v3->_serialDispatchQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v3->_serialDispatchQueue];
    telephonyClient = v3->_telephonyClient;
    v3->_telephonyClient = (CoreTelephonyClient *)v12;

    [(CoreTelephonyClient *)v3->_telephonyClient setDelegate:v3];
  }
  return v3;
}

- (BOOL)isSubscriptionOrderedSet:(id)a3 equivalentToSubscriptionOrderedSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] || objc_msgSend(v6, "count"))
  {
    uint64_t v7 = [v5 count];
    if (v7 == [v6 count])
    {
      uint64_t v13 = 0;
      v14 = &v13;
      uint64_t v15 = 0x2020000000;
      char v16 = 1;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __86__TPSTelephonyController_isSubscriptionOrderedSet_equivalentToSubscriptionOrderedSet___block_invoke;
      v10[3] = &unk_1E6EB2870;
      id v11 = v6;
      uint64_t v12 = &v13;
      [v5 enumerateObjectsUsingBlock:v10];
      BOOL v8 = *((unsigned char *)v14 + 24) != 0;

      _Block_object_dispose(&v13, 8);
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

void __86__TPSTelephonyController_isSubscriptionOrderedSet_equivalentToSubscriptionOrderedSet___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  if (!v7 || (objc_msgSend(v8, "tps_isEquivalentToSubscriptionContext:", v7) & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (NSOrderedSet)activeSubscriptions
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__2;
  id v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__TPSTelephonyController_activeSubscriptions__block_invoke;
  v4[3] = &unk_1E6EB2398;
  v4[4] = self;
  v4[5] = &v5;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSOrderedSet *)v2;
}

void __45__TPSTelephonyController_activeSubscriptions__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[4];
  if (!v3)
  {
    v4 = [v2 fetchSubscriptionsInUse];
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v5;

    v3 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  id v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v8, v3);
}

- (void)setActiveSubscriptions:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__TPSTelephonyController_setActiveSubscriptions___block_invoke;
  v6[3] = &unk_1E6EB22C8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v6];
}

void __49__TPSTelephonyController_setActiveSubscriptions___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v1 != *(void **)(a1 + 40))
  {
    id v3 = v1;
    uint64_t v4 = [*(id *)(a1 + 40) copy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;

    if (([*(id *)(a1 + 32) isSubscriptionOrderedSet:v3 equivalentToSubscriptionOrderedSet:*(void *)(*(void *)(a1 + 32) + 32)] & 1) == 0)
    {
      id v7 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __49__TPSTelephonyController_setActiveSubscriptions___block_invoke_2;
      v8[3] = &unk_1E6EB2258;
      v8[4] = v7;
      [v7 performAtomicDelegateBlock:v8];
    }
  }
}

void __49__TPSTelephonyController_setActiveSubscriptions___block_invoke_2(uint64_t a1)
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
          id v8 = [*(id *)(a1 + 32) delegateToQueue];
          id v9 = [v8 objectForKey:v7];

          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __49__TPSTelephonyController_setActiveSubscriptions___block_invoke_3;
          v11[3] = &unk_1E6EB22C8;
          uint64_t v10 = *(void *)(a1 + 32);
          v11[4] = v7;
          v11[5] = v10;
          dispatch_async(v9, v11);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

uint64_t __49__TPSTelephonyController_setActiveSubscriptions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) telephonyController:*(void *)(a1 + 40) didChangeActiveSubscriptions:*(void *)(*(void *)(a1 + 40) + 32)];
}

- (NSOrderedSet)subscriptions
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__2;
  id v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__TPSTelephonyController_subscriptions__block_invoke;
  v4[3] = &unk_1E6EB2398;
  v4[4] = self;
  v4[5] = &v5;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSOrderedSet *)v2;
}

void __39__TPSTelephonyController_subscriptions__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[5];
  if (!v3)
  {
    uint64_t v4 = [v2 fetchSubscriptions];
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  id v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v8, v3);
}

- (void)setSubscriptions:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__TPSTelephonyController_setSubscriptions___block_invoke;
  v6[3] = &unk_1E6EB22C8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v6];
}

void __43__TPSTelephonyController_setSubscriptions___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v1 != *(void **)(a1 + 40))
  {
    id v3 = v1;
    uint64_t v4 = [*(id *)(a1 + 40) copy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (([*(id *)(a1 + 32) isSubscriptionOrderedSet:v3 equivalentToSubscriptionOrderedSet:*(void *)(*(void *)(a1 + 32) + 40)] & 1) == 0)
    {
      id v7 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __43__TPSTelephonyController_setSubscriptions___block_invoke_2;
      v8[3] = &unk_1E6EB2258;
      v8[4] = v7;
      [v7 performAtomicDelegateBlock:v8];
    }
  }
}

void __43__TPSTelephonyController_setSubscriptions___block_invoke_2(uint64_t a1)
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
          id v8 = [*(id *)(a1 + 32) delegateToQueue];
          id v9 = [v8 objectForKey:v7];

          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __43__TPSTelephonyController_setSubscriptions___block_invoke_3;
          v11[3] = &unk_1E6EB22C8;
          uint64_t v10 = *(void *)(a1 + 32);
          v11[4] = v7;
          v11[5] = v10;
          dispatch_async(v9, v11);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

uint64_t __43__TPSTelephonyController_setSubscriptions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) telephonyController:*(void *)(a1 + 40) didChangeSubscriptions:*(void *)(*(void *)(a1 + 40) + 40)];
}

- (NSDictionary)systemCapabilities
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__2;
  id v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__TPSTelephonyController_systemCapabilities__block_invoke;
  v4[3] = &unk_1E6EB2398;
  v4[4] = self;
  v4[5] = &v5;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

void __44__TPSTelephonyController_systemCapabilities__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[6];
  if (!v3)
  {
    uint64_t v4 = [v2 fetchSystemCapabilitiesForSubscriptions:v2[5]];
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 48);
    *(void *)(v6 + 48) = v5;

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  id v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v8, v3);
}

- (void)setSystemCapabilities:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__TPSTelephonyController_setSystemCapabilities___block_invoke;
  v6[3] = &unk_1E6EB22C8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v6];
}

void *__48__TPSTelephonyController_setSystemCapabilities___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 48) != result)
  {
    *(void *)(*(void *)(a1 + 32) + 48) = [result copy];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)performAtomicAccessorBlock:(id)a3
{
  if (a3)
  {
    p_accessorLock = &self->_accessorLock;
    id v4 = (void (**)(void))a3;
    os_unfair_lock_lock(p_accessorLock);
    v4[2](v4);

    os_unfair_lock_unlock(p_accessorLock);
  }
}

- (BOOL)supportsCellularNetworkSelectionForSubscriptionContext:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSTelephonyController *)self telephonyClient];
  id v12 = 0;
  uint64_t v6 = [v5 isNetworkSelectionMenuAvailable:v4 error:&v12];
  id v7 = v12;

  if (!v6)
  {
    id v8 = [v7 domain];

    if (v8)
    {
      id v9 = TPSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[TPSTelephonyController supportsCellularNetworkSelectionForSubscriptionContext:]();
      }
    }
  }
  char v10 = [v6 BOOLValue];

  return v10;
}

- (id)fetchNonHiddenSubscriptions
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = TPSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v3 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_1E4DD4000, v2, OS_LOG_TYPE_DEFAULT, "%@ fetching current CTXPCServiceSubscriptions in use", (uint8_t *)&buf, 0xCu);
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v5 = (void *)getPSSimStatusCacheClass_softClass_0;
  uint64_t v26 = getPSSimStatusCacheClass_softClass_0;
  if (!getPSSimStatusCacheClass_softClass_0)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v29 = __getPSSimStatusCacheClass_block_invoke_0;
    v30 = &unk_1E6EB21F8;
    v31 = &v23;
    __getPSSimStatusCacheClass_block_invoke_0((uint64_t)&buf);
    id v5 = (void *)v24[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v23, 8);
  id v7 = [v6 sharedInstance];
  id v8 = [v7 subscriptionsInUse];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v9)
  {
    uint64_t v11 = *(void *)v20;
    *(void *)&long long v10 = 138412290;
    long long v18 = v10;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "isSimHidden", v18, (void)v19))
        {
          long long v14 = TPSLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            long long v15 = [v13 uuid];
            LODWORD(buf) = v18;
            *(void *)((char *)&buf + 4) = v15;
            _os_log_impl(&dword_1E4DD4000, v14, OS_LOG_TYPE_DEFAULT, "Subscription: %@ is hidden", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          [v4 addObject:v13];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v9);
  }

  char v16 = (void *)[v4 copy];
  return v16;
}

- (id)fetchSubscriptions
{
  id v2 = [(TPSTelephonyController *)self fetchNonHiddenSubscriptions];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)fetchSubscriptionsInUse
{
  id v2 = [(TPSTelephonyController *)self fetchNonHiddenSubscriptions];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)fetchSystemCapabilitiesForSubscriptions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = -[TPSTelephonyController systemCapabilitiesForSubscriptionContext:](self, "systemCapabilitiesForSubscriptionContext:", v11, (void)v16);
        if (v12)
        {
          long long v13 = [v11 uuid];
          [v5 setObject:v12 forKeyedSubscript:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  long long v14 = (void *)[v5 copy];
  return v14;
}

- (BOOL)supportsSystemCapabilityWithName:(id)a3 subscriptionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TPSTelephonyController *)self systemCapabilities];
  uint64_t v9 = [v7 uuid];
  long long v10 = [v8 objectForKeyedSubscript:v9];

  if (v10
    || ([(TPSTelephonyController *)self systemCapabilitiesForSubscriptionContext:v7], (long long v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v11 = [v10 objectForKeyedSubscript:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v12 = [v11 BOOLValue];
    }
    else {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)supportsSystemCapabilityCallerIDForSubscriptionContext:(id)a3
{
  return [(TPSTelephonyController *)self supportsSystemCapabilityWithName:*MEMORY[0x1E4F242C8] subscriptionContext:a3];
}

- (BOOL)supportsSystemCapabilityCallForwardingForSubscriptionContext:(id)a3
{
  return [(TPSTelephonyController *)self supportsSystemCapabilityWithName:*MEMORY[0x1E4F242B8] subscriptionContext:a3];
}

- (BOOL)supportsSystemCapabilityCallWaitingForSubscriptionContext:(id)a3
{
  return [(TPSTelephonyController *)self supportsSystemCapabilityWithName:*MEMORY[0x1E4F242C0] subscriptionContext:a3];
}

- (id)systemCapabilitiesForSubscriptionContext:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  id v5 = [(TPSTelephonyController *)self systemCapabilitiesForSubscriptionContext:v4 error:&v11];
  id v6 = v11;
  id v7 = v6;
  if (!v5)
  {
    uint64_t v8 = [v6 domain];

    if (v8)
    {
      uint64_t v9 = TPSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[TPSTelephonyController systemCapabilitiesForSubscriptionContext:]();
      }
    }
  }

  return v5;
}

- (id)systemCapabilitiesForSubscriptionContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(TPSTelephonyController *)self telephonyClient];
  uint64_t v8 = [v7 context:v6 getSystemCapabilities:a4];

  return v8;
}

- (void)context:(id)a3 capabilitiesChanged:(id)a4
{
  id v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "System capabilities have changed; updating the cached system capabilities.",
      v8,
      2u);
  }

  id v6 = [(TPSTelephonyController *)self subscriptions];
  id v7 = [(TPSTelephonyController *)self fetchSystemCapabilitiesForSubscriptions:v6];
  [(TPSTelephonyController *)self setSystemCapabilities:v7];
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (void)setAccessorLock:(os_unfair_lock_s)a3
{
  self->_accessorLock = a3;
}

- (OS_dispatch_queue)serialDispatchQueue
{
  return self->_serialDispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_systemCapabilities, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_activeSubscriptions, 0);
}

- (void)supportsCellularNetworkSelectionForSubscriptionContext:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E4DD4000, v0, v1, "Retrieving cellular network selection information failed with error %@ for %@.");
}

- (void)systemCapabilitiesForSubscriptionContext:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E4DD4000, v0, v1, "Retrieving system capability information failed with error %@ for %@.");
}

@end