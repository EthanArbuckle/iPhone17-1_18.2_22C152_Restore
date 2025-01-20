@interface SKAStatusSubscriptionManager
+ (id)_tooManySubscriptionsError;
+ (id)logger;
- (BOOL)_activePresenceAssertionsExist;
- (BOOL)_activeTransientAssertionsExist;
- (BOOL)_addPresenceSubscriptionAssertionForClient:(id)a3 subscriptionIdentifier:(id)a4;
- (BOOL)_addTransientSubscriptionAssertionForClient:(id)a3 subscriptionIdentifier:(id)a4;
- (BOOL)_removePresenceSubscriptionAssertionForClient:(id)a3 subscriptionIdentifier:(id)a4;
- (BOOL)_removeTransientSubscriptionAssertionForClient:(id)a3 subscriptionIdentifier:(id)a4;
- (BOOL)activePresenceSubscriptionAssertionsExistForChannelIdentifier:(id)a3;
- (NSMapTable)activePresenceSubscriptionsByClient;
- (NSMapTable)activeTransientSubscriptionsByClient;
- (OS_dispatch_queue)internalWorkQueue;
- (SKAChannelManaging)channelManager;
- (SKADatabaseManaging)databaseManager;
- (SKAPushManaging)pushManager;
- (SKAStatusSubscriptionManager)initWithDatabaseManager:(id)a3 channelManager:(id)a4 pushManager:(id)a5;
- (double)_subscriptionTTL;
- (id)_activePresenceSubscriptionsForClient:(id)a3;
- (id)_activeTransientSubscriptionsForClient:(id)a3;
- (id)_allPersonalChannelIdentifiersRequiringSelfSubscriptionWithDatabaseContext:(id)a3;
- (id)_enforceSubscriptionsHardCapOnSubscriptionIdentifiers:(id)a3;
- (id)_fetchAllActivePresenceSubscriptions;
- (id)_fetchAllActiveSubscriptionAssertionsWithCache;
- (id)_fetchAllClientActiveSubscriptionAssertions;
- (id)_filterSubscriptionIdentifierToPresence:(id)a3;
- (id)_filterSubscriptionIdentifierToStatus:(id)a3;
- (id)_recentlyReleasedTransientSubscriptionAssertionIdentifiersExcludingSubscriptionIdentifiers:(id)a3 count:(int64_t)a4 presenceCount:(int64_t)a5 databaseContext:(id)a6;
- (id)_sortAndDedupeSubscriptionIdentifiers:(id)a3;
- (id)_statusTypeIdentifiersRequiringSelfSubscription;
- (int64_t)_hardMaxSubscriptionCount;
- (int64_t)_maxPresenceSubscriptionCacheCount;
- (int64_t)_maxSubscriptionCacheCount;
- (os_unfair_lock_s)presenceSubscriptionsLock;
- (os_unfair_lock_s)transientSubscriptionsLock;
- (void)_markCacheSubscriptionDateForChannelIdentifier:(id)a3;
- (void)allStatusSubscriptionIdentifiersWithActiveSubscriptionsWithCompletion:(id)a3;
- (void)allSubscriptionIdentifiersWithActiveAssertionsForStatusTypeIdentifier:(id)a3 completion:(id)a4;
- (void)releaseAllPresenceSubscriptionAssertionsAssociatedWithClient:(id)a3 completion:(id)a4;
- (void)releaseAllTransientSubscriptionAssertionsAssociatedWithClient:(id)a3 completion:(id)a4;
- (void)releasePersistentSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 applicationIdentifier:(id)a5 completion:(id)a6;
- (void)releasePresenceSubscriptionAssertionForSubscriptionIdentifier:(id)a3 client:(id)a4 completion:(id)a5;
- (void)releaseTransientSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 client:(id)a5 completion:(id)a6;
- (void)retainPersistentSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 applicationIdentifier:(id)a5 completion:(id)a6;
- (void)retainPresenceSubscriptionAssertionForSubscriptionIdentifier:(id)a3 client:(id)a4 completion:(id)a5;
- (void)retainTransientSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 client:(id)a5 completion:(id)a6;
- (void)setActivePresenceSubscriptionsByClient:(id)a3;
- (void)setActiveTransientSubscriptionsByClient:(id)a3;
- (void)setChannelManager:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setInternalWorkQueue:(id)a3;
- (void)setPresenceSubscriptionsLock:(os_unfair_lock_s)a3;
- (void)setPushManager:(id)a3;
- (void)setTransientSubscriptionsLock:(os_unfair_lock_s)a3;
- (void)updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:(id)a3;
@end

@implementation SKAStatusSubscriptionManager

- (SKAStatusSubscriptionManager)initWithDatabaseManager:(id)a3 channelManager:(id)a4 pushManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SKAStatusSubscriptionManager;
  v12 = [(SKAStatusSubscriptionManager *)&v22 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    activeTransientSubscriptionsByClient = v12->_activeTransientSubscriptionsByClient;
    v12->_activeTransientSubscriptionsByClient = (NSMapTable *)v13;

    uint64_t v15 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    activePresenceSubscriptionsByClient = v12->_activePresenceSubscriptionsByClient;
    v12->_activePresenceSubscriptionsByClient = (NSMapTable *)v15;

    objc_storeStrong((id *)&v12->_databaseManager, a3);
    objc_storeStrong((id *)&v12->_channelManager, a4);
    objc_storeStrong((id *)&v12->_pushManager, a5);
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.StatusKitAgent.SubscriptionManager", v18);
    internalWorkQueue = v12->_internalWorkQueue;
    v12->_internalWorkQueue = (OS_dispatch_queue *)v19;

    *(void *)&v12->_transientSubscriptionsLock._os_unfair_lock_opaque = 0;
  }

  return v12;
}

- (void)retainTransientSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 client:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __133__SKAStatusSubscriptionManager_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke;
  v16[3] = &unk_2646E1C58;
  objc_copyWeak(&v21, &location);
  id v17 = v10;
  id v18 = v9;
  dispatch_queue_t v19 = self;
  id v20 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(internalWorkQueue, v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __133__SKAStatusSubscriptionManager_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (([WeakRetained _addTransientSubscriptionAssertionForClient:*(void *)(a1 + 32) subscriptionIdentifier:*(void *)(a1 + 40)] & 1) == 0)
  {
    v3 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Transient subscription assertion already existed, but still refreshing registered subscription assertions, to ensure apsd is in sync.", buf, 2u);
    }
  }
  [*(id *)(a1 + 48) _markCacheSubscriptionDateForChannelIdentifier:*(void *)(a1 + 40)];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __133__SKAStatusSubscriptionManager_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_6;
  v5[3] = &unk_2646E0DF0;
  v4 = *(void **)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v4 updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:v5];
}

