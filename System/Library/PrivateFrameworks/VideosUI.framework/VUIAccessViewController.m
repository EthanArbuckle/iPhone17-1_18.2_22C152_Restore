@interface VUIAccessViewController
+ (BOOL)_grantAccessToBundleIDs:(id)a3;
+ (BOOL)_grantAccessToChannelIDs:(id)a3 isReconsent:(BOOL)a4;
+ (BOOL)grantAccessToBundleIDs:(id)a3;
+ (BOOL)isHostedInRemoteViewService;
+ (id)eligibleBundleIDs;
+ (void)optInUser;
+ (void)resolveBundleIDs:(id)a3 completionHandler:(id)a4;
- (VUIAccessViewController)initWithBundleIDs:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (VUIAccessViewController)initWithChannels:(id)a3 options:(id)a4 consentCancelButtonType:(unint64_t)a5 completionHandler:(id)a6;
- (id)completionHandler;
- (unint64_t)supportedInterfaceOrientations;
- (void)setCompletionHandler:(id)a3;
@end

@implementation VUIAccessViewController

void __35___VUIAccessViewController__allow___block_invoke(uint64_t a1)
{
  v16[4] = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v3 = +[VUIAccessViewController _grantAccessToChannelIDs:WeakRetained[130] isReconsent:*(unsigned __int8 *)(a1 + 40)];
    v4 = +[VUIMetricsController sharedInstance];
    v15[0] = @"targetId";
    v15[1] = @"targetType";
    v16[0] = @"allow";
    v16[1] = @"button";
    v16[2] = @"allow";
    v15[2] = @"actionType";
    v15[3] = @"actionDetails";
    v13 = @"result";
    v5 = VUIMetricsActionDetailsResultSuccess;
    if (!v3) {
      v5 = VUIMetricsActionDetailsResultFail;
    }
    v14 = *v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    v16[3] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    [v4 recordClick:v7];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    v9 = __35___VUIAccessViewController__allow___block_invoke_2;
    v10 = &unk_1E6DF51F0;
    v11 = WeakRetained;
    BOOL v12 = v3;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v9((uint64_t)block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __35___VUIAccessViewController__allow___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationItem];
  BOOL v3 = [v2 rightBarButtonItem];
  [v3 setEnabled:1];

  if (*(unsigned char *)(a1 + 40))
  {
    v4 = *(void **)(a1 + 32);
    return [v4 _completeWithStatus:1];
  }
  else
  {
    NSLog(&cfstr_Vuiaccessviewc_2.isa);
    v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35___VUIAccessViewController__allow___block_invoke_3;
    v7[3] = &unk_1E6DF3D58;
    v7[4] = v6;
    return [v6 _presentGenericErrorWithCompletion:v7];
  }
}

uint64_t __35___VUIAccessViewController__allow___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _toggleLoadingScreen];
}

void __38___VUIAccessViewController__disallow___block_invoke(uint64_t a1)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = WeakRetained;
  if (WeakRetained && WeakRetained[1048])
  {
    v4 = [MEMORY[0x1E4FB5158] sharedSettings];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __38___VUIAccessViewController__disallow___block_invoke_2;
    v11 = &unk_1E6DF7230;
    id v5 = v4;
    id v12 = v5;
    v13 = v3;
    objc_copyWeak(&v14, v1);
    [v5 refreshWithCompletion:&v8];
    objc_destroyWeak(&v14);
  }
  else
  {
    [WeakRetained _completeWithStatus:3];
  }
  v6 = +[VUIMetricsController sharedInstance];
  v15[0] = @"targetId";
  v15[1] = @"targetType";
  v16[0] = @"disallow";
  v16[1] = @"button";
  v15[2] = @"actionType";
  v16[2] = @"disallow";
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  [v6 recordClick:v7];
}

void __38___VUIAccessViewController__disallow___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) beginIgnoringChanges];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 40) + 1000);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        NSLog(&cfstr_Vuiaccessviewc_3.isa, v7);
        uint64_t v8 = [MEMORY[0x1E4FB5080] sharedInstanceFiltered];
        uint64_t v9 = [v8 channelIDForBundleID:v7];

        v10 = WLKSubscriptionIdentifierForBundleID();
        [*(id *)(a1 + 32) setStatus:2 forChannelID:v9 externalID:v10];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 32) endIgnoringChanges];
  v11 = [MEMORY[0x1E4FB5158] sharedSettings];
  char v12 = [v11 synchronize:0];

  if ((v12 & 1) == 0) {
    NSLog(&cfstr_Vuiaccessviewc_4.isa);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __38___VUIAccessViewController__disallow___block_invoke_3;
  block[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v14);
}

void __38___VUIAccessViewController__disallow___block_invoke_3(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[122] showNackScreen];
    [v2 _toggleLoadingScreen];
    WeakRetained = v2;
  }
}

