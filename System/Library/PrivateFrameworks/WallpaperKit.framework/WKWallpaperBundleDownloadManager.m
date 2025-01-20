@interface WKWallpaperBundleDownloadManager
+ (WKWallpaperBundleDownloadManager)defaultManager;
- (NSError)_catalogDownloadError;
- (NSMutableDictionary)_activeDownloads;
- (NSMutableDictionary)_localAssetLookup;
- (NSNumber)_catalogDownloadResult;
- (NSString)assetDownloadIdentifier;
- (OS_dispatch_queue)_loadingQueue;
- (WKWallpaperBundleDownloadManager)initWithAssetDownloadIdentifier:(id)a3;
- (WKWallpaperBundleDownloadManagerDelegate)delegate;
- (id)_startCatalogDownload;
- (id)localWallpaperRepresentingWithIdentifier:(id)a3 wallpaperName:(id)a4;
- (void)cancelDownloadForWallpaperRepresenting:(id)a3 withCompletion:(id)a4;
- (void)downloadWallpaperRepresentingIfNeeded:(id)a3 progress:(id)a4 withCompletion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)set_activeDownloads:(id)a3;
- (void)set_catalogDownloadError:(id)a3;
- (void)set_catalogDownloadResult:(id)a3;
- (void)set_loadingQueue:(id)a3;
- (void)set_localAssetLookup:(id)a3;
@end

@implementation WKWallpaperBundleDownloadManager

- (WKWallpaperBundleDownloadManager)initWithAssetDownloadIdentifier:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WKWallpaperBundleDownloadManager;
  v5 = [(WKWallpaperBundleDownloadManager *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    assetDownloadIdentifier = v5->_assetDownloadIdentifier;
    v5->_assetDownloadIdentifier = (NSString *)v6;

    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v4 cStringUsingEncoding:1], v8);
    loadingQueue = v5->__loadingQueue;
    v5->__loadingQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    localAssetLookup = v5->__localAssetLookup;
    v5->__localAssetLookup = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    activeDownloads = v5->__activeDownloads;
    v5->__activeDownloads = (NSMutableDictionary *)v13;

    objc_initWeak(&location, v5);
    v15 = [(WKWallpaperBundleDownloadManager *)v5 _loadingQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__WKWallpaperBundleDownloadManager_initWithAssetDownloadIdentifier___block_invoke;
    v17[3] = &unk_1E6376D80;
    objc_copyWeak(&v18, &location);
    dispatch_async(v15, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __68__WKWallpaperBundleDownloadManager_initWithAssetDownloadIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_alloc(MEMORY[0x1E4F77FB8]);
  v3 = [WeakRetained assetDownloadIdentifier];
  id v4 = (void *)[v2 initWithType:v3];

  if (![v4 queryMetaDataSync])
  {
    v5 = [v4 results];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__WKWallpaperBundleDownloadManager_initWithAssetDownloadIdentifier___block_invoke_2;
    v6[3] = &unk_1E6376D58;
    id v7 = WeakRetained;
    objc_msgSend(v5, "na_each:", v6);
  }
}

void __68__WKWallpaperBundleDownloadManager_initWithAssetDownloadIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 state] != 1)
  {
    objc_opt_class();
    id v4 = [v3 attributes];
    v5 = [v4 objectForKeyedSubscript:@"WallpaperBundleName"];
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
      id v7 = v6;
    }
    else
    {
      id v7 = 0;
    }

    v8 = [v7 stringByAppendingPathExtension:@"wallpaper"];
    dispatch_queue_t v9 = [v3 getLocalUrl];
    v10 = [v9 URLByAppendingPathComponent:v8];

    uint64_t v11 = [[WKWallpaperBundle alloc] initWithURL:v10];
    v12 = [(WKWallpaperBundle *)v11 identifierString];
    v17[0] = v12;
    uint64_t v13 = [(WKWallpaperBundle *)v11 name];
    v17[1] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v15 = [v14 componentsJoinedByString:@"."];

    v16 = [*(id *)(a1 + 32) _localAssetLookup];
    [v16 setObject:v11 forKeyedSubscript:v15];
  }
}

+ (WKWallpaperBundleDownloadManager)defaultManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WKWallpaperBundleDownloadManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken_0 != -1) {
    dispatch_once(&defaultManager_onceToken_0, block);
  }
  id v2 = (void *)defaultManager__defaultManager;
  return (WKWallpaperBundleDownloadManager *)v2;
}

