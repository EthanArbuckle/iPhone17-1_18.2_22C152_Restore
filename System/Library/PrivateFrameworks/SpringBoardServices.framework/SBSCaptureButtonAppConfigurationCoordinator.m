@interface SBSCaptureButtonAppConfigurationCoordinator
- (SBSCaptureButtonAppConfigurationCoordinator)init;
- (id)addObserverForAssociatedAppUpdatesUsingBlock:(id)a3;
- (id)addObserverForEligibleAppsUpdatesUsingBlock:(id)a3;
- (id)addObserverForEligibleCaptureAppsUpdatesUsingBlock:(id)a3;
- (void)captureButtonAppConfigurationClient:(id)a3 receiveInitialOrUpdatedAssociatedAppBundleIdentifier:(id)a4;
- (void)captureButtonAppConfigurationClient:(id)a3 receiveInitialOrUpdatedEligibleApps:(id)a4;
- (void)dealloc;
- (void)setAssociatedAppBundleIdentifier:(id)a3;
@end

@implementation SBSCaptureButtonAppConfigurationCoordinator

- (SBSCaptureButtonAppConfigurationCoordinator)init
{
  v12.receiver = self;
  v12.super_class = (Class)SBSCaptureButtonAppConfigurationCoordinator;
  v2 = [(SBSCaptureButtonAppConfigurationCoordinator *)&v12 init];
  if (v2)
  {
    v3 = objc_alloc_init(SBSCaptureButtonAppConfigurationClient);
    client = v2->_client;
    v2->_client = v3;

    [(SBSCaptureButtonAppConfigurationClient *)v2->_client setDelegate:v2];
    v5 = (NSMapTable *)objc_alloc_init(MEMORY[0x1E4F28E10]);
    associatedAppObserversToBlocks = v2->_associatedAppObserversToBlocks;
    v2->_associatedAppObserversToBlocks = v5;

    v7 = (NSMapTable *)objc_alloc_init(MEMORY[0x1E4F28E10]);
    eligibleAppsObserversToBlocks = v2->_eligibleAppsObserversToBlocks;
    v2->_eligibleAppsObserversToBlocks = v7;

    v9 = (NSMapTable *)objc_alloc_init(MEMORY[0x1E4F28E10]);
    eligibleCaptureAppsObserversToBlocks = v2->_eligibleCaptureAppsObserversToBlocks;
    v2->_eligibleCaptureAppsObserversToBlocks = v9;

    *(_WORD *)&v2->_isAssociatedAppKnown = 0;
  }
  return v2;
}

- (void)dealloc
{
  [(NSMapTable *)self->_associatedAppObserversToBlocks removeAllObjects];
  [(NSMapTable *)self->_eligibleAppsObserversToBlocks removeAllObjects];
  [(NSMapTable *)self->_eligibleCaptureAppsObserversToBlocks removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)SBSCaptureButtonAppConfigurationCoordinator;
  [(SBSCaptureButtonAppConfigurationCoordinator *)&v3 dealloc];
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  currentEligibleApps = self->_currentEligibleApps;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __80__SBSCaptureButtonAppConfigurationCoordinator_setAssociatedAppBundleIdentifier___block_invoke;
  v10 = &unk_1E566BEC8;
  id v6 = v4;
  id v11 = v6;
  objc_super v12 = &v13;
  [(NSSet *)currentEligibleApps enumerateObjectsUsingBlock:&v7];
  if (!v6 || *((unsigned char *)v14 + 24))
  {
    [(SBSCaptureButtonAppConfigurationClient *)self->_client establishConnectionIfNeeded];
    [(SBSCaptureButtonAppConfigurationClient *)self->_client setCurrentAssociatedAppUsingBundleIdentifier:v6];
  }

  _Block_object_dispose(&v13, 8);
}

void __80__SBSCaptureButtonAppConfigurationCoordinator_setAssociatedAppBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 bundleIdentifier];
  int v4 = BSEqualStrings();

  if (v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)addObserverForAssociatedAppUpdatesUsingBlock:(id)a3
{
  v5 = (void (**)(id, NSString *))a3;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBSCaptureButtonAppConfigurationCoordinator.m", 66, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v7 = NSString;
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  v9 = [v8 UUIDString];
  v10 = [v7 stringWithFormat:@"(Active App Observer) %@", v9];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__SBSCaptureButtonAppConfigurationCoordinator_addObserverForAssociatedAppUpdatesUsingBlock___block_invoke;
  v16[3] = &unk_1E566B608;
  objc_copyWeak(&v17, &location);
  id v11 = (void *)[v6 initWithIdentifier:v10 forReason:@"Add observer for active app updates" invalidationBlock:v16];

  associatedAppObserversToBlocks = self->_associatedAppObserversToBlocks;
  uint64_t v13 = (void *)MEMORY[0x192FC0DF0](v5);
  [(NSMapTable *)associatedAppObserversToBlocks setObject:v13 forKey:v11];

  if (self->_isAssociatedAppKnown) {
    v5[2](v5, self->_currentAssociatedAppBundleIdentifier);
  }
  [(SBSCaptureButtonAppConfigurationClient *)self->_client establishConnectionIfNeeded];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

void __92__SBSCaptureButtonAppConfigurationCoordinator_addObserverForAssociatedAppUpdatesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[2] removeObjectForKey:v5];
  }
}

