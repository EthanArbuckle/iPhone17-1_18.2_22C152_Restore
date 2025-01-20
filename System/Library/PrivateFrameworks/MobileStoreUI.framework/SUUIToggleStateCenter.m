@interface SUUIToggleStateCenter
+ (id)defaultCenter;
- (BOOL)updateItem:(id)a3;
- (SUUIToggleStateCenter)init;
- (id)itemForIdentifier:(id)a3;
- (void)_notifyObserversOfStateChanges:(id)a3;
- (void)addObserver:(id)a3;
- (void)clearAll;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation SUUIToggleStateCenter

- (SUUIToggleStateCenter)init
{
  v13.receiver = self;
  v13.super_class = (Class)SUUIToggleStateCenter;
  v2 = [(SUUIToggleStateCenter *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIToggleStateCenter", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIToggleStateCenter.observers", 0);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    itemStates = v2->_itemStates;
    v2->_itemStates = v7;

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v10 = *MEMORY[0x263F7B440];
    v11 = [MEMORY[0x263F7B0E8] defaultStore];
    [v9 addObserver:v2 selector:sel__accountStoreChangeNotification_ name:v10 object:v11];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F7B440];
  dispatch_queue_t v5 = [MEMORY[0x263F7B0E8] defaultStore];
  [v3 removeObserver:self name:v4 object:v5];

  v6.receiver = self;
  v6.super_class = (Class)SUUIToggleStateCenter;
  [(SUUIToggleStateCenter *)&v6 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__SUUIToggleStateCenter_addObserver___block_invoke;
  v7[3] = &unk_265400890;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __37__SUUIToggleStateCenter_addObserver___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:0];
    uint64_t v4 = *(void *)(a1 + 32);
    dispatch_queue_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void)clearAll
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUUIToggleStateCenter_clearAll__block_invoke;
  block[3] = &unk_265400980;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

void __33__SUUIToggleStateCenter_clearAll__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  uint64_t v3 = (void *)[v2 copy];

  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfStateChanges:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (id)defaultCenter
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SUUIToggleStateCenter_defaultCenter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultCenter_sOnce != -1) {
    dispatch_once(&defaultCenter_sOnce, block);
  }
  v2 = (void *)defaultCenter_sCenter;
  return v2;
}

uint64_t __38__SUUIToggleStateCenter_defaultCenter__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = defaultCenter_sCenter;
  defaultCenter_sCenter = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (id)itemForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__53;
  v16 = __Block_byref_object_dispose__53;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUUIToggleStateCenter_itemForIdentifier___block_invoke;
  block[3] = &unk_265406050;
  block[4] = self;
  id v10 = v4;
  long long v11 = &v12;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __43__SUUIToggleStateCenter_itemForIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];

  if (v2)
  {
    objc_super v13 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
    uint64_t v3 = [v13 copy];
    uint64_t v4 = *(void *)(a1[6] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v7 = v13;
  }
  else
  {
    uint64_t v8 = objc_alloc_init(SUUIToggleStateItem);
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(*(void *)(a1[6] + 8) + 40) setItemIdentifier:a1[5]];
    [*(id *)(*(void *)(a1[6] + 8) + 40) setToggled:0xFFFFFFFFLL];
    [*(id *)(*(void *)(a1[6] + 8) + 40) setCount:-1];
    [*(id *)(a1[4] + 16) setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKey:a1[5]];
    uint64_t v6 = [*(id *)(*(void *)(a1[6] + 8) + 40) copy];
    uint64_t v11 = *(void *)(a1[6] + 8);
    id v7 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v6;
  }
  return MEMORY[0x270F9A758](v6, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__SUUIToggleStateCenter_removeObserver___block_invoke;
  v7[3] = &unk_265400890;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

uint64_t __40__SUUIToggleStateCenter_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

- (BOOL)updateItem:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__SUUIToggleStateCenter_updateItem___block_invoke;
  block[3] = &unk_265406050;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)accessQueue;
}

void __36__SUUIToggleStateCenter_updateItem___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [*(id *)(a1 + 40) itemIdentifier];
  id v13 = [v2 objectForKey:v3];

  id v4 = v13;
  if (v13)
  {
    uint64_t v5 = [v13 count];
    if (v5 != [*(id *)(a1 + 40) count])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      objc_msgSend(v13, "setCount:", objc_msgSend(*(id *)(a1 + 40), "count"));
    }
    uint64_t v6 = [*(id *)(a1 + 40) toggledString];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = [*(id *)(a1 + 40) toggledString];
      id v9 = [v13 toggledString];
      char v10 = [v8 isEqualToString:v9];

      if ((v10 & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        uint64_t v11 = [*(id *)(a1 + 40) toggledString];
        [v13 setToggledString:v11];
      }
    }
    int v12 = [v13 toggled];
    if (v12 != [*(id *)(a1 + 40) toggled])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      objc_msgSend(v13, "setToggled:", objc_msgSend(*(id *)(a1 + 40), "toggled"));
    }
    id v4 = v13;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      [*(id *)(a1 + 32) _notifyObserversOfStateChanges:v13];
      id v4 = v13;
    }
  }
}

- (void)_notifyObserversOfStateChanges:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(NSHashTable *)self->_observers copy];
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SUUIToggleStateCenter__notifyObserversOfStateChanges___block_invoke;
  block[3] = &unk_265400958;
  id v10 = v5;
  uint64_t v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(observerQueue, block);
}

void __56__SUUIToggleStateCenter__notifyObserversOfStateChanges___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "itemStateCenter:itemStateChanged:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_itemStates, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end