@interface SUScriptStoreBagLoader
- (SUScriptStoreBagLoader)init;
- (id)scriptStoreBagDictionary;
- (void)_updateWithBagDictionary:(id)a3 allowsPostingBagDidChangeNotification:(BOOL)a4;
- (void)bagDidChange:(id)a3;
- (void)dealloc;
@end

@implementation SUScriptStoreBagLoader

- (SUScriptStoreBagLoader)init
{
  v8.receiver = self;
  v8.super_class = (Class)SUScriptStoreBagLoader;
  v2 = [(SUScriptStoreBagLoader *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesStoreUI.SUScriptStoreBagLoader", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = [MEMORY[0x263F89548] sharedBagLoadingController];
    v6 = [v5 bagDictionary];
    [(SUScriptStoreBagLoader *)v2 _updateWithBagDictionary:v6 allowsPostingBagDidChangeNotification:0];

    [v5 addBagObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = [MEMORY[0x263F89548] sharedBagLoadingController];
  [v3 removeBagObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SUScriptStoreBagLoader;
  [(SUScriptStoreBagLoader *)&v4 dealloc];
}

- (id)scriptStoreBagDictionary
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__SUScriptStoreBagLoader_scriptStoreBagDictionary__block_invoke;
  v5[3] = &unk_2648125D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __50__SUScriptStoreBagLoader_scriptStoreBagDictionary__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  if (!v3)
  {
    if (*(void *)(v2 + 16))
    {
      objc_super v4 = [[SUScriptDictionary alloc] initWithDictionary:*(void *)(*(void *)(a1 + 32) + 16)];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = v4;

      id v3 = *(void **)(*(void *)(a1 + 32) + 24);
    }
    else
    {
      id v3 = 0;
    }
  }
  v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v7, v3);
}

- (void)bagDidChange:(id)a3
{
}

- (void)_updateWithBagDictionary:(id)a3 allowsPostingBagDidChangeNotification:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  bagDictionary = self->_bagDictionary;
  if (!v6 && bagDictionary
    || v6 && !bagDictionary
    || v6 && bagDictionary && ![(NSDictionary *)bagDictionary isEqualToDictionary:v6])
  {
    accessQueue = self->_accessQueue;
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __89__SUScriptStoreBagLoader__updateWithBagDictionary_allowsPostingBagDidChangeNotification___block_invoke;
    v13 = &unk_264812290;
    v14 = self;
    id v15 = v6;
    dispatch_sync(accessQueue, &v10);
    if (v4)
    {
      v9 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v10, v11, v12, v13, v14);
      [v9 postNotificationName:@"SUScriptStoreBagDidChangeNotification" object:self];
    }
  }
}

void __89__SUScriptStoreBagLoader__updateWithBagDictionary_allowsPostingBagDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptStoreBagDictionary, 0);
  objc_storeStrong((id *)&self->_bagDictionary, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end