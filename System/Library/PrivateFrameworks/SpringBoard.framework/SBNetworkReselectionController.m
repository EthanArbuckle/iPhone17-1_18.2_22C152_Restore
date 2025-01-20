@interface SBNetworkReselectionController
+ (SBNetworkReselectionController)sharedController;
- (SBNetworkReselectionController)init;
- (void)_handleNetworkReselectionNeeded:(BOOL)a3 forSlot:(int64_t)a4;
- (void)_test;
- (void)dealloc;
- (void)subscriptionInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4;
@end

@implementation SBNetworkReselectionController

uint64_t __81__SBNetworkReselectionController_subscriptionInfoDidChangeForStateProvider_slot___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) isNetworkReselectionNeeded];
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 _handleNetworkReselectionNeeded:v3 forSlot:v4];
}

- (void)subscriptionInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  v6 = [a3 subscriptionInfoForSlot:a4];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__SBNetworkReselectionController_subscriptionInfoDidChangeForStateProvider_slot___block_invoke;
  block[3] = &unk_1E6AF6FC0;
  block[4] = self;
  id v9 = v6;
  int64_t v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_handleNetworkReselectionNeeded:(BOOL)a3 forSlot:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v6 = +[SBAlertItemsController sharedInstance];
  long long v7 = 0uLL;
  if (v5)
  {
    long long v24 = 0uLL;
    long long v25 = 0uLL;
    long long v22 = 0uLL;
    long long v23 = 0uLL;
    v8 = [v6 alertItemsOfClass:objc_opt_class()];
    uint64_t v9 = [(SBNetworkReselectionAlertItem *)v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v22 + 1) + 8 * v12) slot] == a4) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [(SBNetworkReselectionAlertItem *)v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      v8 = [[SBNetworkReselectionAlertItem alloc] initWithSlot:a4];
      [v6 activateAlertItem:v8];
    }
  }
  else
  {
    long long v20 = 0uLL;
    long long v21 = 0uLL;
    *((void *)&v18 + 1) = 0;
    long long v19 = 0uLL;
    objc_msgSend(v6, "alertItemsOfClass:", objc_opt_class(), (void)v7);
    v8 = (SBNetworkReselectionAlertItem *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [(SBNetworkReselectionAlertItem *)v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v8);
          }
          v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v17 slot] == a4) {
            [v6 deactivateAlertItem:v17];
          }
        }
        uint64_t v14 = [(SBNetworkReselectionAlertItem *)v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }
  }
}

+ (SBNetworkReselectionController)sharedController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SBNetworkReselectionController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_sOnceToken != -1) {
    dispatch_once(&sharedController_sOnceToken, block);
  }
  v2 = (void *)sharedController_sSharedController;
  return (SBNetworkReselectionController *)v2;
}

void __50__SBNetworkReselectionController_sharedController__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedController_sSharedController;
  sharedController_sSharedController = (uint64_t)v1;
}

- (SBNetworkReselectionController)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBNetworkReselectionController;
  v2 = [(SBNetworkReselectionController *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [(id)SBApp telephonyStateProvider];
    [v3 addObserver:v2];
    uint64_t v4 = [v3 subscriptionInfoForSlot:1];
    int v5 = [v4 isNetworkReselectionNeeded];

    if (v5) {
      [(SBNetworkReselectionController *)v2 _handleNetworkReselectionNeeded:1 forSlot:1];
    }
    v6 = [v3 subscriptionInfoForSlot:2];
    int v7 = [v6 isNetworkReselectionNeeded];

    if (v7) {
      [(SBNetworkReselectionController *)v2 _handleNetworkReselectionNeeded:1 forSlot:2];
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [(id)SBApp telephonyStateProvider];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBNetworkReselectionController;
  [(SBNetworkReselectionController *)&v4 dealloc];
}

- (void)_test
{
}

@end