void __133__SKAStatusSubscriptionManager_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[SKAStatusSubscriptionManager logger];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __133__SKAStatusSubscriptionManager_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_6_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated registered subscriptions following transient assertion retain", v7, 2u);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)releaseTransientSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 client:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __134__SKAStatusSubscriptionManager_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke;
  v16[3] = &unk_2646E1C58;
  objc_copyWeak(&v21, &location);
  id v17 = v10;
  id v18 = v9;
  dispatch_queue_t v19 = self;
  id v20 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(internalWorkQueue, v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __134__SKAStatusSubscriptionManager_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  int v3 = [WeakRetained _removeTransientSubscriptionAssertionForClient:*(void *)(a1 + 32) subscriptionIdentifier:*(void *)(a1 + 40)];
  v4 = +[SKAStatusSubscriptionManager logger];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v6;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully removed transient subscription assertion from in memory model for subscription identifier: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __134__SKAStatusSubscriptionManager_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_cold_1(a1 + 40, v5, v7, v8, v9, v10, v11, v12);
  }

  [*(id *)(a1 + 48) _markCacheSubscriptionDateForChannelIdentifier:*(void *)(a1 + 40)];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __134__SKAStatusSubscriptionManager_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_9;
  v14[3] = &unk_2646E0DF0;
  id v13 = *(void **)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  [v13 updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:v14];
}

void __134__SKAStatusSubscriptionManager_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[SKAStatusSubscriptionManager logger];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __134__SKAStatusSubscriptionManager_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_9_cold_1();
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated registered subscriptions following transient assertion release", v7, 2u);
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)releaseAllTransientSubscriptionAssertionsAssociatedWithClient:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __105__SKAStatusSubscriptionManager_releaseAllTransientSubscriptionAssertionsAssociatedWithClient_completion___block_invoke;
  block[3] = &unk_2646E1C80;
  objc_copyWeak(&v15, &location);
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalWorkQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __105__SKAStatusSubscriptionManager_releaseAllTransientSubscriptionAssertionsAssociatedWithClient_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained activeTransientSubscriptionsByClient];
  v4 = [v3 objectForKey:*(void *)(a1 + 32)];

  uint64_t v5 = [v4 count];
  id v6 = +[SKAStatusSubscriptionManager logger];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v13 = [v4 count];
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Disconnecting client had %ld transient subscription assertion, removing transient assertions and updating registrations for channels: %@", buf, 0x16u);
    }

    uint64_t v8 = [WeakRetained activeTransientSubscriptionsByClient];
    [v8 removeObjectForKey:*(void *)(a1 + 32)];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __105__SKAStatusSubscriptionManager_releaseAllTransientSubscriptionAssertionsAssociatedWithClient_completion___block_invoke_10;
    v10[3] = &unk_2646E0DF0;
    id v9 = *(void **)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    [v9 updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:v10];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Disconnecting client had no active transient subscription assertions, not updating registered subscriptions", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __105__SKAStatusSubscriptionManager_releaseAllTransientSubscriptionAssertionsAssociatedWithClient_completion___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[SKAStatusSubscriptionManager logger];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __105__SKAStatusSubscriptionManager_releaseAllTransientSubscriptionAssertionsAssociatedWithClient_completion___block_invoke_10_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated registered subscriptions following client disconnect", v7, 2u);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)retainPersistentSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 applicationIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __149__SKAStatusSubscriptionManager_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke;
  block[3] = &unk_2646E1CA8;
  objc_copyWeak(&v25, &location);
  id v20 = v10;
  id v21 = v12;
  id v22 = v11;
  v23 = self;
  id v24 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(internalWorkQueue, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __149__SKAStatusSubscriptionManager_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = [WeakRetained databaseManager];
  v4 = (void *)[v3 newBackgroundContext];
  uint64_t v5 = [v3 existingSubscriptionAssertionForSubscriptionIdentifier:*(void *)(a1 + 32) applicationIdentifier:*(void *)(a1 + 40) databaseContext:v4];
  if (v5)
  {
    id v6 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __149__SKAStatusSubscriptionManager_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_cold_1();
    }
  }
  else
  {
    id v6 = [v3 createSubscriptionAssertionForSubscriptionIdentifier:*(void *)(a1 + 32) applicationIdentifier:*(void *)(a1 + 40) statusTypeIdentifier:*(void *)(a1 + 48) databaseContext:v4];
    BOOL v7 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Created subscription assertion: %@", buf, 0xCu);
    }
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __149__SKAStatusSubscriptionManager_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_11;
  v9[3] = &unk_2646E0DF0;
  uint64_t v8 = *(void **)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  [v8 updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:v9];
}

void __149__SKAStatusSubscriptionManager_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[SKAStatusSubscriptionManager logger];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __149__SKAStatusSubscriptionManager_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_11_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated registered subscriptions following persistent assertion retain", v7, 2u);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)releasePersistentSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 applicationIdentifier:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __150__SKAStatusSubscriptionManager_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke;
  v16[3] = &unk_2646E1C58;
  objc_copyWeak(&v21, &location);
  id v17 = v9;
  id v18 = v10;
  dispatch_queue_t v19 = self;
  id v20 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(internalWorkQueue, v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __150__SKAStatusSubscriptionManager_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = [WeakRetained databaseManager];
  v4 = (void *)[v3 newBackgroundContext];
  char v5 = [v3 deleteSubscriptionAssertionWithSubscriptionIdentifier:*(void *)(a1 + 32) applicationIdentifier:*(void *)(a1 + 40) databaseContext:v4];
  id v6 = +[SKAStatusSubscriptionManager logger];
  BOOL v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v8;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Successfully removed persistent subscription assertion from database for subscription identifier: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __150__SKAStatusSubscriptionManager_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_cold_1(a1 + 32, v7, v9, v10, v11, v12, v13, v14);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __150__SKAStatusSubscriptionManager_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_12;
  v16[3] = &unk_2646E0DF0;
  id v15 = *(void **)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  [v15 updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:v16];
}

void __150__SKAStatusSubscriptionManager_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[SKAStatusSubscriptionManager logger];
  char v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __150__SKAStatusSubscriptionManager_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_12_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated registered subscriptions following persistent assertion release", v7, 2u);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)allSubscriptionIdentifiersWithActiveAssertionsForStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __113__SKAStatusSubscriptionManager_allSubscriptionIdentifiersWithActiveAssertionsForStatusTypeIdentifier_completion___block_invoke;
  block[3] = &unk_2646E1CD0;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(internalWorkQueue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __113__SKAStatusSubscriptionManager_allSubscriptionIdentifiersWithActiveAssertionsForStatusTypeIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained _fetchAllClientActiveSubscriptionAssertions];
  v4 = +[SKAStatusSubscriptionManager logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = [v3 count];
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Returning %lu active assertions.", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allStatusSubscriptionIdentifiersWithActiveSubscriptionsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__SKAStatusSubscriptionManager_allStatusSubscriptionIdentifiersWithActiveSubscriptionsWithCompletion___block_invoke;
  block[3] = &unk_2646E1CD0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalWorkQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __102__SKAStatusSubscriptionManager_allStatusSubscriptionIdentifiersWithActiveSubscriptionsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained channelManager];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __102__SKAStatusSubscriptionManager_allStatusSubscriptionIdentifiersWithActiveSubscriptionsWithCompletion___block_invoke_2;
  v4[3] = &unk_2646E19F0;
  id v5 = *(id *)(a1 + 32);
  [v3 activeStatusChannelSubscriptionsWithCompletion:v4];
}

