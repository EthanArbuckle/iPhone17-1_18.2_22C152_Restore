@interface WBSMobileAssetController
- (NSDate)lastUpdateDate;
- (NSString)assetType;
- (NSString)updateDateDefaultsKey;
- (WBSMobileAssetController)initWithMobileAssetType:(id)a3 updateDateDefaultsKey:(id)a4 updateInterval:(double)a5 minimumDelay:(double)a6;
- (WBSMobileAssetController)initWithMobileAssetType:(id)a3 updateInterval:(double)a4 minimumDelay:(double)a5;
- (WBSMobileAssetControllerDelegate)delegate;
- (double)updateInterval;
- (void)_downloadIfNecessary:(id)a3;
- (void)_queryAssets:(id)a3;
- (void)_queryBackgroundImageAsset:(id)a3 completionHandler:(id)a4;
- (void)_queryMostRecentAsset:(id)a3;
- (void)_update;
- (void)_updateCatalog:(id)a3;
- (void)downloadMobileAssetBackgroundImage:(id)a3 completionHandler:(id)a4;
- (void)queryURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastUpdateDate:(id)a3;
@end

@implementation WBSMobileAssetController

- (WBSMobileAssetController)initWithMobileAssetType:(id)a3 updateInterval:(double)a4 minimumDelay:(double)a5
{
  id v8 = a3;
  v9 = [v8 stringByAppendingString:@".UpdateDate"];
  v10 = [(WBSMobileAssetController *)self initWithMobileAssetType:v8 updateDateDefaultsKey:v9 updateInterval:a4 minimumDelay:a5];

  return v10;
}

- (WBSMobileAssetController)initWithMobileAssetType:(id)a3 updateDateDefaultsKey:(id)a4 updateInterval:(double)a5 minimumDelay:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WBSMobileAssetController;
  v13 = [(WBSMobileAssetController *)&v25 init];
  if (v13)
  {
    objc_initWeak(&location, v13);
    objc_storeStrong((id *)&v13->_assetType, a3);
    objc_storeStrong((id *)&v13->_updateDateDefaultsKey, a4);
    v13->_updateInterval = a5;
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.SafariSharedUI.WBSMobileAssetController.internalQueue", 0);
    internalQueue = v13->_internalQueue;
    v13->_internalQueue = (OS_dispatch_queue *)v14;

    id v16 = objc_alloc(MEMORY[0x1E4F98388]);
    v17 = [(WBSMobileAssetController *)v13 lastUpdateDate];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __102__WBSMobileAssetController_initWithMobileAssetType_updateDateDefaultsKey_updateInterval_minimumDelay___block_invoke;
    v22[3] = &unk_1E5E41340;
    objc_copyWeak(&v23, &location);
    uint64_t v18 = [v16 initWithInterval:v17 minimumDelay:v22 lastFireDate:a5 block:a6];
    scheduler = v13->_scheduler;
    v13->_scheduler = (WBSPeriodicActivityScheduler *)v18;

    v20 = v13;
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (NSDate)lastUpdateDate
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = objc_msgSend(v3, "safari_dateForKey:", self->_updateDateDefaultsKey);

  return (NSDate *)v4;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__WBSMobileAssetController_setDelegate___block_invoke;
  v7[3] = &unk_1E5E40D38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __41__WBSMobileAssetController__queryAssets___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) results];
  id v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_303];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __50__WBSMobileAssetController__queryMostRecentAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [WeakRetained mobileAssetController:*(void *)(a1 + 32) didFailDownload:v6];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          if ([*(id *)(*((void *)&v17 + 1) + 8 * i) state] == 2)
          {
            (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *(void *)(a1 + 40);
    v15 = [NSString stringWithFormat:@"Failed to find matching asset for %@", *(void *)(*(void *)(a1 + 32) + 40)];
    id v16 = objc_msgSend(v13, "safari_errorWithDomain:code:privacyPreservingDescription:", @"MADownLoadResult", 18, v15);
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v16);
  }
LABEL_13:
}

void __40__WBSMobileAssetController_setDelegate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v5;
  if (a3)
  {
    [v6 mobileAssetController:v7 didFailRetrieve:a3];
  }
  else
  {
    id v8 = [v5 getLocalFileUrl];
    uint64_t v9 = [v10 attributes];
    [v6 mobileAssetController:v7 didBecomeAvailable:v8 withAttributes:v9];
  }
}

