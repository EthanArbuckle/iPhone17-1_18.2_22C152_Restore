@interface WBSPrimaryAppleAccountObserver
+ (WBSPrimaryAppleAccountObserver)sharedObserver;
- (BOOL)isCurrentAppleIDManaged;
- (BOOL)isUsingICloud;
- (WBSPrimaryAppleAccountObserver)init;
- (void)_registerForUpdates;
- (void)_setAccountIfPrimary:(id)a3;
- (void)_setAccountOnInternalQueue:(id)a3;
- (void)accountWasRemoved:(id)a3;
- (void)getPrimaryAppleAccountAltDSIDWithCompletionHandler:(id)a3;
- (void)getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler:(id)a3;
- (void)getPrimaryAppleAccountWithCompletionHandler:(id)a3;
- (void)needsToVerifyTermsWithCompletionHandler:(id)a3;
@end

@implementation WBSPrimaryAppleAccountObserver

uint64_t __78__WBSPrimaryAppleAccountObserver_getPrimaryAppleAccountWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 24));
}

void __98__WBSPrimaryAppleAccountObserver_getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v3 = (id *)getACAccountDataclassBookmarksSymbolLoc_ptr;
  uint64_t v9 = getACAccountDataclassBookmarksSymbolLoc_ptr;
  if (!getACAccountDataclassBookmarksSymbolLoc_ptr)
  {
    v4 = (void *)AccountsLibrary();
    v7[3] = (uint64_t)dlsym(v4, "ACAccountDataclassBookmarks");
    getACAccountDataclassBookmarksSymbolLoc_ptr = v7[3];
    v3 = (id *)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v3) {
    __98__WBSPrimaryAppleAccountObserver_getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler___block_invoke_cold_1();
  }
  id v5 = *v3;
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v1, [v2 isEnabledForDataclass:v5]);
}

- (void)_registerForUpdates
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1B728F000, v3, OS_LOG_TYPE_ERROR, "Failed to register for account updates: %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)_setAccountOnInternalQueue:(id)a3
{
  v4 = (ACAccount *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  primaryAppleAccount = self->_primaryAppleAccount;
  self->_primaryAppleAccount = v4;
  uint64_t v6 = v4;

  uint64_t v7 = [(ACAccount *)self->_primaryAppleAccount aa_altDSID];
  primaryAppleAccountAltDSID = self->_primaryAppleAccountAltDSID;
  self->_primaryAppleAccountAltDSID = v7;

  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];

  [v9 postNotificationName:@"WBSPrimaryAppleAccountDidChangeNotification" object:self];
}

uint64_t __38__WBSPrimaryAppleAccountObserver_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForUpdates];
}

+ (WBSPrimaryAppleAccountObserver)sharedObserver
{
  if (sharedObserver_onceToken != -1) {
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_51);
  }
  v2 = (void *)sharedObserver_sharedObserver;
  return (WBSPrimaryAppleAccountObserver *)v2;
}

- (void)getPrimaryAppleAccountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__WBSPrimaryAppleAccountObserver_getPrimaryAppleAccountWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E615A870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __48__WBSPrimaryAppleAccountObserver_sharedObserver__block_invoke()
{
  v0 = objc_alloc_init(WBSPrimaryAppleAccountObserver);
  uint64_t v1 = (void *)sharedObserver_sharedObserver;
  sharedObserver_sharedObserver = (uint64_t)v0;
}

- (WBSPrimaryAppleAccountObserver)init
{
  v11.receiver = self;
  v11.super_class = (Class)WBSPrimaryAppleAccountObserver;
  v2 = [(WBSPrimaryAppleAccountObserver *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.SafariCore.WBSPrimaryAppleAccountObserver", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    int v5 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__WBSPrimaryAppleAccountObserver_init__block_invoke;
    block[3] = &unk_1E615A768;
    id v6 = v2;
    v10 = v6;
    dispatch_async(v5, block);
    uint64_t v7 = v6;
  }
  return v2;
}

- (void)getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__WBSPrimaryAppleAccountObserver_getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E615A870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getPrimaryAppleAccountAltDSIDWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__WBSPrimaryAppleAccountObserver_getPrimaryAppleAccountAltDSIDWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E615A870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __85__WBSPrimaryAppleAccountObserver_getPrimaryAppleAccountAltDSIDWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 32));
}

- (void)_setAccountIfPrimary:(id)a3
{
  id v4 = a3;
  int v5 = getAAAccountClassPrimary();
  int v6 = objc_msgSend(v4, "aa_isAccountClass:", v5);

  if (v6)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__WBSPrimaryAppleAccountObserver__setAccountIfPrimary___block_invoke;
    v8[3] = &unk_1E615A6C8;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(queue, v8);
  }
}

uint64_t __55__WBSPrimaryAppleAccountObserver__setAccountIfPrimary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAccountOnInternalQueue:*(void *)(a1 + 40)];
}

- (BOOL)isCurrentAppleIDManaged
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__WBSPrimaryAppleAccountObserver_isCurrentAppleIDManaged__block_invoke;
  v5[3] = &unk_1E615A970;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__WBSPrimaryAppleAccountObserver_isCurrentAppleIDManaged__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "aa_isManagedAppleID");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isUsingICloud
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__WBSPrimaryAppleAccountObserver_isUsingICloud__block_invoke;
  v5[3] = &unk_1E615A970;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__WBSPrimaryAppleAccountObserver_isUsingICloud__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24) != 0;
  return result;
}

- (void)needsToVerifyTermsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__WBSPrimaryAppleAccountObserver_needsToVerifyTermsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E615A870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __74__WBSPrimaryAppleAccountObserver_needsToVerifyTermsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "aa_needsToVerifyTerms");
  char v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)accountWasRemoved:(id)a3
{
  id v4 = a3;
  int v5 = getAAAccountClassPrimary();
  int v6 = objc_msgSend(v4, "aa_isAccountClass:", v5);

  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__WBSPrimaryAppleAccountObserver_accountWasRemoved___block_invoke;
    block[3] = &unk_1E615A768;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __52__WBSPrimaryAppleAccountObserver_accountWasRemoved___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAccountOnInternalQueue:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAppleAccountAltDSID, 0);
  objc_storeStrong((id *)&self->_primaryAppleAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __98__WBSPrimaryAppleAccountObserver_getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler___block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getACAccountDataclassBookmarks(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSPrimaryAppleAccountObserver.m", 15, @"%s", dlerror());

  __break(1u);
}

@end