void __102__SKAStatusSubscriptionManager_allStatusSubscriptionIdentifiersWithActiveSubscriptionsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKAStatusSubscriptionManager logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = [v3 count];
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Returning %lu active subscriptions.", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)releaseAllPresenceSubscriptionAssertionsAssociatedWithClient:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__SKAStatusSubscriptionManager_releaseAllPresenceSubscriptionAssertionsAssociatedWithClient_completion___block_invoke;
  block[3] = &unk_2646E1C80;
  objc_copyWeak(&v15, &location);
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalWorkQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __104__SKAStatusSubscriptionManager_releaseAllPresenceSubscriptionAssertionsAssociatedWithClient_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained activePresenceSubscriptionsByClient];
  id v4 = [v3 objectForKey:*(void *)(a1 + 32)];

  uint64_t v5 = [v4 count];
  id v6 = +[SKAStatusSubscriptionManager logger];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v13 = [v4 count];
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Disconnecting presence client had %ld transient subscription assertion, removing transient assertions and updating registrations for channels: %@", buf, 0x16u);
    }

    id v8 = [WeakRetained activePresenceSubscriptionsByClient];
    [v8 removeObjectForKey:*(void *)(a1 + 32)];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __104__SKAStatusSubscriptionManager_releaseAllPresenceSubscriptionAssertionsAssociatedWithClient_completion___block_invoke_14;
    v10[3] = &unk_2646E0DF0;
    id v9 = *(void **)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    [v9 updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:v10];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Disconnecting presence client had no active transient subscription assertions, not updating registered subscriptions", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __104__SKAStatusSubscriptionManager_releaseAllPresenceSubscriptionAssertionsAssociatedWithClient_completion___block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKAStatusSubscriptionManager logger];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __105__SKAStatusSubscriptionManager_releaseAllTransientSubscriptionAssertionsAssociatedWithClient_completion___block_invoke_10_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated registered subscriptions following client disconnect", v7, 2u);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)releasePresenceSubscriptionAssertionForSubscriptionIdentifier:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __112__SKAStatusSubscriptionManager_releasePresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke;
  v15[3] = &unk_2646E1C58;
  objc_copyWeak(&v20, &location);
  id v16 = v9;
  id v17 = v8;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(internalWorkQueue, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __112__SKAStatusSubscriptionManager_releasePresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  int v3 = [WeakRetained _removePresenceSubscriptionAssertionForClient:*(void *)(a1 + 32) subscriptionIdentifier:*(void *)(a1 + 40)];
  id v4 = +[SKAStatusSubscriptionManager logger];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v6;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully removed presence subscription assertion from in memory model for subscription identifier: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __112__SKAStatusSubscriptionManager_releasePresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_cold_1(a1 + 40, v5, v7, v8, v9, v10, v11, v12);
  }

  [*(id *)(a1 + 48) _markCacheSubscriptionDateForChannelIdentifier:*(void *)(a1 + 40)];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __112__SKAStatusSubscriptionManager_releasePresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_15;
  v14[3] = &unk_2646E0DF0;
  id v13 = *(void **)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  [v13 updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:v14];
}

void __112__SKAStatusSubscriptionManager_releasePresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKAStatusSubscriptionManager logger];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __112__SKAStatusSubscriptionManager_releasePresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_15_cold_1();
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated registered subscriptions following presence assertion release", v7, 2u);
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)retainPresenceSubscriptionAssertionForSubscriptionIdentifier:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __111__SKAStatusSubscriptionManager_retainPresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke;
  v15[3] = &unk_2646E1CF8;
  objc_copyWeak(&v19, &location);
  void v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(internalWorkQueue, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __111__SKAStatusSubscriptionManager_retainPresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = [*(id *)(a1 + 32) _fetchAllActivePresenceSubscriptions];
  uint64_t v4 = [v3 count];
  if (v4 >= [*(id *)(a1 + 32) _maxPresenceSubscriptionCacheCount])
  {
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = +[SKAStatusSubscriptionManager _tooManySubscriptionsError];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    if (([WeakRetained _addPresenceSubscriptionAssertionForClient:*(void *)(a1 + 40) subscriptionIdentifier:*(void *)(a1 + 48)] & 1) == 0)
    {
      uint64_t v5 = +[SKAStatusSubscriptionManager logger];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Presence subscription assertion already existed, but still refreshing registered subscription assertions, to ensure apsd is in sync.", buf, 2u);
      }
    }
    [*(id *)(a1 + 32) _markCacheSubscriptionDateForChannelIdentifier:*(void *)(a1 + 48)];
    uint64_t v6 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __111__SKAStatusSubscriptionManager_retainPresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_16;
    v9[3] = &unk_2646E0DF0;
    id v10 = *(id *)(a1 + 56);
    [v6 updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:v9];
  }
}

void __111__SKAStatusSubscriptionManager_retainPresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[SKAStatusSubscriptionManager logger];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __111__SKAStatusSubscriptionManager_retainPresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_16_cold_1();
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated registered subscriptions following presence assertion retain", v7, 2u);
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (BOOL)activePresenceSubscriptionAssertionsExistForChannelIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_t lock = &self->_presenceSubscriptionsLock;
  os_unfair_lock_lock(&self->_presenceSubscriptionsLock);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [(NSMapTable *)self->_activePresenceSubscriptionsByClient objectEnumerator];
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v20 = 0;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = [*(id *)(*((void *)&v21 + 1) + 8 * j) subscriptionIdentifier];
              char v16 = [v15 isEqualToString:v4];

              if (v16)
              {
                char v20 = 1;
                goto LABEL_16;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }
  else
  {
    char v20 = 0;
  }

  os_unfair_lock_unlock(lock);
  return v20 & 1;
}