- (id)addObserverForEligibleAppsUpdatesUsingBlock:(id)a3
{
  id v5 = (void (**)(id, NSSet *))a3;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBSCaptureButtonAppConfigurationCoordinator.m", 83, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v7 = NSString;
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  v9 = [v8 UUIDString];
  v10 = [v7 stringWithFormat:@"(Eligible Apps Observer) %@", v9];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__SBSCaptureButtonAppConfigurationCoordinator_addObserverForEligibleAppsUpdatesUsingBlock___block_invoke;
  v16[3] = &unk_1E566B608;
  objc_copyWeak(&v17, &location);
  id v11 = (void *)[v6 initWithIdentifier:v10 forReason:@"Add observer for eligible apps updates" invalidationBlock:v16];

  eligibleAppsObserversToBlocks = self->_eligibleAppsObserversToBlocks;
  uint64_t v13 = (void *)MEMORY[0x192FC0DF0](v5);
  [(NSMapTable *)eligibleAppsObserversToBlocks setObject:v13 forKey:v11];

  if (self->_areEligibleAppsKnown) {
    v5[2](v5, self->_currentEligibleAppsBundleIdentifiers);
  }
  [(SBSCaptureButtonAppConfigurationClient *)self->_client establishConnectionIfNeeded];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

void __91__SBSCaptureButtonAppConfigurationCoordinator_addObserverForEligibleAppsUpdatesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[3] removeObjectForKey:v5];
  }
}

- (id)addObserverForEligibleCaptureAppsUpdatesUsingBlock:(id)a3
{
  id v5 = (void (**)(id, NSSet *))a3;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBSCaptureButtonAppConfigurationCoordinator.m", 100, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v7 = NSString;
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  v9 = [v8 UUIDString];
  v10 = [v7 stringWithFormat:@"(Eligible Capture Apps Observer) %@", v9];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__SBSCaptureButtonAppConfigurationCoordinator_addObserverForEligibleCaptureAppsUpdatesUsingBlock___block_invoke;
  v16[3] = &unk_1E566B608;
  objc_copyWeak(&v17, &location);
  id v11 = (void *)[v6 initWithIdentifier:v10 forReason:@"Add observer for eligible capture apps updates" invalidationBlock:v16];

  eligibleCaptureAppsObserversToBlocks = self->_eligibleCaptureAppsObserversToBlocks;
  uint64_t v13 = (void *)MEMORY[0x192FC0DF0](v5);
  [(NSMapTable *)eligibleCaptureAppsObserversToBlocks setObject:v13 forKey:v11];

  if (self->_areEligibleAppsKnown) {
    v5[2](v5, self->_currentEligibleApps);
  }
  [(SBSCaptureButtonAppConfigurationClient *)self->_client establishConnectionIfNeeded];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

void __98__SBSCaptureButtonAppConfigurationCoordinator_addObserverForEligibleCaptureAppsUpdatesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[4] removeObjectForKey:v5];
  }
}

- (void)captureButtonAppConfigurationClient:(id)a3 receiveInitialOrUpdatedAssociatedAppBundleIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BSDispatchQueueAssertMain();
  id v6 = (NSString *)[v5 copy];
  currentAssociatedAppBundleIdentifier = self->_currentAssociatedAppBundleIdentifier;
  self->_currentAssociatedAppBundleIdentifier = v6;

  self->_isAssociatedAppKnown = 1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(NSMapTable *)self->_associatedAppObserversToBlocks objectEnumerator];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)captureButtonAppConfigurationClient:(id)a3 receiveInitialOrUpdatedEligibleApps:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BSDispatchQueueAssertMain();
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __119__SBSCaptureButtonAppConfigurationCoordinator_captureButtonAppConfigurationClient_receiveInitialOrUpdatedEligibleApps___block_invoke;
  v28[3] = &unk_1E566BEF0;
  id v7 = v6;
  id v29 = v7;
  [v5 enumerateObjectsUsingBlock:v28];
  objc_storeStrong((id *)&self->_currentEligibleAppsBundleIdentifiers, v6);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [(NSMapTable *)self->_eligibleAppsObserversToBlocks objectEnumerator];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v24 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v10);
  }

  long long v13 = (NSSet *)[v5 copy];
  currentEligibleApps = self->_currentEligibleApps;
  self->_currentEligibleApps = v13;

  self->_areEligibleAppsKnown = 1;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v15 = [(NSMapTable *)self->_eligibleCaptureAppsObserversToBlocks objectEnumerator];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * v19++) + 16))();
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v17);
  }
}

void __119__SBSCaptureButtonAppConfigurationCoordinator_captureButtonAppConfigurationClient_receiveInitialOrUpdatedEligibleApps___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 bundleIdentifier];
  [v2 addObject:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEligibleApps, 0);
  objc_storeStrong((id *)&self->_currentEligibleAppsBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentAssociatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_eligibleCaptureAppsObserversToBlocks, 0);
  objc_storeStrong((id *)&self->_eligibleAppsObserversToBlocks, 0);
  objc_storeStrong((id *)&self->_associatedAppObserversToBlocks, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end