uint64_t __50__WKWallpaperBundleDownloadManager_defaultManager__block_invoke(uint64_t a1)
{
  defaultManager__defaultManager = [objc_alloc(*(Class *)(a1 + 32)) initWithAssetDownloadIdentifier:@"com.apple.MobileAsset.Wallpaper"];
  return MEMORY[0x1F41817F8]();
}

- (void)downloadWallpaperRepresentingIfNeeded:(id)a3 progress:(id)a4 withCompletion:(id)a5
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isOffloaded])
  {
    uint64_t v11 = [v8 identifierString];
    v31[0] = v11;
    v12 = [v8 name];
    v31[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    v14 = [v13 componentsJoinedByString:@"."];

    id v15 = objc_alloc_init(MEMORY[0x1E4F77FE8]);
    [v15 setDiscretionary:0];
    v16 = [(WKWallpaperBundleDownloadManager *)self _startCatalogDownload];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke;
    v29[3] = &unk_1E6376DF8;
    v29[4] = self;
    id v30 = v8;
    v17 = [v16 flatMap:v29];
    objc_initWeak(&location, self);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_4;
    v23[3] = &unk_1E6376E98;
    objc_copyWeak(&v27, &location);
    id v24 = v9;
    v25 = v14;
    id v26 = v15;
    id v18 = [v17 flatMap:v23];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_8;
    v20[3] = &unk_1E6376EE8;
    objc_copyWeak(&v22, &location);
    v20[4] = v14;
    id v21 = v10;
    id v19 = (id)[v18 addCompletionBlock:v20];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else if (v10)
  {
    (*((void (**)(id, id, void))v10 + 2))(v10, v8, 0);
  }
}

id __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F77FB8]);
  id v3 = [*(id *)(a1 + 32) assetDownloadIdentifier];
  id v4 = (void *)[v2 initWithType:v3];

  v5 = [*(id *)(a1 + 40) logicalScreenClass];
  [v4 addKeyValuePair:@"WallpaperLogicalScreenClass" with:v5];

  uint64_t v6 = [*(id *)(a1 + 40) identifierString];
  [v4 addKeyValuePair:@"WallpaperIdentifier" with:v6];

  id v7 = [*(id *)(a1 + 40) name];
  [v4 addKeyValuePair:@"WallpaperName" with:v7];

  id v8 = (void *)MEMORY[0x1E4F7A0D8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_2;
  v12[3] = &unk_1E6376DD0;
  id v13 = v4;
  id v9 = v4;
  id v10 = [v8 lazyFutureWithBlock:v12];

  return v10;
}

void __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_3;
  v6[3] = &unk_1E6376DA8;
  id v7 = v3;
  id v4 = *(void **)(a1 + 32);
  id v8 = v4;
  id v5 = v3;
  [v4 queryMetaDataWithError:v6];
}

void __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a3;
  id v7 = [v4 results];
  uint64_t v6 = [v7 firstObject];
  [v3 finishWithResult:v6 error:v5];
}

id __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_5;
  v8[3] = &unk_1E6376E70;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  id v5 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 40);
  uint64_t v6 = [v4 lazyFutureWithBlock:v8];

  objc_destroyWeak(&v12);
  return v6;
}

void __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_opt_class();
  id v5 = [*(id *)(a1 + 32) attributes];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"WallpaperBundleName"];
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  id v9 = [v8 stringByAppendingPathExtension:@"wallpaper"];
  if ([*(id *)(a1 + 32) state] == 1)
  {
    id v10 = *(void **)(a1 + 40);
    if (v10)
    {
      long long v11 = *(void **)(a1 + 32);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_6;
      v22[3] = &unk_1E6376E20;
      id v23 = v10;
      [v11 attachProgressCallBack:v22];
    }
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [WeakRetained _activeDownloads];
    [v13 setObject:v12 forKeyedSubscript:*(void *)(a1 + 48)];

    v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 56);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_7;
    v18[3] = &unk_1E6376E48;
    id v19 = v3;
    id v20 = *(id *)(a1 + 32);
    id v21 = v9;
    [v14 startDownload:v15 completionWithError:v18];
  }
  else
  {
    v16 = [*(id *)(a1 + 32) getLocalUrl];
    v17 = [v16 URLByAppendingPathComponent:v9];
    [v3 finishWithResult:v17];
  }
}

uint64_t __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setTotalUnitCount:", objc_msgSend(v3, "totalExpected"));
  uint64_t v4 = [v3 totalWritten];

  id v5 = *(void **)(a1 + 32);
  return [v5 setCompletedUnitCount:v4];
}

