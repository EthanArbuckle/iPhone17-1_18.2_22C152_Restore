@interface SBCommunicationPolicyManager
+ (id)sharedInstance;
- (BOOL)shouldScreenTimeSuppressNotificationsForBundleIdentifier:(id)a3;
- (SBCommunicationPolicyManager)init;
- (uint64_t)_communicationPolicyForBundleIdentifier:(uint64_t)result;
- (void)_setPoliciesByBundleIdentifier:(uint64_t)a1;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation SBCommunicationPolicyManager

+ (id)sharedInstance
{
  if (sharedInstance___onceToken != -1) {
    dispatch_once(&sharedInstance___onceToken, &__block_literal_global_104);
  }
  v2 = (void *)sharedInstance___instance_2;
  return v2;
}

void __46__SBCommunicationPolicyManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBCommunicationPolicyManager);
  v1 = (void *)sharedInstance___instance_2;
  sharedInstance___instance_2 = (uint64_t)v0;
}

- (SBCommunicationPolicyManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBCommunicationPolicyManager;
  v2 = [(SBCommunicationPolicyManager *)&v9 init];
  if (v2)
  {
    v3 = (DMFCommunicationPolicyMonitor *)objc_alloc_init(MEMORY[0x1E4F5F3A8]);
    communicationPolicyMonitor = v2->_communicationPolicyMonitor;
    v2->_communicationPolicyMonitor = v3;

    v5 = [(DMFCommunicationPolicyMonitor *)v2->_communicationPolicyMonitor policiesByBundleIdentifier];
    uint64_t v6 = [v5 copy];
    policiesByBundleIdentifier = v2->_policiesByBundleIdentifier;
    v2->_policiesByBundleIdentifier = (NSDictionary *)v6;

    [(DMFCommunicationPolicyMonitor *)v2->_communicationPolicyMonitor addObserver:v2 forKeyPath:@"policiesByBundleIdentifier" options:0 context:&SBCommunicationPolicyManagerKeyValueObserverContext];
  }
  return v2;
}

- (void)dealloc
{
  [(SBCommunicationPolicyManager *)self removeObserver:self forKeyPath:@"policiesByBundleIdentifier" context:&SBCommunicationPolicyManagerKeyValueObserverContext];
  v3.receiver = self;
  v3.super_class = (Class)SBCommunicationPolicyManager;
  [(SBCommunicationPolicyManager *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &SBCommunicationPolicyManagerKeyValueObserverContext)
  {
    block[5] = v6;
    block[6] = v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__SBCommunicationPolicyManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __79__SBCommunicationPolicyManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = [*(id *)(v1 + 16) policiesByBundleIdentifier];
  v2 = (void *)[v3 copy];
  -[SBCommunicationPolicyManager _setPoliciesByBundleIdentifier:](v1, v2);
}

- (void)_setPoliciesByBundleIdentifier:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    v5 = (id *)(a1 + 8);
    if (([*(id *)(a1 + 8) isEqualToDictionary:v4] & 1) == 0)
    {
      obuint64_t j = a2;
      uint64_t v28 = a1;
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v7 = *v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v41 count:16];
      id v29 = v4;
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v35 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            v13 = [*v5 objectForKey:v12];
            v14 = [v4 objectForKey:v12];
            char v15 = [v13 isEqual:v14];

            if ((v15 & 1) == 0) {
              [v6 addObject:v12];
            }

            id v4 = v29;
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v41 count:16];
        }
        while (v9);
      }

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v16 = v4;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v40 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * j);
            v22 = [v16 objectForKey:v21];
            v23 = [*v5 objectForKey:v21];
            char v24 = [v22 isEqual:v23];

            if ((v24 & 1) == 0) {
              [v6 addObject:v21];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v40 count:16];
        }
        while (v18);
      }

      objc_storeStrong(v5, obj);
      v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v38 = @"SBCommunicationPolicyChangedBundleIdentifiersKey";
      id v39 = v6;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      [v25 postNotificationName:@"SBCommunicationPolicyDidChangeNotification" object:v28 userInfo:v26];

      id v4 = v29;
    }
  }
}

- (BOOL)shouldScreenTimeSuppressNotificationsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v5 = -[SBCommunicationPolicyManager _communicationPolicyForBundleIdentifier:]((uint64_t)self, (uint64_t)v4);

  return v5 != 0;
}

- (uint64_t)_communicationPolicyForBundleIdentifier:(uint64_t)result
{
  if (result)
  {
    v2 = [*(id *)(result + 8) objectForKey:a2];
    uint64_t v3 = [v2 unsignedIntegerValue];

    return v3;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_policiesByBundleIdentifier, 0);
}

@end