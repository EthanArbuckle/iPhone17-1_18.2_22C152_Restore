@interface SSVAppleAccountStore
+ (id)sharedAccountStore;
- (ACAccount)primaryAppleAccount;
- (SSVAppleAccountStore)init;
- (void)_accountStoreDidChangeNotification:(id)a3;
@end

@implementation SSVAppleAccountStore

- (SSVAppleAccountStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)SSVAppleAccountStore;
  v2 = [(SSVAppleAccountStore *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreServices.SSVAppleAccountStore", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_dispatchQueue;
    v6 = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v5, v6);
  }
  return v2;
}

+ (id)sharedAccountStore
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SSVAppleAccountStore_sharedAccountStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountStore_sOnce != -1) {
    dispatch_once(&sharedAccountStore_sOnce, block);
  }
  v2 = (void *)sharedAccountStore_sStore;
  return v2;
}

void __42__SSVAppleAccountStore_sharedAccountStore__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedAccountStore_sStore;
  sharedAccountStore_sStore = (uint64_t)v1;
}

- (ACAccount)primaryAppleAccount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SSVAppleAccountStore_primaryAppleAccount__block_invoke;
  v5[3] = &unk_1E5BA6FC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ACAccount *)v3;
}

void __43__SSVAppleAccountStore_primaryAppleAccount__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  if (!v3)
  {
    v4 = *(void **)(v2 + 8);
    if (!v4)
    {
      uint64_t v5 = SSVAccountsFramework();
      id v6 = objc_alloc_init((Class)SSVWeakLinkedClassForString(&cfstr_Acaccountstore.isa, v5));
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(v7 + 8);
      *(void *)(v7 + 8) = v6;

      if (*(void *)(*(void *)(a1 + 32) + 8))
      {
        v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v10 = (void *)SSVAccountsFramework();
        objc_msgSend(v9, "addObserver:selector:name:object:", *(void *)(a1 + 32), sel__accountStoreDidChangeNotification_, *(void *)SSVWeakLinkedSymbolForString("ACAccountStoreDidChangeNotification", v10), *(void *)(*(void *)(a1 + 32) + 8));
      }
      SSVAppleAccountFramework();
      v4 = *(void **)(*(void *)(a1 + 32) + 8);
    }
    uint64_t v11 = objc_msgSend(v4, "aa_primaryAppleAccount");
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 24);
    *(void *)(v12 + 24) = v11;

    id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  v14 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v14, v3);
}

- (void)_accountStoreDidChangeNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SSVAppleAccountStore__accountStoreDidChangeNotification___block_invoke;
  block[3] = &unk_1E5BA7040;
  block[4] = self;
  dispatch_barrier_async(dispatchQueue, block);
}

void __59__SSVAppleAccountStore__accountStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAppleAccount, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end