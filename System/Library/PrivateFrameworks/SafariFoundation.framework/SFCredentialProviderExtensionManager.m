@interface SFCredentialProviderExtensionManager
+ (SFCredentialProviderExtensionManager)sharedManager;
- (BOOL)atLeastOneAvailableExtensionSupportsCredentialExchange:(id)a3;
- (BOOL)atLeastOneEnabledExtensionSupportsOneTimeCodes;
- (BOOL)atLeastOneEnabledExtensionSupportsPasskeys;
- (BOOL)canEnableCredentialProviderExtension;
- (BOOL)extensionIsEnabled:(id)a3;
- (BOOL)extensionSupportsConditionalPasskeyRegistration:(id)a3;
- (BOOL)extensionSupportsCredentialExchange:(id)a3;
- (BOOL)extensionSupportsOneTimeCodes:(id)a3;
- (BOOL)extensionSupportsPasskeys:(id)a3;
- (BOOL)extensionSupportsPasswords:(id)a3;
- (BOOL)extensionSupportsTextInsertion:(id)a3;
- (BOOL)shouldShowConfigurationUIForEnablingExtension:(id)a3;
- (NSArray)enabledExtensions;
- (NSArray)getEnabledExtensionsSynchronously;
- (NSSet)extensions;
- (NSSet)extensionsSync;
- (SFCredentialProviderExtensionManager)init;
- (id)_extensions;
- (id)displayNameForExtension:(id)a3;
- (id)enabledExtensionWithContainingAppBundleID:(id)a3;
- (id)supportedCredentialTypesStringForExtension:(id)a3;
- (unint64_t)numberOfAutoFillProvidersEnabled;
- (void)_addObserverOnInternalQueue:(id)a3 shouldHoldWeakly:(BOOL)a4;
- (void)_beginExtensionDiscovery;
- (void)_endExtensionDiscovery;
- (void)_notifyObservers:(id)a3;
- (void)_observerWasRemovedOnInternalQueue;
- (void)_updateExtensions:(id)a3;
- (void)addObserver:(id)a3;
- (void)addWeakObserver:(id)a3;
- (void)dealloc;
- (void)getEnabledExtensionsWithCompletion:(id)a3;
- (void)getExtensionWithBundleID:(id)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
- (void)sentinelDidDeallocateWithContext:(id)a3;
- (void)setExtension:(id)a3 isEnabled:(BOOL)a4;
- (void)test_overrideAtLeastOneExtensionSupportsPasskeys:(BOOL)a3;
@end

@implementation SFCredentialProviderExtensionManager

uint64_t __58__SFCredentialProviderExtensionManager__updateExtensions___block_invoke(uint64_t a1, void *a2)
{
  return extensionAndContainingAppHaveDeveloperEntitlement(a2);
}

uint64_t __52__SFCredentialProviderExtensionManager_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addObserverOnInternalQueue:*(void *)(a1 + 40) shouldHoldWeakly:0];
}

+ (SFCredentialProviderExtensionManager)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SFCredentialProviderExtensionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_sharedManager;
  return (SFCredentialProviderExtensionManager *)v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__SFCredentialProviderExtensionManager_addObserver___block_invoke;
  v7[3] = &unk_2643906A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __64__SFCredentialProviderExtensionManager__beginExtensionDiscovery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__SFCredentialProviderExtensionManager__beginExtensionDiscovery__block_invoke_2;
    block[3] = &unk_2643908C8;
    block[4] = WeakRetained;
    id v11 = v6;
    id v12 = v5;
    dispatch_async(v9, block);
  }
}

uint64_t __53__SFCredentialProviderExtensionManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedManager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (SFCredentialProviderExtensionManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)SFCredentialProviderExtensionManager;
  v2 = [(SFCredentialProviderExtensionManager *)&v12 init];
  if (v2)
  {
    id v3 = [NSString stringWithFormat:@"com.apple.AuthenticationServices.%@.%p", objc_opt_class(), v2];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x263EFF9B0] orderedSet];
    observers = v2->_observers;
    v2->_observers = (NSMutableOrderedSet *)v6;

    v2->_observerLock.ourl_lock._os_unfair_lock_opaque = 0;
    v2->_observerLock.ourl_count = 0;
    uint64_t v8 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    weakObservers = v2->_weakObservers;
    v2->_weakObservers = (NSHashTable *)v8;

    v10 = v2;
  }

  return v2;
}