uint64_t __48___VUIAccessViewController__completeWithStatus___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained = (void *)WeakRetained[133];
    if (WeakRetained)
    {
      v6 = v3;
      ((void (*)(void *, void, void))WeakRetained[2])(WeakRetained, *(void *)(a1 + 40), v3[125]);
      uint64_t v4 = (void *)v6[133];
      v6[133] = 0;
    }
  }
  return MEMORY[0x1F4181820](WeakRetained);
}

void __47___VUIAccessViewController__fetchRemoteAppInfo__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  from = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__39;
    v36 = __Block_byref_object_dispose__39;
    id v37 = [MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = WeakRetained[129];
    uint64_t v1 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v1)
    {
      uint64_t v2 = *(void *)v29;
      do
      {
        uint64_t v3 = 0;
        do
        {
          if (*(void *)v29 != v2) {
            objc_enumerationMutation(obj);
          }
          uint64_t v4 = *(void **)(*((void *)&v28 + 1) + 8 * v3);
          uint64_t v22 = 0;
          v23 = &v22;
          uint64_t v24 = 0x3032000000;
          v25 = __Block_byref_object_copy__39;
          v26 = __Block_byref_object_dispose__39;
          id v27 = [MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v5 = [v4 name];
          [(id)v23[5] setObject:v5 forKeyedSubscript:@"appName"];

          [WeakRetained _iconSize];
          double v7 = v6;
          double v9 = v8;
          dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __47___VUIAccessViewController__fetchRemoteAppInfo__block_invoke_161;
          v17[3] = &unk_1E6DFDC20;
          double v20 = v7;
          double v21 = v9;
          v19 = &v22;
          v11 = v10;
          long long v18 = v11;
          +[VUIAppIconImageService fetchIconForInstallable:size:completion:](VUIAppIconImageService, "fetchIconForInstallable:size:completion:", v4, v17, v7, v9);
          dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
          [(id)v33[5] addObject:v23[5]];

          _Block_object_dispose(&v22, 8);
          ++v3;
        }
        while (v1 != v3);
        uint64_t v1 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v1);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __47___VUIAccessViewController__fetchRemoteAppInfo__block_invoke_2;
    block[3] = &unk_1E6DFDC48;
    objc_copyWeak(&v16, from);
    void block[4] = &v32;
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v16);
    _Block_object_dispose(&v32, 8);
  }
}

intptr_t __47___VUIAccessViewController__fetchRemoteAppInfo__block_invoke_161(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = objc_msgSend(a2, "vui_iconImageOfSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v3 forKeyedSubscript:@"appIcon"];
  }
  uint64_t v4 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v4);
}

void __47___VUIAccessViewController__fetchRemoteAppInfo__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObjectsFromArray:WeakRetained[128]];
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) copy];
    uint64_t v4 = (void *)v5[128];
    v5[128] = v3;

    [v5 _setupAccessViews];
    [v5 _toggleLoadingScreen];
    WeakRetained = v5;
  }
}

void __49___VUIAccessViewController_cappedTraitCollection__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4FB2788];
  v4[0] = *MEMORY[0x1E4FB2790];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4FB2778];
  v4[2] = *MEMORY[0x1E4FB2780];
  v4[3] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v3 = (void *)cappedTraitCollection_cappedSizes;
  cappedTraitCollection_cappedSizes = v2;
}

- (VUIAccessViewController)initWithBundleIDs:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VUIAccessViewController;
  v11 = [(VUIAccessViewController *)&v16 init];
  if (v11)
  {
    char v12 = [[_VUIAccessViewController alloc] initWithBundleIDs:v8 channels:0 consentCancelButtonType:0 options:v9 completionHandler:v10];
    v17[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [(VUIAccessViewController *)v11 setViewControllers:v13];

    id v14 = [(VUIAccessViewController *)v11 navigationBar];
    [v14 _setHidesShadow:1];
    [v14 _setDisableBlurTinting:1];
  }
  return v11;
}

- (VUIAccessViewController)initWithChannels:(id)a3 options:(id)a4 consentCancelButtonType:(unint64_t)a5 completionHandler:(id)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VUIAccessViewController;
  v13 = [(VUIAccessViewController *)&v18 init];
  if (v13)
  {
    id v14 = [[_VUIAccessViewController alloc] initWithBundleIDs:0 channels:v10 consentCancelButtonType:a5 options:v11 completionHandler:v12];
    v19[0] = v14;
    long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [(VUIAccessViewController *)v13 setViewControllers:v15];

    objc_super v16 = [(VUIAccessViewController *)v13 navigationBar];
    [v16 _setHidesShadow:1];
    [v16 _setDisableBlurTinting:1];
  }
  return v13;
}