void __40__WBSMobileAssetController_setDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  id v3 = *(id *)(a1 + 40);

  if (WeakRetained != v3)
  {
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__WBSMobileAssetController_setDelegate___block_invoke_2;
    v7[3] = &unk_1E5E438B0;
    id v4 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = v6;
    [v4 _queryMostRecentAsset:v7];
  }
}

- (void)_queryMostRecentAsset:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__WBSMobileAssetController__queryMostRecentAsset___block_invoke;
  v6[3] = &unk_1E5E43840;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WBSMobileAssetController *)self _queryAssets:v6];
}

- (void)_queryAssets:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)getMAAssetQueryClass()) initWithType:self->_assetType];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained mobileAssetController:self willPerformQuery:v5];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__WBSMobileAssetController__queryAssets___block_invoke;
  v9[3] = &unk_1E5E43900;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v8 queryMetaData:v9];
}

void __102__WBSMobileAssetController_initWithMobileAssetType_updateDateDefaultsKey_updateInterval_minimumDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _update];
}

- (void)downloadMobileAssetBackgroundImage:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__WBSMobileAssetController_downloadMobileAssetBackgroundImage_completionHandler___block_invoke;
  v8[3] = &unk_1E5E43840;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(WBSMobileAssetController *)self _queryBackgroundImageAsset:a3 completionHandler:v8];
}

void __81__WBSMobileAssetController_downloadMobileAssetBackgroundImage_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = [a2 firstObject];
    id v8 = v7;
    if (v7)
    {
      if ([v7 state] != 2)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __81__WBSMobileAssetController_downloadMobileAssetBackgroundImage_completionHandler___block_invoke_2;
        v11[3] = &unk_1E5E43818;
        id v10 = *(void **)(a1 + 40);
        v11[4] = *(void *)(a1 + 32);
        id v13 = v10;
        id v12 = v8;
        [v12 startDownload:v11];

        goto LABEL_9;
      }
      id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v9();
LABEL_9:

    goto LABEL_10;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained mobileAssetController:*(void *)(a1 + 32) didFailDownload:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_10:
}

uint64_t __81__WBSMobileAssetController_downloadMobileAssetBackgroundImage_completionHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  if (a2 > 0xE || ((1 << a2) & 0x4401) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = [NSString stringWithFormat:@"Failed to download catalog for %@: %zd", *(void *)(v5 + 40), a2];
    id v8 = objc_msgSend(v6, "safari_errorWithDomain:code:privacyPreservingDescription:", @"MADownLoadResult", a2, v7);
    [WeakRetained mobileAssetController:v5 didFailDownload:v8];
  }
  id v9 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v9();
}

- (void)_queryBackgroundImageAsset:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)getMAAssetQueryClass()) initWithType:self->_assetType];
  [v8 addKeyValuePair:@"FileName" with:v7];

  [v8 addKeyValuePair:@"IsBackgroundImageThumbnailV1" with:@"NO"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__WBSMobileAssetController__queryBackgroundImageAsset_completionHandler___block_invoke;
  v11[3] = &unk_1E5E43888;
  id v12 = v8;
  id v13 = v6;
  id v9 = v6;
  id v10 = v8;
  [v10 queryMetaDataWithError:v11];
}

void __73__WBSMobileAssetController__queryBackgroundImageAsset_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 results];
  id v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_26];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __73__WBSMobileAssetController__queryBackgroundImageAsset_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 attributes];
  id v6 = getASAttributeContentVersion();
  id v7 = [v5 objectForKeyedSubscript:v6];
  id v8 = [v4 attributes];

  id v9 = getASAttributeContentVersion();
  id v10 = [v8 objectForKeyedSubscript:v9];
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

- (WBSMobileAssetControllerDelegate)delegate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__16;
  id v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__WBSMobileAssetController_delegate__block_invoke;
  v5[3] = &unk_1E5E43620;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (WBSMobileAssetControllerDelegate *)v3;
}

void __36__WBSMobileAssetController_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

- (void)setLastUpdateDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  id v6 = [v4 standardUserDefaults];
  objc_msgSend(v6, "safari_setDate:forKey:", v5, self->_updateDateDefaultsKey);
}

- (void)_update
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__WBSMobileAssetController__update__block_invoke;
  block[3] = &unk_1E5E40968;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __35__WBSMobileAssetController__update__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [WeakRetained mobileAssetControllerShouldPerformScheduledUpdate:*(void *)(a1 + 32)])
  {
    uint64_t v3 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __35__WBSMobileAssetController__update__block_invoke_2;
    v4[3] = &unk_1E5E40968;
    v4[4] = v3;
    [v3 _updateCatalog:v4];
  }
}

