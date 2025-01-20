@interface WCRAutoAssetClient
- (BOOL)_createInterestInAssetType:(id)a3 withAssetSpecifier:(id)a4 withError:(id *)a5;
- (MAAutoAssetSelector)currentAssetSelector;
- (OS_dispatch_queue)notifyQueue;
- (WCRAutoAssetClient)initWithError:(id *)a3;
- (id)_lockLocalAsset;
- (id)assetDidChangeHandler;
- (void)_endLocalAssetLocks;
- (void)_handleAssetChangedNotification;
- (void)_registerForNotificationsForAssetType:(id)a3 andAssetSpecifier:(id)a4;
- (void)_removeInterestInAssetType:(id)a3 withAssetSpecifier:(id)a4 withError:(id *)a5;
- (void)registerForAssetChangedNotificationsWithBlock:(id)a3;
- (void)setAssetDidChangeHandler:(id)a3;
- (void)setCurrentAssetSelector:(id)a3;
- (void)setNotifyQueue:(id)a3;
@end

@implementation WCRAutoAssetClient

- (WCRAutoAssetClient)initWithError:(id *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)WCRAutoAssetClient;
  v4 = [(WCRAutoAssetClient *)&v12 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  id v11 = 0;
  BOOL v6 = [(WCRAutoAssetClient *)v4 _createInterestInAssetType:@"com.apple.MobileAsset.WebContentRestrictions" withAssetSpecifier:@"WebContentRestrictionsFilterAssets" withError:&v11];
  id v7 = v11;
  v8 = v7;
  if (v6)
  {

LABEL_4:
    v9 = v5;
    goto LABEL_8;
  }
  if (a3) {
    *a3 = v7;
  }

  v9 = 0;
LABEL_8:

  return v9;
}

- (void)_handleAssetChangedNotification
{
  v3 = [(WCRAutoAssetClient *)self assetDidChangeHandler];

  if (v3)
  {
    v4 = [(WCRAutoAssetClient *)self assetDidChangeHandler];
    v4[2]();
  }
}

- (void)_registerForNotificationsForAssetType:(id)a3 andAssetSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (const char *)[@"com.apple.WebContentRestrictions.notifyQueue" UTF8String];
  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
  [(WCRAutoAssetClient *)self setNotifyQueue:v10];

  id v11 = [MEMORY[0x263F55968] notifyRegistrationName:@"ASSET_VERSION_DOWNLOADED" forAssetType:v7 forAssetSpecifier:v6];

  int out_token = -1;
  id v12 = v11;
  v13 = (const char *)[v12 UTF8String];
  v14 = [(WCRAutoAssetClient *)self notifyQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__WCRAutoAssetClient__registerForNotificationsForAssetType_andAssetSpecifier___block_invoke;
  v15[3] = &unk_265585860;
  v15[4] = self;
  notify_register_dispatch(v13, &out_token, v14, v15);
}

uint64_t __78__WCRAutoAssetClient__registerForNotificationsForAssetType_andAssetSpecifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAssetChangedNotification];
}

- (void)registerForAssetChangedNotificationsWithBlock:(id)a3
{
  if (a3) {
    -[WCRAutoAssetClient setAssetDidChangeHandler:](self, "setAssetDidChangeHandler:");
  }
  [(WCRAutoAssetClient *)self _registerForNotificationsForAssetType:@"com.apple.MobileAsset.WebContentRestrictions" andAssetSpecifier:@"WebContentRestrictionsFilterAssets"];
}