+ (BOOL)grantAccessToBundleIDs:(id)a3
{
  return +[VUIAccessViewController _grantAccessToBundleIDs:a3];
}

+ (BOOL)_grantAccessToBundleIDs:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4FB5158] sharedSettings];
  if ([MEMORY[0x1E4FB5150] synchronizeSettingsFromCloudIfNeeded:0])
  {
    [v5 beginIgnoringChanges];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          NSLog(&cfstr_Vuiaccessviewc_6.isa, v11);
          id v12 = [MEMORY[0x1E4FB5080] sharedInstanceFiltered];
          v13 = [v12 channelIDForBundleID:v11];

          id v14 = WLKSubscriptionIdentifierForBundleID();
          [v5 setStatus:1 forChannelID:v13 externalID:v14];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    [a1 optInUser];
    [v5 endIgnoringChanges];
    long long v15 = [MEMORY[0x1E4FB5158] sharedSettings];
    char v16 = [v15 synchronize:0];

    id v4 = v18;
  }
  else
  {
    NSLog(&cfstr_Vuiaccessviewc_5.isa);
    char v16 = 0;
  }

  return v16;
}

+ (BOOL)_grantAccessToChannelIDs:(id)a3 isReconsent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4FB5158] sharedSettings];
  if ([MEMORY[0x1E4FB5150] synchronizeSettingsFromCloudIfNeeded:0])
  {
    [v7 beginIgnoringChanges];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          NSLog(&cfstr_Vuiaccessviewc_6.isa, v12);
          [v7 setStatus:1 forChannelID:v12 externalID:0];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    [a1 optInUser];
    [v7 endIgnoringChanges];
    v13 = [MEMORY[0x1E4FB5158] sharedSettings];
    LODWORD(a1) = [v13 synchronize:0];

    if ((a1 & v4) == 1)
    {
      NSLog(&cfstr_Vuiaccessviewc_7.isa);
      uint64_t v20 = 0;
      long long v21 = &v20;
      uint64_t v22 = 0x2020000000;
      char v23 = 0;
      dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
      a1 = [MEMORY[0x1E4FB5158] sharedSettings];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      void v17[2] = __64__VUIAccessViewController__grantAccessToChannelIDs_isReconsent___block_invoke;
      v17[3] = &unk_1E6DFDC70;
      long long v19 = &v20;
      long long v15 = v14;
      id v18 = v15;
      [a1 forceUpdateWithCompletion:v17];

      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      LOBYTE(a1) = *((unsigned char *)v21 + 24) != 0;

      _Block_object_dispose(&v20, 8);
    }
  }
  else
  {
    NSLog(&cfstr_Vuiaccessviewc_5.isa);
    LOBYTE(a1) = 0;
  }

  return (char)a1;
}

intptr_t __64__VUIAccessViewController__grantAccessToChannelIDs_isReconsent___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)optInUser
{
  id v3 = [MEMORY[0x1E4FB5158] sharedSettings];
  if (([v3 optedIn] & 1) == 0)
  {
    NSLog(&cfstr_Vuiaccessviewc_8.isa);
    [v3 setOptedIn:1];
    uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
    [v3 setLastSyncDate:v2];
  }
}

+ (id)eligibleBundleIDs
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4FB5050] defaultAppLibrary];
  id v3 = [v2 subscribedAppBundleIdentifiers];

  BOOL v4 = [MEMORY[0x1E4FB5080] sharedInstance];
  uint64_t v5 = [v4 orderedChannels];

  id v6 = [MEMORY[0x1E4FB5158] sharedSettings];
  id v19 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v12 isWatchListEnabled] && (objc_msgSend(v12, "isFirstParty") & 1) == 0)
        {
          v13 = [v12 appBundleIDs];
          dispatch_semaphore_t v14 = [v13 firstObject];

          if ([v3 containsObject:v14])
          {
            long long v15 = WLKSubscriptionIdentifierForBundleID();
            char v16 = [v12 channelID];
            long long v17 = [v6 settingsForChannelID:v16 externalID:v15];

            if (!v17 || ![v17 accessStatus]) {
              [v19 addObject:v14];
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v19;
}

+ (void)resolveBundleIDs:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  NSLog(&cfstr_Vuiaccessviewc_9.isa, v5);
  id v7 = [MEMORY[0x1E4FB5088] sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__VUIAccessViewController_resolveBundleIDs_completionHandler___block_invoke;
  v10[3] = &unk_1E6DF6930;
  id v11 = v5;
  id v12 = v6;
  id v8 = v5;
  id v9 = v6;
  [v7 fetchConfigurationWithCompletionHandler:v10];
}

void __62__VUIAccessViewController_resolveBundleIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__VUIAccessViewController_resolveBundleIDs_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E6DF8228;
  id v16 = *(id *)(a1 + 40);
  id v7 = _Block_copy(aBlock);
  id v8 = v7;
  if (v5)
  {
    id v9 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __62__VUIAccessViewController_resolveBundleIDs_completionHandler___block_invoke_3;
    block[3] = &unk_1E6DFDC98;
    id v11 = v5;
    id v13 = *(id *)(a1 + 40);
    id v14 = v8;
    id v12 = *(id *)(a1 + 32);
    dispatch_async(v9, block);
  }
  else
  {
    (*((void (**)(void *, id))v7 + 2))(v7, v6);
  }
}

void __62__VUIAccessViewController_resolveBundleIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    if (!v3)
    {
      NSLog(&cfstr_Vuiaccessviewc_10.isa, 0);
      id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VUIAccessErrorDomain" code:-1 userInfo:0];
      uint64_t v4 = *(void *)(a1 + 32);
    }
    id v5 = v3;
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, MEMORY[0x1E4F1CBF0], v3);
    id v3 = v5;
  }
}