- (void)_updateExtensions:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "safari_filterObjectsUsingBlock:", &__block_literal_global_4);
  id v10 = (id)v4;
  if (v4) {
    [MEMORY[0x263EFFA08] setWithArray:v4];
  }
  else {
  id v5 = [MEMORY[0x263EFFA08] set];
  }
  extensions = self->_extensions;
  self->_extensions = v5;

  v7 = [(NSMutableOrderedSet *)self->_observers array];
  uint64_t v8 = [(NSHashTable *)self->_weakObservers allObjects];
  v9 = [v7 arrayByAddingObjectsFromArray:v8];

  [(SFCredentialProviderExtensionManager *)self _notifyObservers:v9];
}

- (void)_addObserverOnInternalQueue:(id)a3 shouldHoldWeakly:(BOOL)a4
{
  BOOL v4 = a4;
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(NSMutableOrderedSet *)self->_observers count];
  uint64_t v8 = [(NSHashTable *)self->_weakObservers allObjects];
  uint64_t v9 = [v8 count];

  if (v4)
  {
    [(NSHashTable *)self->_weakObservers addObject:v6];
    objc_msgSend(v6, "safari_setDeallocationSentinelForObserver:", self);
  }
  else
  {
    [(NSMutableOrderedSet *)self->_observers addObject:v6];
  }
  unint64_t v10 = v9 + v7;
  uint64_t v11 = [(NSMutableOrderedSet *)self->_observers count];
  objc_super v12 = [(NSHashTable *)self->_weakObservers allObjects];
  unint64_t v13 = [v12 count] + v11;

  if (v13 == 1) {
    [(SFCredentialProviderExtensionManager *)self _beginExtensionDiscovery];
  }
  if (v13 > v10 && self->_extensions)
  {
    v15[0] = v6;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    [(SFCredentialProviderExtensionManager *)self _notifyObservers:v14];
  }
}

- (void)_beginExtensionDiscovery
{
  if (!self->_extensionMatchingToken)
  {
    objc_initWeak(&location, self);
    id v3 = (void *)MEMORY[0x263F08800];
    BOOL v4 = extensionMatchingAttributes(0);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __64__SFCredentialProviderExtensionManager__beginExtensionDiscovery__block_invoke;
    v7[3] = &unk_264390CA8;
    objc_copyWeak(&v8, &location);
    id v5 = [v3 beginMatchingExtensionsWithAttributes:v4 completion:v7];
    id extensionMatchingToken = self->_extensionMatchingToken;
    self->_id extensionMatchingToken = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_notifyObservers:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  id v5 = (void *)MEMORY[0x21D47D8F0]();
  uint64_t v6 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
  uint64_t v7 = (void *)v19[5];
  v19[5] = v6;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        [(id)v19[5] addPointer:*(void *)(*((void *)&v14 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v24 count:16];
    }
    while (v9);
  }

  objc_super v12 = dispatch_get_global_queue(21, 0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__SFCredentialProviderExtensionManager__notifyObservers___block_invoke;
  v13[3] = &unk_264390CF0;
  v13[4] = self;
  v13[5] = &v18;
  dispatch_async(v12, v13);

  _Block_object_dispose(&v18, 8);
}

uint64_t __57__SFCredentialProviderExtensionManager__notifyObservers___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = os_unfair_recursive_lock_lock_with_options();
  id v3 = (void *)MEMORY[0x21D47D8F0](v2);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8++), "credentialProviderExtensionManagerExtensionListDidChange:", *(void *)(a1 + 32), (void)v12);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCount:0];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;

  return os_unfair_recursive_lock_unlock();
}

uint64_t __64__SFCredentialProviderExtensionManager__beginExtensionDiscovery__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 48) = *(void *)(result + 40) != 0;
  if (!*(void *)(result + 40)) {
    return [*(id *)(result + 32) _updateExtensions:*(void *)(result + 48)];
  }
  return result;
}

- (void)dealloc
{
  if (self->_extensionMatchingToken) {
    objc_msgSend(MEMORY[0x263F08800], "endMatchingExtensions:");
  }
  v3.receiver = self;
  v3.super_class = (Class)SFCredentialProviderExtensionManager;
  [(SFCredentialProviderExtensionManager *)&v3 dealloc];
}