- (BOOL)_addTransientSubscriptionAssertionForClient:(id)a3 subscriptionIdentifier:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v24 = v6;
  id v8 = [(SKAStatusSubscriptionManager *)self _activeTransientSubscriptionsForClient:v6];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v11 = v9;
  char v12 = 0;
  uint64_t v13 = *(void *)v26;
  *(void *)&long long v10 = 138412802;
  long long v23 = v10;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v26 != v13) {
        objc_enumerationMutation(v8);
      }
      id v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      char v16 = objc_msgSend(v15, "subscriptionIdentifier", v23);
      int v17 = [v16 isEqualToString:v7];

      if (v17)
      {
        id v18 = +[SKAStatusSubscriptionManager logger];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v23;
          id v30 = v7;
          __int16 v31 = 2112;
          v32 = v24;
          __int16 v33 = 2112;
          v34 = v15;
          _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "Found an existing transient subscription assertion for \"%@\" and client: %@. ExistingAssertion: %@", buf, 0x20u);
        }

        char v12 = 1;
      }
    }
    uint64_t v11 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
  }
  while (v11);
  if (v12)
  {
    id v19 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, &v19->super, OS_LOG_TYPE_DEFAULT, "Not creating a new transient subscription assertion, one already exists.", buf, 2u);
    }
    BOOL v20 = 0;
  }
  else
  {
LABEL_16:
    id v19 = [[SKATransientSubscriptionAssertion alloc] initWithSubscriptionIdentifier:v7];
    [v8 addObject:v19];
    long long v21 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v7;
      _os_log_impl(&dword_22480C000, v21, OS_LOG_TYPE_DEFAULT, "Successfully added transient subscription assertion to in memory model for subscription identifier: %@", buf, 0xCu);
    }

    BOOL v20 = 1;
  }

  return v20;
}

- (BOOL)_addPresenceSubscriptionAssertionForClient:(id)a3 subscriptionIdentifier:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v24 = v6;
  id v8 = [(SKAStatusSubscriptionManager *)self _activePresenceSubscriptionsForClient:v6];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v11 = v9;
  char v12 = 0;
  uint64_t v13 = *(void *)v26;
  *(void *)&long long v10 = 138412802;
  long long v23 = v10;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v26 != v13) {
        objc_enumerationMutation(v8);
      }
      id v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      char v16 = objc_msgSend(v15, "subscriptionIdentifier", v23);
      int v17 = [v16 isEqualToString:v7];

      if (v17)
      {
        id v18 = +[SKAStatusSubscriptionManager logger];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v23;
          id v30 = v7;
          __int16 v31 = 2112;
          v32 = v24;
          __int16 v33 = 2112;
          v34 = v15;
          _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "Found an existing presence subscription assertion for \"%@\" and client: %@. ExistingAssertion: %@", buf, 0x20u);
        }

        char v12 = 1;
      }
    }
    uint64_t v11 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
  }
  while (v11);
  if (v12)
  {
    id v19 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, &v19->super, OS_LOG_TYPE_DEFAULT, "Not creating a new presence subscription assertion, one already exists.", buf, 2u);
    }
    BOOL v20 = 0;
  }
  else
  {
LABEL_16:
    id v19 = [[SKAPresenceSubscriptionAssertion alloc] initWithSubscriptionIdentifier:v7];
    [v8 addObject:v19];
    long long v21 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v7;
      _os_log_impl(&dword_22480C000, v21, OS_LOG_TYPE_DEFAULT, "Successfully added presence subscription assertion to in memory model for subscription identifier: %@", buf, 0xCu);
    }

    BOOL v20 = 1;
  }

  return v20;
}

- (void)_markCacheSubscriptionDateForChannelIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF910] now];
  id v6 = +[SKAStatusSubscriptionManager logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Marking subscription change time for channel %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
  id v8 = (id)[(SKADatabaseManaging *)self->_databaseManager createOrUpdateTransientSubscriptionHistoryForChannelIdentifier:v4 lastSubscriptionDate:v5 databaseContext:v7];
}

- (BOOL)_removeTransientSubscriptionAssertionForClient:(id)a3 subscriptionIdentifier:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SKAStatusSubscriptionManager *)self _activeTransientSubscriptionsForClient:v6];
  id v9 = objc_alloc_init(MEMORY[0x263F089C8]);
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __102__SKAStatusSubscriptionManager__removeTransientSubscriptionAssertionForClient_subscriptionIdentifier___block_invoke;
  BOOL v20 = &unk_2646E1D20;
  id v10 = v7;
  id v21 = v10;
  id v11 = v9;
  id v22 = v11;
  [v8 enumerateObjectsUsingBlock:&v17];
  uint64_t v12 = objc_msgSend(v11, "count", v17, v18, v19, v20);
  if (v12)
  {
    uint64_t v13 = [v8 count];
    [v8 removeObjectsAtIndexes:v11];
    uint64_t v14 = [v8 count];
    id v15 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v24 = v10;
      __int16 v25 = 2048;
      uint64_t v26 = v13;
      __int16 v27 = 2048;
      uint64_t v28 = v14;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Successfully removed transient subscription assertion for identifier: %@. Client had %ld transient subscription assertions, now has %ld. Client: %@", buf, 0x2Au);
    }
  }
  else
  {
    id v15 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v8;
      __int16 v27 = 2112;
      uint64_t v28 = (uint64_t)v6;
      _os_log_error_impl(&dword_22480C000, v15, OS_LOG_TYPE_ERROR, "Could not find transient subscription assertion for subscription identifier: \"%@\". Active transient subscription assertions: %@ for client: %@", buf, 0x20u);
    }
  }

  return v12 != 0;
}

void __102__SKAStatusSubscriptionManager__removeTransientSubscriptionAssertionForClient_subscriptionIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [a2 subscriptionIdentifier];
  LODWORD(v5) = [v5 isEqualToString:v6];

  if (v5)
  {
    id v7 = *(void **)(a1 + 40);
    [v7 addIndex:a3];
  }
}

- (BOOL)_removePresenceSubscriptionAssertionForClient:(id)a3 subscriptionIdentifier:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SKAStatusSubscriptionManager *)self _activePresenceSubscriptionsForClient:v6];
  id v9 = objc_alloc_init(MEMORY[0x263F089C8]);
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __101__SKAStatusSubscriptionManager__removePresenceSubscriptionAssertionForClient_subscriptionIdentifier___block_invoke;
  BOOL v20 = &unk_2646E1D48;
  id v10 = v7;
  id v21 = v10;
  id v11 = v9;
  id v22 = v11;
  [v8 enumerateObjectsUsingBlock:&v17];
  uint64_t v12 = objc_msgSend(v11, "count", v17, v18, v19, v20);
  if (v12)
  {
    uint64_t v13 = [v8 count];
    [v8 removeObjectsAtIndexes:v11];
    uint64_t v14 = [v8 count];
    id v15 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v24 = v10;
      __int16 v25 = 2048;
      uint64_t v26 = v13;
      __int16 v27 = 2048;
      uint64_t v28 = v14;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Successfully removed presence subscription assertion for identifier: %@. Client had %ld transient subscription assertions, now has %ld. Client: %@", buf, 0x2Au);
    }
  }
  else
  {
    id v15 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v8;
      __int16 v27 = 2112;
      uint64_t v28 = (uint64_t)v6;
      _os_log_error_impl(&dword_22480C000, v15, OS_LOG_TYPE_ERROR, "Could not find presence subscription assertion for subscription identifier: \"%@\". Active transient subscription assertions: %@ for client: %@", buf, 0x20u);
    }
  }

  return v12 != 0;
}

