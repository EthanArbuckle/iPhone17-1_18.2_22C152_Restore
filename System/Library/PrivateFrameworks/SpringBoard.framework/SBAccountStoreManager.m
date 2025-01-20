@interface SBAccountStoreManager
- (ACAccount)primaryAppleAccount;
- (ACAccountStore)accountStore;
- (SBAccountStoreManager)init;
- (void)_queue_updatePrimaryAppleAccount;
- (void)_updatePrimaryAppleAccount;
- (void)setPrimaryAppleAccount:(id)a3;
@end

@implementation SBAccountStoreManager

- (SBAccountStoreManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBAccountStoreManager;
  v2 = [(SBAccountStoreManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = BSDispatchQueueCreateWithQualityOfService();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v5;

    [(SBAccountStoreManager *)v2 _updatePrimaryAppleAccount];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__accountStoreDidChange_ name:*MEMORY[0x1E4F178D8] object:0];
  }
  return v2;
}

- (void)_updatePrimaryAppleAccount
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SBAccountStoreManager__updatePrimaryAppleAccount__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__SBAccountStoreManager__updatePrimaryAppleAccount__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updatePrimaryAppleAccount");
}

- (void)_queue_updatePrimaryAppleAccount
{
  uint64_t v3 = [(SBAccountStoreManager *)self accountStore];
  v4 = objc_msgSend(v3, "aa_primaryAppleAccount");

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__SBAccountStoreManager__queue_updatePrimaryAppleAccount__block_invoke;
  v6[3] = &unk_1E6AF5290;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __57__SBAccountStoreManager__queue_updatePrimaryAppleAccount__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPrimaryAppleAccount:*(void *)(a1 + 40)];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SBAccountStoreManagerPrimaryAppleAccountDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (ACAccount)primaryAppleAccount
{
  return self->_primaryAppleAccount;
}

- (void)setPrimaryAppleAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAppleAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end