uint64_t __35__WBSMobileAssetController__update__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__WBSMobileAssetController__update__block_invoke_3;
  v3[3] = &unk_1E5E438D8;
  v3[4] = v1;
  return [v1 _downloadIfNecessary:v3];
}

void __35__WBSMobileAssetController__update__block_invoke_3(uint64_t a1, void *a2, int a3, void *a4)
{
  id v14 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  id v9 = WeakRetained;
  if (v7)
  {
    [WeakRetained mobileAssetController:*(void *)(a1 + 32) didFailDownload:v7];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    [*(id *)(a1 + 32) setLastUpdateDate:v10];

    if (a3)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = [v14 getLocalFileUrl];
      id v13 = [v14 attributes];
      [v9 mobileAssetController:v11 didDownload:v12 withAttributes:v13];
    }
  }
}

- (void)_updateCatalog:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v5 = (void *)getMAAssetClass_softClass;
  uint64_t v19 = getMAAssetClass_softClass;
  if (!getMAAssetClass_softClass)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __getMAAssetClass_block_invoke;
    id v14 = &unk_1E5E41610;
    v15 = &v16;
    MobileAssetLibraryCore();
    v17[3] = (uint64_t)objc_getClass("MAAsset");
    getMAAssetClass_softClass = *(void *)(v15[1] + 24);
    id v5 = (void *)v17[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v16, 8);
  assetType = self->_assetType;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__WBSMobileAssetController__updateCatalog___block_invoke;
  v9[3] = &unk_1E5E43900;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v6 startCatalogDownload:assetType then:v9];
}

uint64_t __43__WBSMobileAssetController__updateCatalog___block_invoke(uint64_t a1, unint64_t a2)
{
  if (a2 > 0xE || ((1 << a2) & 0x4401) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = [NSString stringWithFormat:@"Failed to download catalog for %@: %i", *(void *)(v5 + 40), a2];
    id v8 = objc_msgSend(v6, "safari_errorWithDomain:code:privacyPreservingDescription:", @"MADownLoadResult", a2, v7);
    [WeakRetained mobileAssetController:v5 didFailCatalogDownload:v8];
  }
  id v9 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v9();
}

uint64_t __41__WBSMobileAssetController__queryAssets___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 attributes];
  id v6 = getASAttributeContentVersion();
  id v7 = [v5 objectForKey:v6];
  id v8 = [v4 attributes];

  id v9 = getASAttributeContentVersion();
  id v10 = [v8 objectForKey:v9];
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

- (void)queryURL:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__WBSMobileAssetController_queryURL___block_invoke;
  v6[3] = &unk_1E5E43928;
  id v7 = v4;
  id v5 = v4;
  [(WBSMobileAssetController *)self _queryMostRecentAsset:v6];
}

void __37__WBSMobileAssetController_queryURL___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v4 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, 0);
  }
  else
  {
    id v6 = [a2 getLocalFileUrl];
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v6, 0);
  }
}

- (void)_downloadIfNecessary:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__WBSMobileAssetController__downloadIfNecessary___block_invoke;
  v6[3] = &unk_1E5E43840;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WBSMobileAssetController *)self _queryAssets:v6];
}

void __49__WBSMobileAssetController__downloadIfNecessary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [WeakRetained mobileAssetController:*(void *)(a1 + 32) didFailDownload:v5];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__WBSMobileAssetController__downloadIfNecessary___block_invoke_2;
    v8[3] = &unk_1E5E43950;
    id v7 = *(id *)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    [a2 enumerateObjectsUsingBlock:v8];
  }
}

void __49__WBSMobileAssetController__downloadIfNecessary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == 2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__WBSMobileAssetController__downloadIfNecessary___block_invoke_3;
    v5[3] = &unk_1E5E43818;
    id v4 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v7 = v4;
    id v6 = v3;
    [v6 startDownload:v5];
  }
}

uint64_t __49__WBSMobileAssetController__downloadIfNecessary___block_invoke_3(uint64_t a1, unint64_t a2)
{
  if (a2 > 0xE || ((1 << a2) & 0x4401) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = [NSString stringWithFormat:@"Failed to download catalog for %@: %i", *(void *)(v5 + 40), a2];
    id v8 = objc_msgSend(v6, "safari_errorWithDomain:code:privacyPreservingDescription:", @"MADownLoadResult", a2, v7);
    [WeakRetained mobileAssetController:v5 didFailDownload:v8];
  }
  id v9 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v9();
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)updateDateDefaultsKey
{
  return self->_updateDateDefaultsKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateDateDefaultsKey, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end