void __101__SKAStatusSubscriptionManager__removePresenceSubscriptionAssertionForClient_subscriptionIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [a2 subscriptionIdentifier];
  LODWORD(v5) = [v5 isEqualToString:v6];

  if (v5)
  {
    id v7 = *(void **)(a1 + 40);
    [v7 addIndex:a3];
  }
}

- (id)_activePresenceSubscriptionsForClient:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_presenceSubscriptionsLock);
  id v5 = [(NSMapTable *)self->_activePresenceSubscriptionsByClient objectForKey:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    [(NSMapTable *)self->_activePresenceSubscriptionsByClient setObject:v5 forKey:v4];
  }
  os_unfair_lock_unlock(&self->_presenceSubscriptionsLock);

  return v5;
}

- (id)_activeTransientSubscriptionsForClient:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_transientSubscriptionsLock);
  id v5 = [(NSMapTable *)self->_activeTransientSubscriptionsByClient objectForKey:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    [(NSMapTable *)self->_activeTransientSubscriptionsByClient setObject:v5 forKey:v4];
  }
  os_unfair_lock_unlock(&self->_transientSubscriptionsLock);

  return v5;
}

- (void)updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SKAStatusSubscriptionManager *)self _fetchAllActiveSubscriptionAssertionsWithCache];
  objc_initWeak(&location, self);
  channelManager = self->_channelManager;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __95__SKAStatusSubscriptionManager_updateRegisteredSubscriptionsForActiveAssertionsWithCompletion___block_invoke;
  v9[3] = &unk_2646E1D98;
  void v9[4] = self;
  objc_copyWeak(&v12, &location);
  id v7 = v5;
  id v10 = v7;
  id v8 = v4;
  id v11 = v8;
  [(SKAChannelManaging *)channelManager activeStatusChannelSubscriptionsWithCompletion:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __95__SKAStatusSubscriptionManager_updateRegisteredSubscriptionsForActiveAssertionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) channelManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __95__SKAStatusSubscriptionManager_updateRegisteredSubscriptionsForActiveAssertionsWithCompletion___block_invoke_2;
  v7[3] = &unk_2646E1D70;
  id v5 = v3;
  id v8 = v5;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  id v6 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = *(id *)(a1 + 48);
  [v4 activePresenceChannelSubscriptionsWithCompletion:v7];

  objc_destroyWeak(&v12);
}

void __95__SKAStatusSubscriptionManager_updateRegisteredSubscriptionsForActiveAssertionsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) arrayByAddingObjectsFromArray:v3];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v58 = [*(id *)(a1 + 40) _sortAndDedupeSubscriptionIdentifiers:*(void *)(a1 + 48)];
  id v5 = objc_msgSend(*(id *)(a1 + 40), "_enforceSubscriptionsHardCapOnSubscriptionIdentifiers:");
  id v6 = +[SKAStatusSubscriptionManager logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v74 = (uint64_t)v5;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "StatusKitAgent wants to be subscribed to: %@", buf, 0xCu);
  }

  v59 = (void *)v4;
  uint64_t v7 = [*(id *)(a1 + 40) _sortAndDedupeSubscriptionIdentifiers:v4];
  id v8 = +[SKAStatusSubscriptionManager logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v74 = v7;
    _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "StatusKitAgent was previously subscribed to: %@", buf, 0xCu);
  }

  v56 = (void *)v7;
  v57 = v5;
  v61 = [v5 differenceFromArray:v7];
  uint64_t v9 = [v61 removals];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v67 objects:v72 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v68 != v14) {
          objc_enumerationMutation(v11);
        }
        char v16 = [*(id *)(*((void *)&v67 + 1) + 8 * i) object];
        if ([v16 length]) {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v67 objects:v72 count:16];
    }
    while (v13);
  }

  uint64_t v17 = +[SKAStatusSubscriptionManager logger];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v74 = (uint64_t)v10;
    _os_log_impl(&dword_22480C000, v17, OS_LOG_TYPE_DEFAULT, "Unsubscribing from channels: %@", buf, 0xCu);
  }

  uint64_t v18 = [v10 count];
  if (v18)
  {
    id v19 = objc_alloc(MEMORY[0x263EFF9C0]);
    BOOL v20 = (void *)MEMORY[0x263EFFA68];
    if (*(void *)(a1 + 32)) {
      uint64_t v21 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v21 = MEMORY[0x263EFFA68];
    }
    id v22 = (void *)[v19 initWithArray:v21];
    [v22 intersectSet:v10];
    long long v23 = [v22 allObjects];
    if ([v23 count])
    {
      id v24 = [WeakRetained channelManager];
      [v24 unsubscribeFromStatusChannels:v23];
    }
    id v25 = objc_alloc(MEMORY[0x263EFF9C0]);
    if (v3) {
      id v26 = v3;
    }
    else {
      id v26 = v20;
    }
    __int16 v27 = (void *)[v25 initWithArray:v26];
    [v27 intersectSet:v10];
    uint64_t v28 = [v27 allObjects];
    if ([v28 count])
    {
      __int16 v29 = [WeakRetained channelManager];
      [v29 unsubscribeFromPresenceChannels:v28];
    }
  }
  v60 = v3;
  id v30 = [v61 insertions];
  id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v32 = v30;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v64 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = [*(id *)(*((void *)&v63 + 1) + 8 * j) object];
        if ([v37 length]) {
          [v31 addObject:v37];
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v34);
  }

  uint64_t v38 = [v31 count];
  if (v38)
  {
    v39 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v74 = (uint64_t)v31;
      _os_log_impl(&dword_22480C000, v39, OS_LOG_TYPE_DEFAULT, "Subscribing to channels: %@", buf, 0xCu);
    }

    v40 = [*(id *)(a1 + 40) _filterSubscriptionIdentifierToStatus:v31];
    if ([v40 count])
    {
      v41 = [WeakRetained channelManager];
      [v41 subscribeToStatusChannels:v40];
    }
    v42 = [*(id *)(a1 + 40) _filterSubscriptionIdentifierToPresence:v31];
    if ([v42 count])
    {
      v43 = [WeakRetained channelManager];
      [v43 subscribeToPresenceChannels:v42];
    }
  }
  int v44 = [*(id *)(a1 + 40) _activeTransientAssertionsExist];
  v45 = [*(id *)(a1 + 40) pushManager];
  v46 = v45;
  if (v44) {
    [v45 switchStatusFilterToEnabled];
  }
  else {
    [v45 switchStatusFilterToNonwaking];
  }

  int v47 = [*(id *)(a1 + 40) _activePresenceAssertionsExist];
  v48 = [*(id *)(a1 + 40) pushManager];
  v49 = v48;
  if (v47) {
    [v48 switchPresenceFilterToEnabled];
  }
  else {
    [v48 switchPresenceFilterToNonwaking];
  }

  uint64_t v50 = v38 | v18;
  v51 = +[SKAStatusSubscriptionManager logger];
  BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
  if (v50)
  {
    v54 = v56;
    v53 = v57;
    if (v52)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v74 = (uint64_t)v57;
      v55 = "Subscriptions updated. Subscribed to: %@";
LABEL_56:
      _os_log_impl(&dword_22480C000, v51, OS_LOG_TYPE_DEFAULT, v55, buf, 0xCu);
    }
  }
  else
  {
    v54 = v56;
    v53 = v57;
    if (v52)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v74 = (uint64_t)v56;
      v55 = "No changes for active subscriptions based on current assertions. Subscribed to: %@";
      goto LABEL_56;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_sortAndDedupeSubscriptionIdentifiers:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263EFFA08];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithArray:v4];

  id v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:0 ascending:1 selector:sel_compare_];
  v10[0] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  id v8 = [v5 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (id)_enforceSubscriptionsHardCapOnSubscriptionIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [(SKAStatusSubscriptionManager *)self _hardMaxSubscriptionCount];
  uint64_t v6 = [v4 count];
  if (v6 <= v5)
  {
    uint64_t v13 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218240;
      uint64_t v17 = v6;
      __int16 v18 = 2048;
      int64_t v19 = v5;
      _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Active subscription count %ld does not exceed cap of %ld", (uint8_t *)&v16, 0x16u);
    }

    uint64_t v14 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v7 = (void *)CFPreferencesCopyAppValue(@"lastFaultTime", @"com.apple.StatusKitAgent");
    if (v7
      && ([MEMORY[0x263EFF910] now],
          id v8 = objc_claimAutoreleasedReturnValue(),
          [v8 timeIntervalSinceDate:v7],
          double v10 = v9,
          v8,
          v10 <= 3600.0))
    {
      uint64_t v12 = +[SKAStatusSubscriptionManager logger];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SKAStatusSubscriptionManager _enforceSubscriptionsHardCapOnSubscriptionIdentifiers:]();
      }
    }
    else
    {
      id v11 = +[SKAStatusSubscriptionManager logger];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[SKAStatusSubscriptionManager _enforceSubscriptionsHardCapOnSubscriptionIdentifiers:]();
      }

      uint64_t v12 = [MEMORY[0x263EFF910] now];
      CFPreferencesSetAppValue(@"lastFaultTime", v12, @"com.apple.StatusKitAgent");
    }

    uint64_t v14 = objc_msgSend(v4, "subarrayWithRange:", 0, v5);
  }
  return v14;
}

