@interface SBHSimpleApplicationPolicyMonitor
+ (SBHSimpleApplicationPolicyMonitor)sharedInstance;
- (DMFApplicationPolicyMonitor)policyMonitor;
- (SBHSimpleApplicationPolicyMonitor)init;
- (void)registerApplication:(id)a3;
- (void)unregisterApplication:(id)a3;
- (void)updateAllPolicies;
@end

@implementation SBHSimpleApplicationPolicyMonitor

+ (SBHSimpleApplicationPolicyMonitor)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_313);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return (SBHSimpleApplicationPolicyMonitor *)v2;
}

void __51__SBHSimpleApplicationPolicyMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBHSimpleApplicationPolicyMonitor);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;
}

- (SBHSimpleApplicationPolicyMonitor)init
{
  v14.receiver = self;
  v14.super_class = (Class)SBHSimpleApplicationPolicyMonitor;
  v2 = [(SBHSimpleApplicationPolicyMonitor *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    registeredApplications = v2->_registeredApplications;
    v2->_registeredApplications = (NSHashTable *)v3;

    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v5 = (void *)getDMFApplicationPolicyMonitorClass_softClass;
    uint64_t v19 = getDMFApplicationPolicyMonitorClass_softClass;
    if (!getDMFApplicationPolicyMonitorClass_softClass)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __getDMFApplicationPolicyMonitorClass_block_invoke;
      v15[3] = &unk_1E6AAD648;
      v15[4] = &v16;
      __getDMFApplicationPolicyMonitorClass_block_invoke((uint64_t)v15);
      v5 = (void *)v17[3];
    }
    v6 = v5;
    _Block_object_dispose(&v16, 8);
    id v7 = [v6 alloc];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__SBHSimpleApplicationPolicyMonitor_init__block_invoke;
    v12[3] = &unk_1E6AAC810;
    v8 = v2;
    v13 = v8;
    uint64_t v9 = [v7 initWithPolicyChangeHandler:v12];
    policyMonitor = v8->_policyMonitor;
    v8->_policyMonitor = (DMFApplicationPolicyMonitor *)v9;
  }
  return v2;
}

uint64_t __41__SBHSimpleApplicationPolicyMonitor_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAllPolicies];
}

- (void)registerApplication:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_registeredApplications addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
  v5 = [v4 bundleIdentifier];
  v6 = [(SBHSimpleApplicationPolicyMonitor *)self policyMonitor];
  v13[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__SBHSimpleApplicationPolicyMonitor_registerApplication___block_invoke;
  v10[3] = &unk_1E6AAE800;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  [v6 requestPoliciesForBundleIdentifiers:v7 completionHandler:v10];
}

void __57__SBHSimpleApplicationPolicyMonitor_registerApplication___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKey:*(void *)(a1 + 32)];
  [v3 integerValue];
  id v4 = *(id *)(a1 + 40);
  BSDispatchMain();
}

uint64_t __57__SBHSimpleApplicationPolicyMonitor_registerApplication___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateDeviceManagementPolicy:*(void *)(a1 + 40)];
}

- (void)unregisterApplication:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_registeredApplications removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)updateAllPolicies
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSHashTable *)self->_registeredApplications allObjects];
  os_unfair_lock_unlock(p_lock);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v12 = [v11 bundleIdentifier];
        if (v12) {
          [v5 setObject:v11 forKey:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v13 = [v5 allKeys];
  objc_super v14 = [(SBHSimpleApplicationPolicyMonitor *)self policyMonitor];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__SBHSimpleApplicationPolicyMonitor_updateAllPolicies__block_invoke;
  v16[3] = &unk_1E6AAE828;
  id v17 = v5;
  id v15 = v5;
  [v14 requestPoliciesForBundleIdentifiers:v13 completionHandler:v16];
}

void __54__SBHSimpleApplicationPolicyMonitor_updateAllPolicies__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  BSDispatchMain();
}

void __54__SBHSimpleApplicationPolicyMonitor_updateAllPolicies__block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__SBHSimpleApplicationPolicyMonitor_updateAllPolicies__block_invoke_3;
  v2[3] = &unk_1E6AAE4B8;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

void __54__SBHSimpleApplicationPolicyMonitor_updateAllPolicies__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v7 = [v4 objectForKey:a2];
  uint64_t v6 = [v5 integerValue];

  [v7 updateDeviceManagementPolicy:v6];
}

- (DMFApplicationPolicyMonitor)policyMonitor
{
  return self->_policyMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyMonitor, 0);
  objc_storeStrong((id *)&self->_registeredApplications, 0);
}

@end