void __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_7(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)a1[4];
  id v5 = (void *)a1[5];
  id v6 = a3;
  id v8 = [v5 getLocalUrl];
  id v7 = [v8 URLByAppendingPathComponent:a1[6]];
  [v4 finishWithResult:v7 error:v6];
}

void __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = [WeakRetained _activeDownloads];
  [v8 removeObjectForKey:*(void *)(a1 + 32)];

  if (!v6)
  {
    if (+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:v5])
    {
      id v10 = [[WKWallpaperBundle alloc] initWithURL:v5];
      long long v11 = [WeakRetained _loadingQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_9;
      block[3] = &unk_1E6376EC0;
      uint64_t v12 = *(void *)(a1 + 32);
      block[4] = WeakRetained;
      void block[5] = v12;
      block[6] = v10;
      dispatch_async(v11, block);

      uint64_t v13 = *(void *)(a1 + 40);
      if (v13) {
        (*(void (**)(uint64_t, WKWallpaperBundle *, void))(v13 + 16))(v13, v10, 0);
      }
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 40);
      if (!v14) {
        goto LABEL_10;
      }
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:WKWallpaperKitErrorDomain code:-10028 userInfo:0];
      (*(void (**)(uint64_t, void, WKWallpaperBundle *))(v14 + 16))(v14, 0, v10);
    }

    goto LABEL_10;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
  }
LABEL_10:
}

void __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) _localAssetLookup];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)cancelDownloadForWallpaperRepresenting:(id)a3 withCompletion:(id)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 identifierString];
  v21[0] = v8;
  uint64_t v9 = [v7 name];

  v21[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  long long v11 = [v10 componentsJoinedByString:@"."];

  uint64_t v12 = [(WKWallpaperBundleDownloadManager *)self _activeDownloads];
  uint64_t v13 = [v12 objectForKeyedSubscript:v11];

  uint64_t v14 = [(WKWallpaperBundleDownloadManager *)self _activeDownloads];
  [v14 removeObjectForKey:v11];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __90__WKWallpaperBundleDownloadManager_cancelDownloadForWallpaperRepresenting_withCompletion___block_invoke;
  v20[3] = &unk_1E6376DD0;
  v20[4] = v13;
  uint64_t v15 = [MEMORY[0x1E4F7A0D8] lazyFutureWithBlock:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __90__WKWallpaperBundleDownloadManager_cancelDownloadForWallpaperRepresenting_withCompletion___block_invoke_2;
  v18[3] = &unk_1E6376F38;
  id v19 = v6;
  id v16 = v6;
  id v17 = (id)[v15 addCompletionBlock:v18];
}

void __90__WKWallpaperBundleDownloadManager_cancelDownloadForWallpaperRepresenting_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __90__WKWallpaperBundleDownloadManager_cancelDownloadForWallpaperRepresenting_withCompletion___block_invoke_302;
    v6[3] = &unk_1E6376F10;
    id v7 = v3;
    [v5 cancelDownload:v6];
  }
  else
  {
    [v3 finishWithResult:&unk_1F18C1E98];
  }
}

void __90__WKWallpaperBundleDownloadManager_cancelDownloadForWallpaperRepresenting_withCompletion___block_invoke_302(uint64_t a1, uint64_t a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = WKWallpaperKitErrorDomain;
    uint64_t v9 = @"CancelDownloadResult";
    id v5 = [NSNumber numberWithInteger:a2];
    v10[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = [v3 errorWithDomain:v4 code:-10029 userInfo:v6];
    [v2 finishWithError:v7];
  }
  else
  {
    id v8 = [NSNumber numberWithInteger:0];
    objc_msgSend(v2, "finishWithResult:");
  }
}

