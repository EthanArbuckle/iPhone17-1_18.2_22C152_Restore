@interface ASKStorefrontChangeProvider
- (ACAccount)activeAccount;
- (ACAccount)localAccount;
- (ACAccountStore)accountStore;
- (ASKStorefrontChangeProvider)initWithBlock:(id)a3;
- (BOOL)hasManagedStateChangedFromAccount:(id)a3 toAccount:(id)a4;
- (BOOL)hasStorefrontChangedFromAccount:(id)a3 toAccount:(id)a4;
- (OS_dispatch_queue)notifyQueue;
- (id)block;
- (void)accountStoreDidChange:(id)a3;
- (void)dealloc;
- (void)setActiveAccount:(id)a3;
- (void)setLocalAccount:(id)a3;
@end

@implementation ASKStorefrontChangeProvider

- (ASKStorefrontChangeProvider)initWithBlock:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASKStorefrontChangeProvider;
  v5 = [(ASKStorefrontChangeProvider *)&v16 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id v7 = v5->_block;
    v5->_block = v6;

    dispatch_queue_t v8 = dispatch_queue_create("ASKStorefrontChangeProvider", 0);
    notifyQueue = v5->_notifyQueue;
    v5->_notifyQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = +[ACAccountStore ams_sharedAccountStore];
    accountStore = v5->_accountStore;
    v5->_accountStore = (ACAccountStore *)v10;

    v12 = [(ASKStorefrontChangeProvider *)v5 notifyQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __45__ASKStorefrontChangeProvider_initWithBlock___block_invoke;
    block[3] = &unk_470F80;
    v15 = v5;
    dispatch_async(v12, block);
  }
  return v5;
}

void __45__ASKStorefrontChangeProvider_initWithBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accountStore];
  v3 = [v2 ams_localiTunesAccount];
  [*(id *)(a1 + 32) setLocalAccount:v3];

  id v4 = [*(id *)(a1 + 32) accountStore];
  v5 = [v4 ams_activeiTunesAccount];
  [*(id *)(a1 + 32) setActiveAccount:v5];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:*(void *)(a1 + 32) selector:"accountStoreDidChange:" name:ACDAccountStoreDidChangeNotification object:0];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASKStorefrontChangeProvider;
  [(ASKStorefrontChangeProvider *)&v4 dealloc];
}

- (BOOL)hasStorefrontChangedFromAccount:(id)a3 toAccount:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 ams_storefront];
  uint64_t v7 = [v5 ams_storefront];

  if (v6 && v7)
  {
    dispatch_queue_t v8 = [(id)v6 componentsSeparatedByString:@" "];
    uint64_t v9 = [v8 firstObject];

    uint64_t v10 = [(id)v7 componentsSeparatedByString:@" "];
    uint64_t v11 = [v10 firstObject];

    if (v9 | v11) {
      unsigned __int8 v12 = [(id)v9 isEqual:v11];
    }
    else {
      unsigned __int8 v12 = 1;
    }
  }
  else if (v6 | v7)
  {
    unsigned __int8 v12 = [(id)v6 isEqual:v7];
  }
  else
  {
    unsigned __int8 v12 = 1;
  }

  return v12 ^ 1;
}

- (BOOL)hasManagedStateChangedFromAccount:(id)a3 toAccount:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 accountPropertyForKey:@"isManagedAppleID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  unsigned __int8 v8 = [v7 BOOLValue];
  uint64_t v9 = [v5 accountPropertyForKey:@"isManagedAppleID"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  unsigned __int8 v11 = [v10 BOOLValue];
  return v8 ^ v11;
}

- (void)accountStoreDidChange:(id)a3
{
  objc_super v4 = [(ASKStorefrontChangeProvider *)self notifyQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __53__ASKStorefrontChangeProvider_accountStoreDidChange___block_invoke;
  block[3] = &unk_470F80;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __53__ASKStorefrontChangeProvider_accountStoreDidChange___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) localAccount];
  v2 = [*(id *)(a1 + 32) accountStore];
  v3 = [v2 ams_localiTunesAccount];

  objc_super v4 = [*(id *)(a1 + 32) activeAccount];
  id v5 = [*(id *)(a1 + 32) accountStore];
  uint64_t v6 = [v5 ams_activeiTunesAccount];

  if (([*(id *)(a1 + 32) hasStorefrontChangedFromAccount:v8 toAccount:v3] & 1) != 0
    || [*(id *)(a1 + 32) hasManagedStateChangedFromAccount:v4 toAccount:v6])
  {
    id v7 = [*(id *)(a1 + 32) block];
    v7[2]();
  }
  [*(id *)(a1 + 32) setLocalAccount:v3];
  [*(id *)(a1 + 32) setActiveAccount:v6];
}

- (id)block
{
  return self->_block;
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (ACAccount)localAccount
{
  return self->_localAccount;
}

- (void)setLocalAccount:(id)a3
{
}

- (ACAccount)activeAccount
{
  return self->_activeAccount;
}

- (void)setActiveAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAccount, 0);
  objc_storeStrong((id *)&self->_localAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);

  objc_storeStrong(&self->_block, 0);
}

@end