- (id)_fetchAllClientActiveSubscriptionAssertions
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  os_unfair_lock_t lock = &self->_transientSubscriptionsLock;
  os_unfair_lock_lock(&self->_transientSubscriptionsLock);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v23 = self;
  id v4 = [(NSMapTable *)self->_activeTransientSubscriptionsByClient objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v10 = v9;
        uint64_t v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v34, 16, lock);
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v25 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = [*(id *)(*((void *)&v24 + 1) + 8 * j) subscriptionIdentifier];
              [v3 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
  int v16 = +[SKAStatusSubscriptionManager logger];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v3;
    _os_log_impl(&dword_22480C000, v16, OS_LOG_TYPE_DEFAULT, "Transient subscription assertions: %@", buf, 0xCu);
  }

  uint64_t v17 = (void *)[(SKADatabaseManaging *)v23->_databaseManager newBackgroundContext];
  __int16 v18 = [(SKADatabaseManaging *)v23->_databaseManager allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext:v17];
  int64_t v19 = +[SKAStatusSubscriptionManager logger];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v18;
    _os_log_impl(&dword_22480C000, v19, OS_LOG_TYPE_DEFAULT, "Persistent subscription assertions: %@", buf, 0xCu);
  }

  [v3 addObjectsFromArray:v18];
  uint64_t v20 = (void *)[v3 copy];

  return v20;
}

- (id)_fetchAllActiveSubscriptionAssertionsWithCache
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  os_unfair_lock_t lock = &self->_transientSubscriptionsLock;
  os_unfair_lock_lock(&self->_transientSubscriptionsLock);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v46 = self;
  obuint64_t j = [(NSMapTable *)self->_activeTransientSubscriptionsByClient objectEnumerator];
  uint64_t v5 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v62 != v7) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v57 objects:v69 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v58;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v58 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = [*(id *)(*((void *)&v57 + 1) + 8 * j) subscriptionIdentifier];
              [v3 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v57 objects:v69 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
  int v16 = +[SKAStatusSubscriptionManager logger];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v68 = v3;
    _os_log_impl(&dword_22480C000, v16, OS_LOG_TYPE_DEFAULT, "Transient subscription assertions: %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&v46->_presenceSubscriptionsLock);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obja = [(NSMapTable *)v46->_activePresenceSubscriptionsByClient objectEnumerator];
  uint64_t v17 = [obja countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v54;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v54 != v19) {
          objc_enumerationMutation(obja);
        }
        uint64_t v21 = *(void **)(*((void *)&v53 + 1) + 8 * k);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v65 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v50;
          do
          {
            for (uint64_t m = 0; m != v24; ++m)
            {
              if (*(void *)v50 != v25) {
                objc_enumerationMutation(v22);
              }
              long long v27 = [*(id *)(*((void *)&v49 + 1) + 8 * m) subscriptionIdentifier];
              [v3 addObject:v27];
              [v4 addObject:v27];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v49 objects:v65 count:16];
          }
          while (v24);
        }
      }
      uint64_t v18 = [obja countByEnumeratingWithState:&v53 objects:v66 count:16];
    }
    while (v18);
  }

  os_unfair_lock_unlock(&v46->_presenceSubscriptionsLock);
  long long v28 = +[SKAStatusSubscriptionManager logger];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v68 = v4;
    _os_log_impl(&dword_22480C000, v28, OS_LOG_TYPE_DEFAULT, "Active presence subscription assertions: %@", buf, 0xCu);
  }

  long long v29 = (void *)[(SKADatabaseManaging *)v46->_databaseManager newBackgroundContext];
  long long v30 = [(SKADatabaseManaging *)v46->_databaseManager allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext:v29];
  long long v31 = +[SKAStatusSubscriptionManager logger];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v68 = v30;
    _os_log_impl(&dword_22480C000, v31, OS_LOG_TYPE_DEFAULT, "Persistent subscription assertions: %@", buf, 0xCu);
  }

  [v3 addObjectsFromArray:v30];
  id v32 = [(SKAStatusSubscriptionManager *)v46 _allPersonalChannelIdentifiersRequiringSelfSubscriptionWithDatabaseContext:v29];
  id v33 = +[SKAStatusSubscriptionManager logger];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v68 = v32;
    _os_log_impl(&dword_22480C000, v33, OS_LOG_TYPE_DEFAULT, "Personal channels requiring self subscription: %@", buf, 0xCu);
  }

  [v3 addObjectsFromArray:v32];
  uint64_t v34 = [(SKAStatusSubscriptionManager *)v46 _maxSubscriptionCacheCount];
  uint64_t v35 = [(SKAStatusSubscriptionManager *)v46 _maxPresenceSubscriptionCacheCount];
  uint64_t v36 = [v4 count];
  uint64_t v37 = [v3 count];
  uint64_t v38 = (v34 - v37) & ~((v34 - v37) >> 63);
  uint64_t v39 = (v35 - v36) & ~((v35 - v36) >> 63);
  v40 = (void *)[v3 copy];
  v41 = [(SKAStatusSubscriptionManager *)v46 _recentlyReleasedTransientSubscriptionAssertionIdentifiersExcludingSubscriptionIdentifiers:v40 count:v38 presenceCount:v39 databaseContext:v29];

  v42 = +[SKAStatusSubscriptionManager logger];
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v68 = v41;
    _os_log_impl(&dword_22480C000, v42, OS_LOG_TYPE_DEFAULT, "Cached channels for subscription: %@", buf, 0xCu);
  }

  [v3 addObjectsFromArray:v41];
  v43 = (void *)[v3 copy];

  return v43;
}

