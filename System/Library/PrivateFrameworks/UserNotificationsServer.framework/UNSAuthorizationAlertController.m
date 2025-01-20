@interface UNSAuthorizationAlertController
- (BOOL)_queue_isAlertActiveForBundleIdentifier:(id)a3;
- (UNSAuthorizationAlertController)initWithQueue:(id)a3;
- (void)_presentAuthorizationAlertForBundleIdentifier:(id)a3 displayName:(id)a4 usageDescription:(id)a5 withResult:(id)a6;
- (void)_queue_addAlertActiveForBundleIdentifier:(id)a3;
- (void)_queue_addResultBlock:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_removeAlertActiveForBundleIdentifier:(id)a3;
- (void)_queue_sendResponse:(int64_t)a3 forBundleIdentifier:(id)a4;
- (void)requestAuthorizationForBundleIdentifier:(id)a3 displayName:(id)a4 usageDescription:(id)a5 withResult:(id)a6;
@end

@implementation UNSAuthorizationAlertController

- (void)requestAuthorizationForBundleIdentifier:(id)a3 displayName:(id)a4 usageDescription:(id)a5 withResult:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(UNSAuthorizationAlertController *)self _queue_addResultBlock:v13 forBundleIdentifier:v10];
  if (![(UNSAuthorizationAlertController *)self _queue_isAlertActiveForBundleIdentifier:v10])
  {
    [(UNSAuthorizationAlertController *)self _queue_addAlertActiveForBundleIdentifier:v10];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __115__UNSAuthorizationAlertController_requestAuthorizationForBundleIdentifier_displayName_usageDescription_withResult___block_invoke;
    block[3] = &unk_26462F510;
    block[4] = self;
    id v15 = v10;
    id v16 = v11;
    id v17 = v12;
    id v18 = v13;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (BOOL)_queue_isAlertActiveForBundleIdentifier:(id)a3
{
  return [(NSMutableSet *)self->_bundleIdentifersForActiveAlerts containsObject:a3];
}

- (void)_queue_addResultBlock:(id)a3 forBundleIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_bundleIdentifiersToResultBlocks objectForKey:v6];
  if (!v7)
  {
    v7 = [MEMORY[0x263EFF980] array];
    [(NSMutableDictionary *)self->_bundleIdentifiersToResultBlocks setObject:v7 forKey:v6];
  }
  v8 = (void *)[v10 copy];
  v9 = _Block_copy(v8);
  [v7 addObject:v9];
}

- (UNSAuthorizationAlertController)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNSAuthorizationAlertController;
  id v6 = [(UNSAuthorizationAlertController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    bundleIdentifersForActiveAlerts = v7->_bundleIdentifersForActiveAlerts;
    v7->_bundleIdentifersForActiveAlerts = v8;

    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    bundleIdentifiersToResultBlocks = v7->_bundleIdentifiersToResultBlocks;
    v7->_bundleIdentifiersToResultBlocks = v10;
  }
  return v7;
}

uint64_t __115__UNSAuthorizationAlertController_requestAuthorizationForBundleIdentifier_displayName_usageDescription_withResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentAuthorizationAlertForBundleIdentifier:*(void *)(a1 + 40) displayName:*(void *)(a1 + 48) usageDescription:*(void *)(a1 + 56) withResult:*(void *)(a1 + 64)];
}

- (void)_presentAuthorizationAlertForBundleIdentifier:(id)a3 displayName:(id)a4 usageDescription:(id)a5 withResult:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __121__UNSAuthorizationAlertController__presentAuthorizationAlertForBundleIdentifier_displayName_usageDescription_withResult___block_invoke;
  v15[3] = &unk_26462F560;
  v15[4] = self;
  objc_copyWeak(&v17, &location);
  id v14 = v10;
  id v16 = v14;
  [(UNSAuthorizationAlertController *)self presentAuthorizationAlertForBundleIdentifier:v14 displayName:v11 usageDescription:v12 withResult:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __121__UNSAuthorizationAlertController__presentAuthorizationAlertForBundleIdentifier_displayName_usageDescription_withResult___block_invoke(uint64_t a1, void *a2)
{
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __121__UNSAuthorizationAlertController__presentAuthorizationAlertForBundleIdentifier_displayName_usageDescription_withResult___block_invoke_2;
  block[3] = &unk_26462F538;
  objc_copyWeak(v7, (id *)(a1 + 48));
  id v6 = *(id *)(a1 + 40);
  v7[1] = a2;
  dispatch_async(v4, block);

  objc_destroyWeak(v7);
}

void __121__UNSAuthorizationAlertController__presentAuthorizationAlertForBundleIdentifier_displayName_usageDescription_withResult___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_removeAlertActiveForBundleIdentifier:", *(void *)(a1 + 32));

  id v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "_queue_sendResponse:forBundleIdentifier:", *(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_queue_addAlertActiveForBundleIdentifier:(id)a3
{
}

- (void)_queue_removeAlertActiveForBundleIdentifier:(id)a3
{
}

- (void)_queue_sendResponse:(int64_t)a3 forBundleIdentifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(NSMutableDictionary *)self->_bundleIdentifiersToResultBlocks objectForKey:v5];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
  [(NSMutableDictionary *)self->_bundleIdentifiersToResultBlocks removeObjectForKey:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiersToResultBlocks, 0);
  objc_storeStrong((id *)&self->_bundleIdentifersForActiveAlerts, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end