void __62__VUIAccessViewController_resolveBundleIDs_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) vppaStatus] & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    uint64_t v4 = objc_msgSend(v3, "ams_activeiTunesAccount");

    id v5 = objc_msgSend(v4, "ams_DSID");
    id v6 = [v5 stringValue];

    if ([v6 length])
    {
      id v41 = 0;
      char v7 = [MEMORY[0x1E4FB5150] synchronizeSettingsFromCloudIfNeeded:&v41];
      id v8 = v41;
      id v9 = v8;
      if ((v7 & 1) == 0)
      {
        NSLog(&cfstr_Vuiaccessviewc_11.isa);
        long long v26 = *(void (**)(void))(*(void *)(v1 + 56) + 16);
        goto LABEL_36;
      }
    }
    uint64_t v10 = [MEMORY[0x1E4FB5080] sharedInstance];
    id v9 = [v10 orderedChannels];

    if (v9)
    {
      long long v27 = v6;
      long long v28 = v4;
      long long v30 = [MEMORY[0x1E4FB5158] sharedSettings];
      uint64_t v29 = [MEMORY[0x1E4F1CA48] array];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v9 = v9;
      uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v38;
        id v31 = v9;
        uint64_t v32 = v1;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v38 != v13) {
              objc_enumerationMutation(v9);
            }
            long long v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            id v16 = [v15 appBundleIDs];
            if ([v15 isWatchListEnabled] && objc_msgSend(*(id *)(v1 + 40), "count"))
            {
              long long v35 = 0u;
              long long v36 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              id v17 = *(id *)(v1 + 40);
              uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v42 count:16];
              if (v18)
              {
                uint64_t v19 = v18;
                uint64_t v20 = *(void *)v34;
                while (2)
                {
                  for (uint64_t j = 0; j != v19; ++j)
                  {
                    if (*(void *)v34 != v20) {
                      objc_enumerationMutation(v17);
                    }
                    uint64_t v22 = *(void *)(*((void *)&v33 + 1) + 8 * j);
                    if ([v16 containsObject:v22])
                    {
                      long long v23 = WLKSubscriptionIdentifierForBundleID();
                      long long v24 = [v15 channelID];
                      uint64_t v25 = [v30 settingsForChannelID:v24 externalID:v23];

                      if ((!v25 || ![v25 accessStatus])
                        && ([v29 containsObject:v22] & 1) == 0)
                      {
                        [v29 addObject:v22];
                      }

                      goto LABEL_30;
                    }
                  }
                  uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v42 count:16];
                  if (v19) {
                    continue;
                  }
                  break;
                }
              }
LABEL_30:

              id v9 = v31;
              uint64_t v1 = v32;
            }
          }
          uint64_t v12 = [v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
        }
        while (v12);
      }

      NSLog(&cfstr_Vuiaccessviewc_13.isa, v29);
      (*(void (**)(void))(*(void *)(v1 + 48) + 16))();

      id v6 = v27;
      uint64_t v4 = v28;
      goto LABEL_37;
    }
    NSLog(&cfstr_Vuiaccessviewc_12.isa);
    long long v26 = *(void (**)(void))(*(void *)(v1 + 56) + 16);
LABEL_36:
    v26();
LABEL_37:

    return;
  }
  uint64_t v2 = *(void (**)(void))(*(void *)(v1 + 48) + 16);
  v2();
}

+ (BOOL)isHostedInRemoteViewService
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  LOBYTE(v2) = [v3 isEqualToString:@"com.apple.TVAccessViewService"];
  return (char)v2;
}

- (unint64_t)supportedInterfaceOrientations
{
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (!v4) {
    return 2;
  }
  v6.receiver = self;
  v6.super_class = (Class)VUIAccessViewController;
  return [(VUIAccessViewController *)&v6 supportedInterfaceOrientations];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end