- (id)_fetchAllActivePresenceSubscriptions
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  os_unfair_lock_t lock = &self->_presenceSubscriptionsLock;
  os_unfair_lock_lock(&self->_presenceSubscriptionsLock);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [(NSMapTable *)self->_activePresenceSubscriptionsByClient objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = [*(id *)(*((void *)&v18 + 1) + 8 * j) subscriptionIdentifier];
              [v3 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
  return v3;
}

- (id)_recentlyReleasedTransientSubscriptionAssertionIdentifiersExcludingSubscriptionIdentifiers:(id)a3 count:(int64_t)a4 presenceCount:(int64_t)a5 databaseContext:(id)a6
{
  *(void *)((char *)&v45[1] + 4) = *MEMORY[0x263EF8340];
  id v33 = a3;
  id v9 = a6;
  uint64_t v37 = self;
  id v38 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [(SKAStatusSubscriptionManager *)self _subscriptionTTL];
  double v11 = v10;
  uint64_t v12 = +[SKAStatusSubscriptionManager logger];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v45[0] = a4;
    _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Finding at most %ld cached channels to subscribe to", buf, 0xCu);
  }

  -[SKADatabaseManaging existingRecentTransientSubscriptionHistoriesWithLimit:databaseContext:](self->_databaseManager, "existingRecentTransientSubscriptionHistoriesWithLimit:databaseContext:", [v33 count] + a4, v9);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    int64_t v36 = 0;
    uint64_t v15 = *(void *)v40;
LABEL_5:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v40 != v15) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void **)(*((void *)&v39 + 1) + 8 * v16);
      if ([v38 count] >= a4) {
        goto LABEL_28;
      }
      long long v18 = [(SKAStatusSubscriptionManager *)v37 databaseManager];
      long long v19 = [v17 channelIdentifier];
      long long v20 = [v18 existingChannelForSubscriptionIdentifier:v19 databaseContext:v9];

      if (!v20) {
        break;
      }
      long long v21 = [v20 presenceIdentifier];
      uint64_t v22 = [v21 length];

      if (v22) {
        BOOL v23 = v36 < a5;
      }
      else {
        BOOL v23 = 1;
      }
      if (!v23)
      {

        goto LABEL_28;
      }
      id v24 = v9;
      long long v25 = [MEMORY[0x263EFF910] now];
      long long v26 = [v17 lastSubscriptionDate];
      [v25 timeIntervalSinceDate:v26];
      double v28 = v27;

      if (v28 <= v11)
      {
        long long v29 = [v17 channelIdentifier];
        if ([v29 length])
        {
          id v9 = v24;
          if (([v33 containsObject:v29] & 1) == 0)
          {
            [v38 addObject:v29];
            int64_t v30 = v36;
            if (v22) {
              int64_t v30 = v36 + 1;
            }
            int64_t v36 = v30;
          }
        }
        else
        {
          id v9 = v24;
        }
LABEL_25:

        goto LABEL_26;
      }
      id v9 = v24;
LABEL_26:

      if (v14 == ++v16)
      {
        uint64_t v14 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v14) {
          goto LABEL_5;
        }
        goto LABEL_28;
      }
    }
    long long v29 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusSubscriptionManager _recentlyReleasedTransientSubscriptionAssertionIdentifiersExcludingSubscriptionIdentifiers:count:presenceCount:databaseContext:](buf, v17, v45, v29);
    }
    goto LABEL_25;
  }
LABEL_28:

  long long v31 = [v38 allObjects];

  return v31;
}

- (id)_allPersonalChannelIdentifiersRequiringSelfSubscriptionWithDatabaseContext:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = [(SKAStatusSubscriptionManager *)self _statusTypeIdentifiersRequiringSelfSubscription];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v21;
    *(void *)&long long v8 = 138412290;
    long long v19 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = -[SKADatabaseManaging existingPersonalChannelForStatusTypeIdentifier:databaseContext:](self->_databaseManager, "existingPersonalChannelForStatusTypeIdentifier:databaseContext:", v12, v4, v19);
        uint64_t v14 = v13;
        if (v13)
        {
          uint64_t v15 = [v13 identifier];
          if ([v15 length])
          {
            [v5 addObject:v15];
          }
          else
          {
            uint64_t v16 = +[SKAStatusSubscriptionManager logger];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v19;
              long long v25 = v14;
              _os_log_error_impl(&dword_22480C000, v16, OS_LOG_TYPE_ERROR, "Personal channel has no identifier: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          uint64_t v15 = +[SKAStatusSubscriptionManager logger];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v19;
            long long v25 = v12;
            _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "No personal channel for statusTypeIdentifier: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v9);
  }
  uint64_t v17 = (void *)[v5 copy];

  return v17;
}

- (id)_statusTypeIdentifiersRequiringSelfSubscription
{
  return &unk_26D7BA148;
}

- (BOOL)_activeTransientAssertionsExist
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_transientSubscriptionsLocuint64_t k = &self->_transientSubscriptionsLock;
  os_unfair_lock_lock(&self->_transientSubscriptionsLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(NSMapTable *)self->_activeTransientSubscriptionsByClient objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) count])
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_transientSubscriptionsLock);
  return v5;
}

- (BOOL)_activePresenceAssertionsExist
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_presenceSubscriptionsLocuint64_t k = &self->_presenceSubscriptionsLock;
  os_unfair_lock_lock(&self->_presenceSubscriptionsLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(NSMapTable *)self->_activePresenceSubscriptionsByClient objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) count])
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_presenceSubscriptionsLock);
  return v5;
}

- (id)_filterSubscriptionIdentifierToStatus:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = [(SKAStatusSubscriptionManager *)self databaseManager];
  uint64_t v7 = (void *)[v6 newBackgroundContext];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = [(SKAStatusSubscriptionManager *)self databaseManager];
        uint64_t v15 = [v14 existingChannelForSubscriptionIdentifier:v13 databaseContext:v7];

        if (v15 && ![v15 channelType]) {
          [v5 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v5;
}

+ (id)_tooManySubscriptionsError
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79850];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"There are too many presence subscriptions";
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [v2 errorWithDomain:v3 code:-7009 userInfo:v4];

  return v5;
}