- (void)getExtensionWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __76__SFCredentialProviderExtensionManager_getExtensionWithBundleID_completion___block_invoke;
    v10[3] = &unk_264390C30;
    id v12 = v7;
    id v11 = v6;
    dispatch_async(queue, v10);
  }
}

void __76__SFCredentialProviderExtensionManager_getExtensionWithBundleID_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__0;
  uint64_t v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  uint64_t v2 = (void *)MEMORY[0x263F08800];
  objc_super v3 = extensionMatchingAttributes(1);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__SFCredentialProviderExtensionManager_getExtensionWithBundleID_completion___block_invoke_7;
  v6[3] = &unk_264390C08;
  uint64_t v9 = v11;
  id v8 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  uint64_t v10 = &v13;
  uint64_t v4 = [v2 beginMatchingExtensionsWithAttributes:v3 completion:v6];
  uint64_t v5 = (void *)v14[5];
  v14[5] = v4;

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);
}

void __76__SFCredentialProviderExtensionManager_getExtensionWithBundleID_completion___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v8 + 24))
  {
    *(unsigned char *)(v8 + 24) = 1;
    uint64_t v23 = *(void *)(a1 + 40);
    id v24 = v6;
    id v9 = *(id *)(a1 + 32);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = (id)objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_167);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v16 = objc_msgSend(v15, "sf_bundleIdentifierForContainingApp");
          char v17 = [v16 isEqualToString:v9];

          if (v17)
          {
            id v19 = v15;

            goto LABEL_14;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v18 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __76__SFCredentialProviderExtensionManager_getExtensionWithBundleID_completion___block_invoke_7_cold_1(v18);
    }
    id v19 = [v10 firstObject];
LABEL_14:
    id v7 = v24;

    (*(void (**)(uint64_t, id))(v23 + 16))(v23, v19);
  }
  uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
  v21 = *(void **)(v20 + 40);
  if (v21)
  {
    *(void *)(v20 + 40) = 0;
    id v22 = v21;

    [MEMORY[0x263F08800] endMatchingExtensions:v22];
  }
}

- (void)getEnabledExtensionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__SFCredentialProviderExtensionManager_getEnabledExtensionsWithCompletion___block_invoke;
    block[3] = &unk_264390C80;
    id v8 = v4;
    dispatch_async(queue, block);
  }
}

void __75__SFCredentialProviderExtensionManager_getEnabledExtensionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  long long v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  uint64_t v2 = (void *)MEMORY[0x263F08800];
  objc_super v3 = extensionMatchingAttributes(1);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __75__SFCredentialProviderExtensionManager_getEnabledExtensionsWithCompletion___block_invoke_2;
  v6[3] = &unk_264390C58;
  id v8 = v10;
  id v7 = *(id *)(a1 + 32);
  id v9 = &v12;
  uint64_t v4 = [v2 beginMatchingExtensionsWithAttributes:v3 completion:v6];
  id v5 = (void *)v13[5];
  v13[5] = v4;

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);
}

void __75__SFCredentialProviderExtensionManager_getEnabledExtensionsWithCompletion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1[5] + 8);
  if (!*(unsigned char *)(v6 + 24))
  {
    *(unsigned char *)(v6 + 24) = 1;
    (*(void (**)(void, uint64_t))(a1[4] + 16))(a1[4], objc_msgSend(v10, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_167));
  }
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  if (v8)
  {
    *(void *)(v7 + 40) = 0;
    id v9 = v8;

    [MEMORY[0x263F08800] endMatchingExtensions:v9];
  }
}

- (void)_endExtensionDiscovery
{
  if (self->_extensionMatchingToken)
  {
    objc_msgSend(MEMORY[0x263F08800], "endMatchingExtensions:");
    id extensionMatchingToken = self->_extensionMatchingToken;
    self->_id extensionMatchingToken = 0;

    extensions = self->_extensions;
    self->_extensions = 0;
  }
}

- (NSSet)extensions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__SFCredentialProviderExtensionManager_extensions__block_invoke;
  v5[3] = &unk_2643908F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

uint64_t __50__SFCredentialProviderExtensionManager_extensions__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _extensions];
  return MEMORY[0x270F9A758]();
}

- (NSSet)extensionsSync
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__SFCredentialProviderExtensionManager_extensionsSync__block_invoke;
  v5[3] = &unk_2643908F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

