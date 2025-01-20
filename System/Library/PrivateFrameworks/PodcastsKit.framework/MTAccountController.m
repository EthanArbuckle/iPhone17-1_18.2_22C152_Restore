@interface MTAccountController
+ (BOOL)iTunesAccountDidChangeForACAccountNotification:(id)a3;
- (ACAccount)_activeAccount;
- (ACAccount)accountOverride;
- (BOOL)activeAccountIsManagedAppleID;
- (BOOL)hasFetchedInitialAccount;
- (BOOL)isPrimaryUserActiveAccount;
- (BOOL)isUserLoggedIn;
- (MTAccountController)init;
- (NSMutableSet)declinedAuthRequests;
- (NSMutableSet)inFlightAuthRequests;
- (id)_activeAccountBlocking;
- (id)activeAccount;
- (id)activeDsid;
- (id)activeEmail;
- (id)activeFullName;
- (id)activeStorefront;
- (void)_updateActiveAccount;
- (void)dealloc;
- (void)didChangeStoreAccount:(id)a3;
- (void)fetchActiveAccountWithCompletion:(id)a3;
- (void)setAccountOverride:(id)a3;
- (void)setActiveAccount:(id)a3;
- (void)setDeclinedAuthRequests:(id)a3;
- (void)setHasFetchedInitialAccount:(BOOL)a3;
- (void)setInFlightAuthRequests:(id)a3;
- (void)set_activeAccount:(id)a3;
@end

@implementation MTAccountController

- (MTAccountController)init
{
  v13.receiver = self;
  v13.super_class = (Class)MTAccountController;
  v2 = [(MTAccountController *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.podcasts.MTAccountController.accountQueue", 0);
    accountQueue = v2->_accountQueue;
    v2->_accountQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.podcasts.MTAccountController.callbackQueue", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    [(MTAccountController *)v2 _updateActiveAccount];
    uint64_t v7 = objc_opt_new();
    inFlightAuthRequests = v2->_inFlightAuthRequests;
    v2->_inFlightAuthRequests = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    declinedAuthRequests = v2->_declinedAuthRequests;
    v2->_declinedAuthRequests = (NSMutableSet *)v9;

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v2 selector:sel_didChangeStoreAccount_ name:*MEMORY[0x263EFB060] object:0];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTAccountController;
  [(MTAccountController *)&v4 dealloc];
}

- (id)activeAccount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  accountQueue = self->_accountQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__MTAccountController_activeAccount__block_invoke;
  v5[3] = &unk_2650557D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accountQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__MTAccountController_activeAccount__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  if (!v2) {
    v2 = *(void **)(v1 + 56);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

- (void)setActiveAccount:(id)a3
{
  id v4 = a3;
  accountQueue = self->_accountQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__MTAccountController_setActiveAccount___block_invoke;
  v7[3] = &unk_265055D50;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(accountQueue, v7);
}

void __40__MTAccountController_setActiveAccount___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_23F08F000, v2, OS_LOG_TYPE_DEFAULT, "MTAccountController: Setting active account: %@", (uint8_t *)&v4, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 56), *(id *)(a1 + 32));
}

- (BOOL)isPrimaryUserActiveAccount
{
  uint64_t v3 = [(ACAccount *)self->__activeAccount ams_DSID];
  if (v3)
  {
    int v4 = [(MTAccountController *)self activeDsid];
    uint64_t v5 = [(ACAccount *)self->__activeAccount ams_DSID];
    char v6 = [v4 isEqualToNumber:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)fetchActiveAccountWithCompletion:(id)a3
{
  id v4 = a3;
  accountQueue = self->_accountQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__MTAccountController_fetchActiveAccountWithCompletion___block_invoke;
  v7[3] = &unk_265055DA0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accountQueue, v7);
}

void __56__MTAccountController_fetchActiveAccountWithCompletion___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasFetchedInitialAccount] & 1) == 0) {
    [*(id *)(a1 + 32) _updateActiveAccount];
  }
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__MTAccountController_fetchActiveAccountWithCompletion___block_invoke_2;
    block[3] = &unk_265055D78;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __56__MTAccountController_fetchActiveAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)activeDsid
{
  v2 = [(MTAccountController *)self activeAccount];
  uint64_t v3 = objc_msgSend(v2, "ams_DSID");

  return v3;
}