- (id)_filterSubscriptionIdentifierToPresence:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = [(SKAStatusSubscriptionManager *)self databaseManager];
  uint64_t v7 = (void *)[v6 newBackgroundContext];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = [(SKAStatusSubscriptionManager *)self databaseManager];
        uint64_t v15 = [v14 existingChannelForSubscriptionIdentifier:v13 databaseContext:v7];

        if (v15 && [v15 channelType] == 1) {
          [v5 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v5;
}

- (int64_t)_maxSubscriptionCacheCount
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  uint64_t v3 = [v2 objectForKey:@"shared-channels-subscription-cache-size"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v4 = (int)[v3 intValue];
    id v5 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int64_t v8 = v4;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our max subscription count should be %lu", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    int64_t v4 = 35;
  }

  return v4;
}

- (int64_t)_maxPresenceSubscriptionCacheCount
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  uint64_t v3 = [v2 objectForKey:@"activity-presence-max-subscription-size"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v4 = (int)[v3 intValue];
    id v5 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int64_t v8 = v4;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our max presence subscription count should be %lu", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    int64_t v4 = 8;
  }

  return v4;
}

- (int64_t)_hardMaxSubscriptionCount
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  uint64_t v3 = [v2 objectForKey:@"shared-channels-max-subscription-size-v2"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v4 = (int)[v3 intValue];
    id v5 = +[SKAStatusSubscriptionManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int64_t v8 = v4;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our hard max subscription count should be %lu", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    int64_t v4 = 43;
  }

  return v4;
}

- (double)_subscriptionTTL
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  uint64_t v3 = [v2 objectForKey:@"shared-channels-subscription-ttl-minutes"];

  double v4 = 86400.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v4 = (double)(int)(60 * [v3 intValue]);
      id v5 = +[SKAStatusSubscriptionManager logger];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        double v8 = v4;
        _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our subscription TTL should be %f seconds", (uint8_t *)&v7, 0xCu);
      }
    }
  }

  return v4;
}

+ (id)logger
{
  if (logger_onceToken_19 != -1) {
    dispatch_once(&logger_onceToken_19, &__block_literal_global_19);
  }
  v2 = (void *)logger__logger_19;
  return v2;
}

uint64_t __38__SKAStatusSubscriptionManager_logger__block_invoke()
{
  logger__logger_19 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAStatusSubscriptionManager");
  return MEMORY[0x270F9A758]();
}

- (NSMapTable)activeTransientSubscriptionsByClient
{
  return self->_activeTransientSubscriptionsByClient;
}

- (void)setActiveTransientSubscriptionsByClient:(id)a3
{
}

- (NSMapTable)activePresenceSubscriptionsByClient
{
  return self->_activePresenceSubscriptionsByClient;
}

- (void)setActivePresenceSubscriptionsByClient:(id)a3
{
}

- (SKADatabaseManaging)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (SKAChannelManaging)channelManager
{
  return self->_channelManager;
}

- (void)setChannelManager:(id)a3
{
}

- (SKAPushManaging)pushManager
{
  return self->_pushManager;
}

- (void)setPushManager:(id)a3
{
}

- (OS_dispatch_queue)internalWorkQueue
{
  return self->_internalWorkQueue;
}

- (void)setInternalWorkQueue:(id)a3
{
}

- (os_unfair_lock_s)transientSubscriptionsLock
{
  return self->_transientSubscriptionsLock;
}

- (void)setTransientSubscriptionsLock:(os_unfair_lock_s)a3
{
  self->_transientSubscriptionsLocuint64_t k = a3;
}

- (os_unfair_lock_s)presenceSubscriptionsLock
{
  return self->_presenceSubscriptionsLock;
}

- (void)setPresenceSubscriptionsLock:(os_unfair_lock_s)a3
{
  self->_presenceSubscriptionsLocuint64_t k = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalWorkQueue, 0);
  objc_storeStrong((id *)&self->_pushManager, 0);
  objc_storeStrong((id *)&self->_channelManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_activePresenceSubscriptionsByClient, 0);
  objc_storeStrong((id *)&self->_activeTransientSubscriptionsByClient, 0);
}

void __133__SKAStatusSubscriptionManager_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to update registered subscriptions following transient assertion retain with error: %@", v2, v3, v4, v5, v6);
}

void __134__SKAStatusSubscriptionManager_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __134__SKAStatusSubscriptionManager_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_client_completion___block_invoke_9_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to update registered subscriptions following transient assertion release with error: %@", v2, v3, v4, v5, v6);
}

void __105__SKAStatusSubscriptionManager_releaseAllTransientSubscriptionAssertionsAssociatedWithClient_completion___block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to update registered subscriptions following client disconnect with error: %@", v2, v3, v4, v5, v6);
}

void __149__SKAStatusSubscriptionManager_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "A subscription assertion already exists, no need to create a new one. Existing: %@", v2, v3, v4, v5, v6);
}

void __149__SKAStatusSubscriptionManager_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to update registered subscriptions following persistent assertion retain with error: %@", v2, v3, v4, v5, v6);
}

void __150__SKAStatusSubscriptionManager_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __150__SKAStatusSubscriptionManager_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_12_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to update registered subscriptions following persistent assertion release with error: %@", v2, v3, v4, v5, v6);
}

void __112__SKAStatusSubscriptionManager_releasePresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __112__SKAStatusSubscriptionManager_releasePresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_15_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to update registered subscriptions following presence assertion release with error: %@", v2, v3, v4, v5, v6);
}

void __111__SKAStatusSubscriptionManager_retainPresenceSubscriptionAssertionForSubscriptionIdentifier_client_completion___block_invoke_16_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to update registered subscriptions following presence assertion retain with error: %@", v2, v3, v4, v5, v6);
}

- (void)_enforceSubscriptionsHardCapOnSubscriptionIdentifiers:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_4();
  _os_log_fault_impl(&dword_22480C000, v0, OS_LOG_TYPE_FAULT, "Active subscription count %ld exceeds cap of %ld", v1, 0x16u);
}

- (void)_enforceSubscriptionsHardCapOnSubscriptionIdentifiers:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_4();
  _os_log_error_impl(&dword_22480C000, v0, OS_LOG_TYPE_ERROR, "Active subscription count %ld exceeds cap of %ld", v1, 0x16u);
}

- (void)_recentlyReleasedTransientSubscriptionAssertionIdentifiersExcludingSubscriptionIdentifiers:(uint8_t *)a1 count:(void *)a2 presenceCount:(void *)a3 databaseContext:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  int v7 = [a2 channelIdentifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_22480C000, a4, OS_LOG_TYPE_ERROR, "Channel from history is gone from database: %@", a1, 0xCu);
}

@end