void __54__SFCredentialProviderExtensionManager_extensionsSync__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = (void *)MEMORY[0x263F08800];
    id v3 = extensionMatchingAttributes(0);
    id v7 = [v2 extensionsWithMatchingAttributes:v3 error:0];

    uint64_t v4 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v7];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)_extensions
{
  if (self->_errorEncounteredDuringLastExtensionDiscovery)
  {
    id extensionMatchingToken = self->_extensionMatchingToken;
    self->_id extensionMatchingToken = 0;

    [(SFCredentialProviderExtensionManager *)self _beginExtensionDiscovery];
  }
  extensions = self->_extensions;
  return extensions;
}

- (NSArray)enabledExtensions
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__SFCredentialProviderExtensionManager_enabledExtensions__block_invoke;
  v5[3] = &unk_2643908F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __57__SFCredentialProviderExtensionManager_enabledExtensions__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _extensions];
  uint64_t v2 = [v3 allObjects];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), (id)objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_167));
}

- (NSArray)getEnabledExtensionsSynchronously
{
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__SFCredentialProviderExtensionManager_getEnabledExtensionsSynchronously__block_invoke;
  block[3] = &unk_264390D18;
  void block[4] = self;
  void block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v16 + 24))
  {
    id v3 = (id)v10[5];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263F08800];
    uint64_t v5 = extensionMatchingAttributes(1);
    uint64_t v6 = [v4 extensionsWithMatchingAttributes:v5 error:0];
    id v3 = (id)objc_msgSend(v6, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_167);
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return (NSArray *)v3;
}

void __73__SFCredentialProviderExtensionManager_getEnabledExtensionsSynchronously__block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  if (*(void *)(v1 + 16) && *(void *)(v1 + 24))
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    id v3 = [*(id *)(a1[4] + 24) allObjects];
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), (id)objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_167));
  }
}

- (id)enabledExtensionWithContainingAppBundleID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SFCredentialProviderExtensionManager *)self getEnabledExtensionsSynchronously];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
      uint64_t v11 = objc_msgSend(v10, "sf_bundleIdentifierForContainingApp", (void)v16);
      char v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v10;

    if (v13) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_9:
  }
  id v14 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[SFCredentialProviderExtensionManager enabledExtensionWithContainingAppBundleID:](v14);
  }
  id v13 = 0;
LABEL_14:

  return v13;
}

- (void)addWeakObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__SFCredentialProviderExtensionManager_addWeakObserver___block_invoke;
  v7[3] = &unk_2643906A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __56__SFCredentialProviderExtensionManager_addWeakObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addObserverOnInternalQueue:*(void *)(a1 + 40) shouldHoldWeakly:1];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SFCredentialProviderExtensionManager_removeObserver___block_invoke;
  v7[3] = &unk_2643906A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
  os_unfair_recursive_lock_unlock();
}

uint64_t __55__SFCredentialProviderExtensionManager_removeObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _observerWasRemovedOnInternalQueue];
}

- (void)_observerWasRemovedOnInternalQueue
{
  uint64_t v3 = [(NSMutableOrderedSet *)self->_observers count];
  id v4 = [(NSHashTable *)self->_weakObservers allObjects];
  uint64_t v5 = [v4 count];

  if (!(v3 + v5))
  {
    [(SFCredentialProviderExtensionManager *)self _endExtensionDiscovery];
  }
}

- (BOOL)extensionIsEnabled:(id)a3
{
  return extensionIsEnabled(a3);
}

- (void)setExtension:(id)a3 isEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6 && [(SFCredentialProviderExtensionManager *)self extensionIsEnabled:v6] != v4)
  {
    if (!v4)
    {
      uint64_t v7 = 2;
      goto LABEL_7;
    }
    if ([(SFCredentialProviderExtensionManager *)self canEnableCredentialProviderExtension])
    {
      uint64_t v7 = 1;
LABEL_7:
      id v8 = [v6 _plugIn];
      [v8 setUserElection:v7];

      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__SFCredentialProviderExtensionManager_setExtension_isEnabled___block_invoke;
      block[3] = &unk_264390880;
      void block[4] = self;
      dispatch_async(queue, block);
    }
  }
}

