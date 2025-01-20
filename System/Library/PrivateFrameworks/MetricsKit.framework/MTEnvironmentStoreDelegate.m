@interface MTEnvironmentStoreDelegate
- (id)_activeItunesAccount;
- (id)_connectionType;
- (id)connectionType;
- (id)cookies;
- (id)dsId;
- (id)storeFrontHeader;
- (id)userAgent;
@end

@implementation MTEnvironmentStoreDelegate

- (id)connectionType
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__MTEnvironmentStoreDelegate_connectionType__block_invoke;
  v4[3] = &unk_264310AF8;
  v4[4] = self;
  v2 = +[MTEventHandler cachableWithKey:@"connectionType" onBackgroundThread:1 block:v4];

  return v2;
}

uint64_t __44__MTEnvironmentStoreDelegate_connectionType__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionType];
}

- (id)cookies
{
  return +[MTPromise promiseWithResult:MEMORY[0x263EFFA78]];
}

- (id)dsId
{
  v2 = [(MTEnvironmentStoreDelegate *)self _activeItunesAccount];
  v3 = [v2 thenWithBlock:&__block_literal_global_15];

  return v3;
}

id __34__MTEnvironmentStoreDelegate_dsId__block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "ams_DSID");
  v3 = +[MTPromise promiseWithResult:v2];

  return v3;
}

- (id)storeFrontHeader
{
  v2 = [(MTEnvironmentStoreDelegate *)self _activeItunesAccount];
  v3 = [v2 thenWithBlock:&__block_literal_global_5];

  return v3;
}

id __46__MTEnvironmentStoreDelegate_storeFrontHeader__block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "ams_storefront");
  v3 = +[MTPromise promiseWithResult:v2];

  return v3;
}

- (id)userAgent
{
  return +[MTEventHandler cachableWithKey:@"userAgent" onBackgroundThread:1 block:&__block_literal_global_10];
}

id __39__MTEnvironmentStoreDelegate_userAgent__block_invoke()
{
  v0 = (void *)MEMORY[0x263F27F00];
  v1 = [MEMORY[0x263F27E00] currentProcess];
  v2 = [v0 userAgentForProcessInfo:v1];

  return v2;
}

- (id)_connectionType
{
  v2 = [MEMORY[0x263F894B8] sharedInstance];
  v3 = [v2 connectionTypeHeader];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = @"unknown";
  }

  return v4;
}

- (id)_activeItunesAccount
{
  return +[MTEventHandler cachableWithKey:@"activeItunesAccount" onBackgroundThread:1 block:&__block_literal_global_23];
}

id __50__MTEnvironmentStoreDelegate__activeItunesAccount__block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x263EFB218], "ams_sharedAccountStore");
  v1 = objc_msgSend(v0, "ams_activeiTunesAccount");

  return v1;
}

@end