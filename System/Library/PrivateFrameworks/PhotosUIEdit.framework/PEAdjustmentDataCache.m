@interface PEAdjustmentDataCache
+ (CGSize)synchronousInputSizeForAsset:(id)a3 disposition:(int64_t *)a4;
+ (id)compositionControllerForAssetIfLoaded:(id)a3 disposition:(int64_t *)a4;
+ (id)entryForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 disposition:(int64_t *)a5 originalAdjustmentData:(BOOL)a6;
+ (id)synchronousCompositionControllerForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 disposition:(int64_t *)a5 originalComposition:(BOOL)a6;
+ (id)synchronousEditorBundleIDForAsset:(id)a3;
+ (void)initialize;
+ (void)requestCompositionControllerForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 queue:(id)a5 completion:(id)a6;
@end

@implementation PEAdjustmentDataCache

+ (id)entryForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 disposition:(int64_t *)a5 originalAdjustmentData:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v9 = a3;
  v10 = [[PEAdjustmentDataCacheKey alloc] initWithAsset:v9 originalAdjustmentData:v6];
  v11 = [(id)sCache objectForKey:v10];
  if (!v11)
  {
    v11 = [[PEAdjustmentDataCacheEntry alloc] initWithAsset:v9 networkAccessAllowed:v8 originalAdjustmentData:v6];
    [(id)sCache setObject:v11 forKey:v10];
  }
  [(PEAdjustmentDataCacheEntry *)v11 waitForResultsWithTimeout];
  if (a5)
  {
    if (v11) {
      int64_t v12 = [(PEAdjustmentDataCacheEntry *)v11 disposition];
    }
    else {
      int64_t v12 = [v9 hasAdjustments] ^ 1;
    }
    *a5 = v12;
  }

  return v11;
}

+ (CGSize)synchronousInputSizeForAsset:(id)a3 disposition:(int64_t *)a4
{
  v4 = +[PEAdjustmentDataCache entryForAsset:a3 networkAccessAllowed:1 disposition:a4 originalAdjustmentData:0];
  [v4 inputSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (id)synchronousEditorBundleIDForAsset:(id)a3
{
  uint64_t v6 = 0;
  v3 = +[PEAdjustmentDataCache entryForAsset:a3 networkAccessAllowed:0 disposition:&v6 originalAdjustmentData:0];
  v4 = [v3 editorBundleID];

  return v4;
}

+ (id)synchronousCompositionControllerForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 disposition:(int64_t *)a5 originalComposition:(BOOL)a6
{
  uint64_t v6 = +[PEAdjustmentDataCache entryForAsset:a3 networkAccessAllowed:a4 disposition:a5 originalAdjustmentData:a6];
  double v7 = [v6 compositionController];

  return v7;
}

+ (id)compositionControllerForAssetIfLoaded:(id)a3 disposition:(int64_t *)a4
{
  id v5 = a3;
  uint64_t v6 = [[PEAdjustmentDataCacheKey alloc] initWithAsset:v5 originalAdjustmentData:0];
  double v7 = [(id)sCache objectForKey:v6];
  double v8 = v7;
  if (a4)
  {
    if (v7) {
      int64_t v9 = [v7 disposition];
    }
    else {
      int64_t v9 = [v5 hasAdjustments] ^ 1;
    }
    *a4 = v9;
  }
  double v10 = [v8 compositionController];

  return v10;
}

+ (void)requestCompositionControllerForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 queue:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  int64_t v12 = [[PEAdjustmentDataCacheKey alloc] initWithAsset:v9 originalAdjustmentData:0];
  v13 = [(id)sCache objectForKey:v12];
  if (!v13)
  {
    v13 = [[PEAdjustmentDataCacheEntry alloc] initWithAsset:v9 networkAccessAllowed:v8 originalAdjustmentData:0];
    [(id)sCache setObject:v13 forKey:v12];
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __100__PEAdjustmentDataCache_requestCompositionControllerForAsset_networkAccessAllowed_queue_completion___block_invoke;
  v15[3] = &unk_2642BEDE8;
  id v16 = v11;
  id v14 = v11;
  [(PEAdjustmentDataCacheEntry *)v13 deliverOn:v10 completion:v15];
}

void __100__PEAdjustmentDataCache_requestCompositionControllerForAsset_networkAccessAllowed_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 compositionController];
  uint64_t v4 = [v3 disposition];

  (*(void (**)(uint64_t, id, uint64_t))(v2 + 16))(v2, v5, v4);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF8E0]);
    id v3 = (void *)sCache;
    sCache = (uint64_t)v2;

    uint64_t v4 = (void *)sCache;
    [v4 setCountLimit:30];
  }
}

@end