void __63__SFCredentialProviderExtensionManager_setExtension_isEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) array];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) allObjects];
  id v4 = [v2 arrayByAddingObjectsFromArray:v3];

  [*(id *)(a1 + 32) _notifyObservers:v4];
}

- (unint64_t)numberOfAutoFillProvidersEnabled
{
  uint64_t v2 = +[SFCredentialProviderExtensionManager sharedManager];
  uint64_t v3 = [v2 getEnabledExtensionsSynchronously];

  id v4 = +[SFAutoFillFeatureManager sharedFeatureManager];
  unsigned int v5 = [v4 shouldAutoFillPasswordsFromKeychain];

  unint64_t v6 = [v3 count] + v5;
  return v6;
}

- (BOOL)canEnableCredentialProviderExtension
{
  return [(SFCredentialProviderExtensionManager *)self numberOfAutoFillProvidersEnabled] < 3;
}

- (id)displayNameForExtension:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 _plugIn];
  unint64_t v6 = [v5 containingUrl];

  uint64_t v7 = [v4 _plugIn];
  id v8 = [v7 localizedContainingName];

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  uint64_t v9 = [(SFCredentialProviderExtensionManager *)self extensionsSync];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  long long v18 = __64__SFCredentialProviderExtensionManager_displayNameForExtension___block_invoke;
  long long v19 = &unk_264390D40;
  id v10 = v6;
  id v20 = v10;
  uint64_t v21 = v22;
  uint64_t v11 = [v9 objectsPassingTest:&v16];

  if ([v11 count] == 1)
  {
    id v12 = v8;
  }
  else
  {
    id v13 = NSString;
    id v14 = [v4 objectForInfoDictionaryKey:*MEMORY[0x263EFFA90]];
    id v12 = [v13 stringWithFormat:@"%@ — %@", v8, v14, v16, v17, v18, v19];
  }
  _Block_object_dispose(v22, 8);

  return v12;
}

uint64_t __64__SFCredentialProviderExtensionManager_displayNameForExtension___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  unsigned int v5 = [a2 _plugIn];
  unint64_t v6 = [v5 containingUrl];
  uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(unsigned char *)(v8 + 24)) {
      *a3 = 1;
    }
    else {
      *(unsigned char *)(v8 + 24) = 1;
    }
  }
  return v7;
}

- (BOOL)shouldShowConfigurationUIForEnablingExtension:(id)a3
{
  id v3 = a3;
  id v4 = [v3 attributes];
  unsigned int v5 = objc_msgSend(v4, "safari_dictionaryForKey:", @"ASCredentialProviderExtensionCapabilities");

  unint64_t v6 = objc_msgSend(v5, "safari_numberForKey:", @"ShowsConfigurationUI");
  uint64_t v7 = v6;
  if (v6)
  {
    char v8 = [v6 BOOLValue];
  }
  else
  {
    uint64_t v9 = [v3 attributes];
    char v8 = objc_msgSend(v9, "safari_BOOLForKey:", @"ASCredentialProviderExtensionShowsConfigurationUI");
  }
  return v8;
}

- (BOOL)extensionSupportsPasskeys:(id)a3
{
  id v3 = [a3 attributes];
  id v4 = objc_msgSend(v3, "safari_dictionaryForKey:", @"ASCredentialProviderExtensionCapabilities");

  LOBYTE(v3) = objc_msgSend(v4, "safari_BOOLForKey:", @"ProvidesPasskeys");
  return (char)v3;
}

- (BOOL)extensionSupportsConditionalPasskeyRegistration:(id)a3
{
  id v3 = [a3 attributes];
  id v4 = objc_msgSend(v3, "safari_dictionaryForKey:", @"ASCredentialProviderExtensionCapabilities");

  LOBYTE(v3) = objc_msgSend(v4, "safari_BOOLForKey:", @"SupportsConditionalPasskeyRegistration");
  return (char)v3;
}