- (BOOL)_createInterestInAssetType:(id)a3 withAssetSpecifier:(id)a4 withError:(id *)a5
{
  v8 = (objc_class *)MEMORY[0x263F55978];
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v8 alloc] initForAssetType:v10 withAssetSpecifier:v9];

  [(WCRAutoAssetClient *)self setCurrentAssetSelector:v11];
  id v12 = objc_alloc(MEMORY[0x263F55960]);
  v13 = [(WCRAutoAssetClient *)self currentAssetSelector];
  id v25 = 0;
  v14 = (void *)[v12 initForClientName:@"WebContentRestrictions.framework" selectingAsset:v13 error:&v25];
  id v15 = v25;

  if (v15)
  {
    v16 = [NSString stringWithFormat:@"Unable to create auto-asset instance: %@", v15];
    +[WCRLogging log:v16 withType:1];

    BOOL v17 = 0;
    if (a5) {
      *a5 = v15;
    }
  }
  else
  {
    v18 = [v14 interestInContentSync:@"Needed for web content restrictions"];
    v19 = v18;
    BOOL v17 = v18 == 0;
    v20 = NSString;
    if (v18)
    {
      v21 = [v18 description];
      v22 = [v20 stringWithFormat:@"Failed to set interest in content: %@", v21];
      +[WCRLogging log:v22 withType:1];

      if (a5) {
        *a5 = v19;
      }
    }
    else
    {
      v23 = [NSString stringWithFormat:@"Successfully set interest in MobileAsset content"];
      +[WCRLogging log:v23 withType:0];
    }
  }

  return v17;
}

- (void)_removeInterestInAssetType:(id)a3 withAssetSpecifier:(id)a4 withError:(id *)a5
{
  v5 = (void *)MEMORY[0x263F55960];
  id v6 = [(WCRAutoAssetClient *)self currentAssetSelector];
  uint64_t v8 = [v5 eliminateAllForSelectorSync:v6];

  if (v8)
  {
    id v7 = [NSString stringWithFormat:@"Failed to eliminate asset: %@", v8];
    +[WCRLogging log:v7 withType:1];
  }
  MEMORY[0x270F9A758]();
}

- (id)_lockLocalAsset
{
  id v3 = objc_alloc(MEMORY[0x263F55960]);
  v4 = [(WCRAutoAssetClient *)self currentAssetSelector];
  id v22 = 0;
  v5 = (void *)[v3 initForClientName:@"WebContentRestrictions.framework" selectingAsset:v4 error:&v22];
  id v6 = v22;

  if (v6)
  {
    id v7 = NSString;
    uint64_t v8 = [v6 description];
    id v9 = [v7 stringWithFormat:@"Unable to create auto-asset instance: %@", v8];
    +[WCRLogging log:v9 withType:1];
    id v10 = 0;
  }
  else
  {
    uint64_t v8 = objc_opt_new();
    [v8 setUserInitiated:1];
    id v20 = 0;
    id v21 = 0;
    id v19 = 0;
    id v11 = [v5 lockContentSync:@"Needed for web content restrictions" withUsagePolicy:v8 withTimeout:0 lockedAssetSelector:&v21 newerInProgress:&v20 error:&v19];
    id v9 = v21;
    id v12 = v20;
    id v13 = v19;
    v14 = v13;
    if (v13)
    {
      id v15 = NSString;
      v16 = [v13 description];
      BOOL v17 = [v15 stringWithFormat:@"Unable to lock any version of auto-asset content: %@", v16];
      +[WCRLogging log:v17 withType:1];

      id v10 = 0;
    }
    else
    {
      if (v9) {
        [(WCRAutoAssetClient *)self setCurrentAssetSelector:v9];
      }
      id v10 = [v11 path];
    }
  }
  return v10;
}

- (void)_endLocalAssetLocks
{
  v2 = (void *)MEMORY[0x263F55960];
  id v3 = [(WCRAutoAssetClient *)self currentAssetSelector];
  id v7 = [v2 endAllPreviousLocksOfSelectorSync:v3 forClientName:@"WebContentRestrictions.framework"];

  if (v7)
  {
    v4 = [NSString stringWithFormat:@"Failed to end asset locks: %@", v7];
    v5 = v4;
    uint64_t v6 = 1;
  }
  else
  {
    v4 = [NSString stringWithFormat:@"Ended local asset locks"];
    v5 = v4;
    uint64_t v6 = 0;
  }
  +[WCRLogging log:v5 withType:v6];
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
}

- (id)assetDidChangeHandler
{
  return self->_assetDidChangeHandler;
}

- (void)setAssetDidChangeHandler:(id)a3
{
}

- (MAAutoAssetSelector)currentAssetSelector
{
  return self->_currentAssetSelector;
}

- (void)setCurrentAssetSelector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAssetSelector, 0);
  objc_storeStrong(&self->_assetDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
}

@end