uint64_t __90__WKWallpaperBundleDownloadManager_cancelDownloadForWallpaperRepresenting_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (id)localWallpaperRepresentingWithIdentifier:(id)a3 wallpaperName:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v22[0] = v6;
  v22[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  uint64_t v9 = [v8 componentsJoinedByString:@"."];

  objc_initWeak(&location, self);
  id v10 = [(WKWallpaperBundleDownloadManager *)self _loadingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__WKWallpaperBundleDownloadManager_localWallpaperRepresentingWithIdentifier_wallpaperName___block_invoke;
  block[3] = &unk_1E6376F60;
  objc_copyWeak(&v14, &location);
  block[4] = v9;
  void block[5] = &v16;
  dispatch_sync(v10, block);

  id v11 = (id)v17[5];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __91__WKWallpaperBundleDownloadManager_localWallpaperRepresentingWithIdentifier_wallpaperName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained _localAssetLookup];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_startCatalogDownload
{
  uint64_t v3 = [(WKWallpaperBundleDownloadManager *)self _catalogDownloadResult];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [(WKWallpaperBundleDownloadManager *)self _catalogDownloadError],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    id v8 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v9 = [(WKWallpaperBundleDownloadManager *)self _catalogDownloadResult];
    id v7 = [v8 futureWithResult:v9];
  }
  else
  {
    objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x1E4F7A0D8];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__WKWallpaperBundleDownloadManager__startCatalogDownload__block_invoke;
    v11[3] = &unk_1E6376FB0;
    v11[4] = self;
    objc_copyWeak(&v12, &location);
    id v7 = [v6 lazyFutureWithBlock:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __57__WKWallpaperBundleDownloadManager__startCatalogDownload__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F77FE8]);
  [v4 setDiscretionary:0];
  [v4 setTimeoutIntervalForResource:10];
  id v5 = WKLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v13 = "-[WKWallpaperBundleDownloadManager _startCatalogDownload]_block_invoke";
    _os_log_impl(&dword_1BE13A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: started download for catalog", buf, 0xCu);
  }

  id v6 = (void *)MEMORY[0x1E4F77FB0];
  id v7 = [*(id *)(a1 + 32) assetDownloadIdentifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__WKWallpaperBundleDownloadManager__startCatalogDownload__block_invoke_311;
  v9[3] = &unk_1E6376F88;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v8 = v3;
  id v10 = v8;
  [v6 startCatalogDownload:v7 options:v4 completionWithError:v9];

  objc_destroyWeak(&v11);
}

void __57__WKWallpaperBundleDownloadManager__startCatalogDownload__block_invoke_311(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WKLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v18 = "-[WKWallpaperBundleDownloadManager _startCatalogDownload]_block_invoke";
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1BE13A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: completed for catalog, error: %@", buf, 0x16u);
  }

  id v8 = [NSNumber numberWithInteger:a2];
  objc_msgSend(WeakRetained, "set_catalogDownloadResult:", v8);

  objc_msgSend(WeakRetained, "set_catalogDownloadError:", v5);
  uint64_t v9 = [v5 userInfo];
  id v10 = [v9 objectForKeyedSubscript:@"checkTimeoutConditions"];

  if (v10)
  {
    id v11 = WKLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v18 = "-[WKWallpaperBundleDownloadManager _startCatalogDownload]_block_invoke";
      _os_log_impl(&dword_1BE13A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: received error with MAIsErrorKeySuggestingCheckTimeoutConditions for catalog", buf, 0xCu);
    }

    id v12 = [WeakRetained delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__WKWallpaperBundleDownloadManager__startCatalogDownload__block_invoke_317;
      block[3] = &unk_1E6376C98;
      block[4] = WeakRetained;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  uint64_t v14 = *(void **)(a1 + 32);
  uint64_t v15 = [NSNumber numberWithInteger:a2];
  [v14 finishWithResult:v15 error:v5];
}

void __57__WKWallpaperBundleDownloadManager__startCatalogDownload__block_invoke_317(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 downloadManagerDidEncounterNetworkConnectionError];
}

- (NSString)assetDownloadIdentifier
{
  return self->_assetDownloadIdentifier;
}

- (WKWallpaperBundleDownloadManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WKWallpaperBundleDownloadManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)_loadingQueue
{
  return self->__loadingQueue;
}

- (void)set_loadingQueue:(id)a3
{
}

- (NSNumber)_catalogDownloadResult
{
  return self->__catalogDownloadResult;
}

- (void)set_catalogDownloadResult:(id)a3
{
}

- (NSError)_catalogDownloadError
{
  return self->__catalogDownloadError;
}

- (void)set_catalogDownloadError:(id)a3
{
}

- (NSMutableDictionary)_localAssetLookup
{
  return self->__localAssetLookup;
}

- (void)set_localAssetLookup:(id)a3
{
}

- (NSMutableDictionary)_activeDownloads
{
  return self->__activeDownloads;
}

- (void)set_activeDownloads:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeDownloads, 0);
  objc_storeStrong((id *)&self->__localAssetLookup, 0);
  objc_storeStrong((id *)&self->__catalogDownloadError, 0);
  objc_storeStrong((id *)&self->__catalogDownloadResult, 0);
  objc_storeStrong((id *)&self->__loadingQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetDownloadIdentifier, 0);
}

@end