- (BOOL)atLeastOneEnabledExtensionSupportsPasskeys
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_shouldOverrideAtLeastOneExtensionSupportsPasskeys)
  {
    LOBYTE(v3) = self->_overrideAtLeastOneExtensionSupportsPasskeysValue;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = [(SFCredentialProviderExtensionManager *)self getEnabledExtensionsSynchronously];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      int v3 = 0;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          v3 |= [(SFCredentialProviderExtensionManager *)self extensionSupportsPasskeys:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3 & 1;
}

- (void)test_overrideAtLeastOneExtensionSupportsPasskeys:(BOOL)a3
{
  self->_shouldOverrideAtLeastOneExtensionSupportsPasskeys = 1;
  self->_overrideAtLeastOneExtensionSupportsPasskeysValue = a3;
}

- (BOOL)atLeastOneEnabledExtensionSupportsOneTimeCodes
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v3 = [(SFCredentialProviderExtensionManager *)self getEnabledExtensionsSynchronously];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([(SFCredentialProviderExtensionManager *)self extensionSupportsOneTimeCodes:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)extensionSupportsOneTimeCodes:(id)a3
{
  int v3 = [a3 attributes];
  uint64_t v4 = objc_msgSend(v3, "safari_dictionaryForKey:", @"ASCredentialProviderExtensionCapabilities");

  LOBYTE(v3) = objc_msgSend(v4, "safari_BOOLForKey:", @"ProvidesOneTimeCodes");
  return (char)v3;
}

- (BOOL)extensionSupportsTextInsertion:(id)a3
{
  int v3 = [a3 attributes];
  uint64_t v4 = objc_msgSend(v3, "safari_dictionaryForKey:", @"ASCredentialProviderExtensionCapabilities");

  LOBYTE(v3) = objc_msgSend(v4, "safari_BOOLForKey:", @"ProvidesTextToInsert");
  return (char)v3;
}

- (BOOL)extensionSupportsPasswords:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 attributes];
  uint64_t v5 = objc_msgSend(v4, "safari_dictionaryForKey:", @"ASCredentialProviderExtensionCapabilities");

  if (v5 && objc_msgSend(v3, "_sf_credentialProviderExtensionNeedsToDeclarePasswordSupport")) {
    char v6 = objc_msgSend(v5, "safari_BOOLForKey:", @"ProvidesPasswords");
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (id)supportedCredentialTypesStringForExtension:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SFCredentialProviderExtensionManager *)self extensionSupportsPasswords:v4];
  BOOL v6 = [(SFCredentialProviderExtensionManager *)self extensionSupportsPasskeys:v4];
  BOOL v7 = [(SFCredentialProviderExtensionManager *)self extensionSupportsOneTimeCodes:v4];

  if (v5 || v6 || v7)
  {
    _WBSLocalizedString();
    BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v8 = &stru_26CA7A2D0;
  }
  return v8;
}

- (BOOL)extensionSupportsCredentialExchange:(id)a3
{
  id v3 = [a3 attributes];
  id v4 = objc_msgSend(v3, "safari_dictionaryForKey:", @"ASCredentialProviderExtensionCapabilities");

  LOBYTE(v3) = objc_msgSend(v4, "safari_BOOLForKey:", @"SupportsCredentialExchange");
  return (char)v3;
}

- (BOOL)atLeastOneAvailableExtensionSupportsCredentialExchange:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v5 = [(SFCredentialProviderExtensionManager *)self extensionsSync];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "sf_bundleIdentifierForContainingApp");
        char v12 = [v4 isEqualToString:v11];

        if ((v12 & 1) == 0
          && [(SFCredentialProviderExtensionManager *)self extensionSupportsCredentialExchange:v10])
        {

          char v13 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if ([v4 isEqualToString:*MEMORY[0x263F664C8]]) {
    char v13 = 0;
  }
  else {
    char v13 = [MEMORY[0x263F662A0] isPasswordsAppInstalled];
  }
LABEL_14:

  return v13;
}

- (void)sentinelDidDeallocateWithContext:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__SFCredentialProviderExtensionManager_sentinelDidDeallocateWithContext___block_invoke;
  block[3] = &unk_264390880;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __73__SFCredentialProviderExtensionManager_sentinelDidDeallocateWithContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _observerWasRemovedOnInternalQueue];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong(&self->_extensionMatchingToken, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __76__SFCredentialProviderExtensionManager_getExtensionWithBundleID_completion___block_invoke_7_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_218FBF000, log, OS_LOG_TYPE_ERROR, "Wasn't able to find extension among enabled ones.", v1, 2u);
}

- (void)enabledExtensionWithContainingAppBundleID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_218FBF000, log, OS_LOG_TYPE_ERROR, "No enabled extension that would match provided bundleID were found.", v1, 2u);
}

@end