- (id)activeStorefront
{
  v2 = [(MTAccountController *)self activeAccount];
  uint64_t v3 = objc_msgSend(v2, "ams_storefront");

  return v3;
}

- (id)activeEmail
{
  v2 = [(MTAccountController *)self activeAccount];
  uint64_t v3 = [v2 username];

  return v3;
}

- (id)activeFullName
{
  v2 = [(MTAccountController *)self activeAccount];
  uint64_t v3 = objc_msgSend(v2, "ams_fullName");

  return v3;
}

- (BOOL)isUserLoggedIn
{
  v2 = [(MTAccountController *)self activeAccount];
  uint64_t v3 = objc_msgSend(v2, "ams_DSID");
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)activeAccountIsManagedAppleID
{
  v2 = [(MTAccountController *)self activeAccount];
  char v3 = objc_msgSend(v2, "ams_isManagedAppleID");

  return v3;
}

- (void)didChangeStoreAccount:(id)a3
{
  if (+[MTAccountController iTunesAccountDidChangeForACAccountNotification:a3])
  {
    [(MTAccountController *)self _updateActiveAccount];
    if ([(MTAccountController *)self isUserLoggedIn])
    {
      id v4 = [MEMORY[0x263F08A00] defaultCenter];
      [v4 postNotificationName:@"MTShouldCheckShowWelcomeNotification" object:0];
    }
  }
}

- (id)_activeAccountBlocking
{
  v2 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  char v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  return v3;
}

- (void)_updateActiveAccount
{
  char v3 = [(MTAccountController *)self activeDsid];
  id v4 = [v3 stringValue];

  accountQueue = self->_accountQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__MTAccountController__updateActiveAccount__block_invoke;
  v7[3] = &unk_265055D50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accountQueue, v7);
}

void __43__MTAccountController__updateActiveAccount__block_invoke(uint64_t a1)
{
  v2 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_23F08F000, v2, OS_LOG_TYPE_DEFAULT, "MTAccountController: updating active account", v7, 2u);
  }

  char v3 = [*(id *)(a1 + 32) _activeAccountBlocking];
  id v4 = objc_msgSend(v3, "ams_DSID");
  uint64_t v5 = [v4 stringValue];

  unint64_t v6 = *(void *)(a1 + 40);
  if (v6 | v5 && ([(id)v6 isEqualToString:v5] & 1) == 0) {
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_8);
  }
  [*(id *)(a1 + 32) setActiveAccount:v3];
  [*(id *)(a1 + 32) setHasFetchedInitialAccount:1];
}

void __43__MTAccountController__updateActiveAccount__block_invoke_20()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"AccountDSIDChangedNotification" object:0];
}

+ (BOOL)iTunesAccountDidChangeForACAccountNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  uint64_t v5 = *MEMORY[0x263EFAF38];
  unint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263EFAF38]];
  if (v6)
  {
    uint64_t v7 = [v3 userInfo];
    id v8 = [v7 objectForKeyedSubscript:v5];
    char v9 = [v8 isEqualToString:*MEMORY[0x263EFB000]];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)hasFetchedInitialAccount
{
  return self->_hasFetchedInitialAccount;
}

- (void)setHasFetchedInitialAccount:(BOOL)a3
{
  self->_hasFetchedInitialAccount = a3;
}

- (ACAccount)accountOverride
{
  return self->_accountOverride;
}

- (void)setAccountOverride:(id)a3
{
}

- (NSMutableSet)inFlightAuthRequests
{
  return self->_inFlightAuthRequests;
}

- (void)setInFlightAuthRequests:(id)a3
{
}

- (NSMutableSet)declinedAuthRequests
{
  return self->_declinedAuthRequests;
}

- (void)setDeclinedAuthRequests:(id)a3
{
}

- (ACAccount)_activeAccount
{
  return self->__activeAccount;
}

- (void)set_activeAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeAccount, 0);
  objc_storeStrong((id *)&self->_declinedAuthRequests, 0);
  objc_storeStrong((id *)&self->_inFlightAuthRequests, 0);
  objc_storeStrong((id *)&self->_accountOverride, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accountQueue, 0);
}

@end