@interface PKMobileAssetManager
+ (PKMobileAssetManager)sharedInstance;
- (PKMobileAssetManager)init;
- (id)_cachedAssetWithQuery:(id)a3;
- (id)_compatibleVersionsWithMinimumVersion:(unint64_t)a3 maximumVersion:(unint64_t)a4;
- (id)_downloadOptionsWithTimeout:(int64_t)a3 isDiscretionary:(BOOL)a4;
- (id)_queryForCityCodeStationProvider:(id)a3;
- (id)_queryForDynamicAssetsWithParameters:(id)a3;
- (id)_queryForMarketNotificationIdentifier:(id)a3;
- (id)_queryForStationCodeData:(id)a3;
- (id)_queryForStringsBundleWithIdentifier:(id)a3;
- (id)cachedDynamicAssetWithIdentifier:(id)a3 parameters:(id)a4;
- (id)cachedDynamicAssetsIndex;
- (id)cachedStringsBundleWithIdentifier:(id)a3;
- (id)sortDescriptorsForLatestContentVersion;
- (id)sortDescriptorsForMarkets;
- (void)_downloadAllPrefetchableAssets:(id)a3;
- (void)_downloadAsset:(id)a3 isDiscretionary:(BOOL)a4 timeout:(int64_t)a5 completion:(id)a6;
- (void)_downloadAssetCatalogIfExpired:(unint64_t)a3 completion:(id)a4;
- (void)_purgeAssets:(id)a3;
- (void)_retrieveAssetWithQuery:(id)a3 maxCompatibleVersion:(unint64_t)a4 isDiscretionary:(BOOL)a5 sortDescriptors:(id)a6 timeout:(unint64_t)a7 catalogExpirationDays:(unint64_t)a8 completion:(id)a9;
- (void)dynamicAssetWithIdentifier:(id)a3 mappedIdentifierPrefix:(id)a4 parameters:(id)a5 timeout:(unint64_t)a6 completion:(id)a7;
- (void)dynamicAssetWithIdentifier:(id)a3 parameters:(id)a4 timeout:(unint64_t)a5 completion:(id)a6;
- (void)dynamicAssetsIndex:(id)a3;
- (void)fetchCityStationProviderAssetForBaseProvider:(id)a3 completionHandler:(id)a4;
- (void)fetchMarketNotificationAssetsForIdentifier:(id)a3 isDiscretionary:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchRPIdentifierMappingDiscretionary:(BOOL)a3 localOnly:(BOOL)a4 completionHandler:(id)a5;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)schedulePrefetchDynamicAssetsWithInterval:(double)a3 queue:(id)a4;
- (void)stationCodeDataForStationCodeProvider:(id)a3 completionHandler:(id)a4;
- (void)stringsBundleWithIdentifier:(id)a3 timeout:(unint64_t)a4 completion:(id)a5;
@end

@implementation PKMobileAssetManager

+ (PKMobileAssetManager)sharedInstance
{
  if (_MergedGlobals_291 != -1) {
    dispatch_once(&_MergedGlobals_291, &__block_literal_global_228);
  }
  v2 = (void *)qword_1EB403640;
  return (PKMobileAssetManager *)v2;
}

void __38__PKMobileAssetManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PKMobileAssetManager);
  v1 = (void *)qword_1EB403640;
  qword_1EB403640 = (uint64_t)v0;
}

- (PKMobileAssetManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKMobileAssetManager;
  v2 = [(PKMobileAssetManager *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.passkitcore.mobileasset.fetch", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v6 = objc_opt_new();
    cachedStringsBundles = v2->_cachedStringsBundles;
    v2->_cachedStringsBundles = (NSMutableDictionary *)v6;
  }
  return v2;
}

- (void)fetchMarketNotificationAssetsForIdentifier:(id)a3 isDiscretionary:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (v5) {
    uint64_t v9 = 120;
  }
  else {
    uint64_t v9 = 30;
  }
  v10 = [(PKMobileAssetManager *)self _queryForMarketNotificationIdentifier:a3];
  v11 = [(PKMobileAssetManager *)self sortDescriptorsForMarkets];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__PKMobileAssetManager_fetchMarketNotificationAssetsForIdentifier_isDiscretionary_completionHandler___block_invoke;
  v13[3] = &unk_1E56E3908;
  id v14 = v8;
  id v12 = v8;
  [(PKMobileAssetManager *)self _retrieveAssetWithQuery:v10 maxCompatibleVersion:2 isDiscretionary:v5 sortDescriptors:v11 timeout:v9 catalogExpirationDays:7 completion:v13];
}

void __101__PKMobileAssetManager_fetchMarketNotificationAssetsForIdentifier_isDiscretionary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    if (!v8 || v5)
    {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v5);
    }
    else
    {
      v7 = [v8 bundleURL];
      (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
    }
  }
}

- (void)fetchCityStationProviderAssetForBaseProvider:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = [(PKMobileAssetManager *)self _queryForCityCodeStationProvider:a3];
  id v8 = [(PKMobileAssetManager *)self sortDescriptorsForLatestContentVersion];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__PKMobileAssetManager_fetchCityStationProviderAssetForBaseProvider_completionHandler___block_invoke;
  v10[3] = &unk_1E56E3908;
  id v11 = v6;
  id v9 = v6;
  [(PKMobileAssetManager *)self _retrieveAssetWithQuery:v7 maxCompatibleVersion:2 isDiscretionary:0 sortDescriptors:v8 timeout:120 catalogExpirationDays:1 completion:v10];
}

void __87__PKMobileAssetManager_fetchCityStationProviderAssetForBaseProvider_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    if (!v8 || v5)
    {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v5);
    }
    else
    {
      v7 = [v8 URLForResource:@"BaseProvider" withExtension:@"plist"];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (void)stationCodeDataForStationCodeProvider:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = [(PKMobileAssetManager *)self _queryForStationCodeData:a3];
  id v8 = [(PKMobileAssetManager *)self sortDescriptorsForLatestContentVersion];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__PKMobileAssetManager_stationCodeDataForStationCodeProvider_completionHandler___block_invoke;
  v10[3] = &unk_1E56E3908;
  id v11 = v6;
  id v9 = v6;
  [(PKMobileAssetManager *)self _retrieveAssetWithQuery:v7 maxCompatibleVersion:1 isDiscretionary:0 sortDescriptors:v8 timeout:120 catalogExpirationDays:7 completion:v10];
}

void __80__PKMobileAssetManager_stationCodeDataForStationCodeProvider_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    if (!v8 || v5)
    {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v5);
    }
    else
    {
      v7 = [v8 bundleURL];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (void)fetchRPIdentifierMappingDiscretionary:(BOOL)a3 localOnly:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PKMobileAssetManager_fetchRPIdentifierMappingDiscretionary_localOnly_completionHandler___block_invoke;
  aBlock[3] = &unk_1E56E3908;
  id v9 = v8;
  id v18 = v9;
  v10 = (void (**)(void *, void *, void))_Block_copy(aBlock);
  id v11 = [(PKMobileAssetManager *)self _compatibleVersionsWithMinimumVersion:1 maximumVersion:1];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:@"com.apple.MobileAsset.WalletMobileAssets"];
  [v12 returnTypes:2];
  [v12 addKeyValuePair:@"Feature" with:@"RPIdentifierMapping"];
  [v12 addKeyValueArray:*MEMORY[0x1E4F77F18] with:v11];
  if (v5)
  {
    v13 = [(PKMobileAssetManager *)self _cachedAssetWithQuery:v12];
    v10[2](v10, v13, 0);
  }
  else
  {
    id v14 = [(PKMobileAssetManager *)self sortDescriptorsForLatestContentVersion];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __90__PKMobileAssetManager_fetchRPIdentifierMappingDiscretionary_localOnly_completionHandler___block_invoke_2;
    v15[3] = &unk_1E56E3908;
    v16 = v10;
    [(PKMobileAssetManager *)self _retrieveAssetWithQuery:v12 maxCompatibleVersion:1 isDiscretionary:v6 sortDescriptors:v14 timeout:120 catalogExpirationDays:7 completion:v15];

    v13 = v16;
  }
}

void __90__PKMobileAssetManager_fetchRPIdentifierMappingDiscretionary_localOnly_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    if (v8)
    {
      v7 = [v8 URLForResource:@"RPIdentifierMapping" withExtension:@"json"];
      uint64_t v6 = *(void *)(a1 + 32);
    }
    else
    {
      v7 = 0;
    }
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
  }
}

uint64_t __90__PKMobileAssetManager_fetchRPIdentifierMappingDiscretionary_localOnly_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sortDescriptorsForMarkets
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"attributes" ascending:1 comparator:&__block_literal_global_363];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

uint64_t __49__PKMobileAssetManager_sortDescriptorsForMarkets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *MEMORY[0x1E4F77F20];
  id v5 = a3;
  uint64_t v6 = [a2 objectForKey:v4];
  uint64_t v7 = [v6 integerValue];

  id v8 = [v5 objectForKey:v4];

  uint64_t v9 = [v8 integerValue];
  if (v7 > v9) {
    return -1;
  }
  else {
    return v7 < v9;
  }
}

- (id)cachedDynamicAssetWithIdentifier:(id)a3 parameters:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[[v6 alloc] initWithDictionary:v7];

  v10 = [(PKMobileAssetManager *)self cachedDynamicAssetsIndex];
  id v11 = [v10 mappedAssetIdentifier:v8];

  [v9 setValue:v11 forKey:@"Identifier"];
  id v12 = [(PKMobileAssetManager *)self _queryForDynamicAssetsWithParameters:v9];
  v13 = [(PKMobileAssetManager *)self _cachedAssetWithQuery:v12];

  return v13;
}

- (void)dynamicAssetWithIdentifier:(id)a3 parameters:(id)a4 timeout:(unint64_t)a5 completion:(id)a6
{
}

- (void)dynamicAssetWithIdentifier:(id)a3 mappedIdentifierPrefix:(id)a4 parameters:(id)a5 timeout:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__85;
  v42 = __Block_byref_object_dispose__85;
  dispatch_source_t v43 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  v16 = v39[5];
  dispatch_time_t v17 = dispatch_time(0, 1000000000 * a6);
  dispatch_source_set_timer(v16, v17, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  id v18 = v39[5];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __104__PKMobileAssetManager_dynamicAssetWithIdentifier_mappedIdentifierPrefix_parameters_timeout_completion___block_invoke;
  handler[3] = &unk_1E56F6770;
  v36 = &v38;
  id v19 = v15;
  id v35 = v19;
  id v20 = v12;
  id v34 = v20;
  unint64_t v37 = a6;
  dispatch_source_set_event_handler(v18, handler);
  dispatch_resume((dispatch_object_t)v39[5]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __104__PKMobileAssetManager_dynamicAssetWithIdentifier_mappedIdentifierPrefix_parameters_timeout_completion___block_invoke_366;
  v25[3] = &unk_1E56F67E8;
  v31 = &v38;
  id v21 = v14;
  id v26 = v21;
  id v22 = v20;
  id v27 = v22;
  id v23 = v13;
  id v28 = v23;
  v29 = self;
  unint64_t v32 = a6;
  id v24 = v19;
  id v30 = v24;
  [(PKMobileAssetManager *)self dynamicAssetsIndex:v25];

  _Block_object_dispose(&v38, 8);
}

void __104__PKMobileAssetManager_dynamicAssetWithIdentifier_mappedIdentifierPrefix_parameters_timeout_completion___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:4 userInfo:0];
    (*(void (**)(void))(a1[5] + 16))();
    uint64_t v3 = *(void *)(a1[6] + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  id v5 = PKLogFacilityTypeGetObject(0xAuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[7];
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Error: fetching dynamic asset with identifier %@ timed out after %lu seconds", (uint8_t *)&v8, 0x16u);
  }
}

void __104__PKMobileAssetManager_dynamicAssetWithIdentifier_mappedIdentifierPrefix_parameters_timeout_completion___block_invoke_366(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:*(void *)(a1 + 32)];
    int v8 = [v5 mappedAssetIdentifier:*(void *)(a1 + 40)];
    uint64_t v9 = v8;
    if (!v8) {
      uint64_t v9 = *(void **)(a1 + 40);
    }
    id v10 = v9;

    uint64_t v11 = *(void **)(a1 + 48);
    if (v11)
    {
      uint64_t v12 = [v11 stringByAppendingString:v10];

      id v10 = (id)v12;
    }
    [v7 setValue:v10 forKey:@"Identifier"];
    id v13 = [*(id *)(a1 + 56) _queryForDynamicAssetsWithParameters:v7];
    id v14 = *(void **)(a1 + 56);
    id v15 = [v14 sortDescriptorsForLatestContentVersion];
    uint64_t v16 = *(void *)(a1 + 80);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __104__PKMobileAssetManager_dynamicAssetWithIdentifier_mappedIdentifierPrefix_parameters_timeout_completion___block_invoke_367;
    v19[3] = &unk_1E56F67C0;
    v19[4] = *(void *)(a1 + 56);
    long long v18 = *(_OWORD *)(a1 + 64);
    id v17 = (id)v18;
    long long v20 = v18;
    [v14 _retrieveAssetWithQuery:v13 maxCompatibleVersion:1 isDiscretionary:0 sortDescriptors:v15 timeout:v16 catalogExpirationDays:7 completion:v19];
  }
  else
  {
    uint64_t v7 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Skipping asset query because asset index timed out", buf, 2u);
    }
  }
}

void __104__PKMobileAssetManager_dynamicAssetWithIdentifier_mappedIdentifierPrefix_parameters_timeout_completion___block_invoke_367(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__PKMobileAssetManager_dynamicAssetWithIdentifier_mappedIdentifierPrefix_parameters_timeout_completion___block_invoke_2;
  block[3] = &unk_1E56F6798;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v13 = v5;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

NSObject *__104__PKMobileAssetManager_dynamicAssetWithIdentifier_mappedIdentifierPrefix_parameters_timeout_completion___block_invoke_2(uint64_t a1)
{
  result = *(NSObject **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (result)
  {
    dispatch_source_cancel(result);
    result = *(NSObject **)(a1 + 48);
    if (result)
    {
      isa = (uint64_t (*)(void))result[2].isa;
      return isa();
    }
  }
  return result;
}

- (id)cachedDynamicAssetsIndex
{
  v12[1] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_dynamicAssetsIndex;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    long long v11 = @"Type";
    v12[0] = @"Index";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v7 = [(PKMobileAssetManager *)self _queryForDynamicAssetsWithParameters:v6];

    id v8 = [(PKMobileAssetManager *)self _cachedAssetWithQuery:v7];
    id v9 = [v8 URLForResource:@"Index" withExtension:@"plist"];
    id v5 = [[PKDynamicAssetIndex alloc] initWithContentsOfURL:v9];
  }
  return v5;
}

- (void)dynamicAssetsIndex:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, PKDynamicAssetIndex *, void))a3;
  long long v11 = @"Type";
  v12[0] = @"Index";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v6 = [(PKMobileAssetManager *)self _queryForDynamicAssetsWithParameters:v5];

  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = self->_dynamicAssetsIndex;
  os_unfair_lock_unlock(&self->_lock);
  if (v7)
  {
    if (v4) {
      v4[2](v4, v7, 0);
    }
  }
  else
  {
    id v8 = [(PKMobileAssetManager *)self sortDescriptorsForLatestContentVersion];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__PKMobileAssetManager_dynamicAssetsIndex___block_invoke;
    v9[3] = &unk_1E56DC070;
    v9[4] = self;
    id v10 = v4;
    [(PKMobileAssetManager *)self _retrieveAssetWithQuery:v6 maxCompatibleVersion:1 isDiscretionary:0 sortDescriptors:v8 timeout:30 catalogExpirationDays:7 completion:v9];
  }
}

void __43__PKMobileAssetManager_dynamicAssetsIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (!v10 || v5)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v5);
    }
  }
  else
  {
    id v6 = [v10 URLForResource:@"Index" withExtension:@"plist"];
    uint64_t v7 = [[PKDynamicAssetIndex alloc] initWithContentsOfURL:v6];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v7);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, PKDynamicAssetIndex *, void))(v8 + 16))(v8, v7, 0);
    }
  }
}

- (id)cachedStringsBundleWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(NSMutableDictionary *)self->_cachedStringsBundles objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
  {
    id v6 = [(PKMobileAssetManager *)self _queryForStringsBundleWithIdentifier:v4];
    id v5 = [(PKMobileAssetManager *)self _cachedAssetWithQuery:v6];
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_cachedStringsBundles setObject:v5 forKeyedSubscript:v4];
    os_unfair_lock_unlock(&self->_lock);
  }
  return v5;
}

- (void)stringsBundleWithIdentifier:(id)a3 timeout:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(PKMobileAssetManager *)self _queryForStringsBundleWithIdentifier:v8];
  long long v11 = [(PKMobileAssetManager *)self sortDescriptorsForLatestContentVersion];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__PKMobileAssetManager_stringsBundleWithIdentifier_timeout_completion___block_invoke;
  v14[3] = &unk_1E56F6810;
  id v15 = v8;
  id v16 = v9;
  v14[4] = self;
  id v12 = v8;
  id v13 = v9;
  [(PKMobileAssetManager *)self _retrieveAssetWithQuery:v10 maxCompatibleVersion:1 isDiscretionary:0 sortDescriptors:v11 timeout:a4 catalogExpirationDays:7 completion:v14];
}

void __71__PKMobileAssetManager_stringsBundleWithIdentifier_timeout_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = a1[6];
    if (!v6) {
      goto LABEL_7;
    }
    uint64_t v7 = *(void (**)(void))(v6 + 16);
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 32));
    [*(id *)(a1[4] + 24) setObject:v9 forKeyedSubscript:a1[5]];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 32));
    uint64_t v8 = a1[6];
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v7 = *(void (**)(void))(v8 + 16);
  }
  v7();
LABEL_7:
}

- (void)_downloadAllPrefetchableAssets:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke;
  v6[3] = &unk_1E56D86A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PKMobileAssetManager *)self _downloadAssetCatalogIfExpired:0 completion:v6];
}

void __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Continuing prefetch with expired catalog", buf, 2u);
    }
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:@"com.apple.MobileAsset.WalletMobileAssets"];
  [v4 returnTypes:2];
  [v4 addKeyValuePair:@"Prefetch" with:@"YES"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke_374;
  v8[3] = &unk_1E56D9290;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v4;
  [v7 queryMetaData:v8];
}

void __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke_374(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v24 = a2;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Failed to query prefetch assets result %lu", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) results];
    uint64_t v6 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v24 = [v5 count];
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Found %lu prefetchable assets in Mobile Assets", buf, 0xCu);
    }

    id v7 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v3 = v5;
    uint64_t v8 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v3);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke_376;
          v17[3] = &unk_1E56E1DD0;
          v17[4] = *(void *)(a1 + 40);
          v17[5] = v12;
          [(PKAsyncUnaryOperationComposer *)v7 addOperation:v17];
        }
        uint64_t v9 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    id v13 = [MEMORY[0x1E4F1CA98] null];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke_380;
    v15[3] = &unk_1E56E3B10;
    id v16 = *(id *)(a1 + 48);
    id v14 = [(PKAsyncUnaryOperationComposer *)v7 evaluateWithInput:v13 completion:v15];
  }
}

void __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke_376(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke_2;
  v12[3] = &unk_1E56F6838;
  id v13 = v6;
  id v14 = v7;
  v12[4] = v8;
  id v10 = v6;
  id v11 = v7;
  [v9 _downloadAsset:v8 isDiscretionary:1 timeout:120 completion:v12];
}

uint64_t __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2 > 0x1D || ((1 << a2) & 0x2000C001) == 0)
  {
    uint64_t v5 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) assetId];
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2048;
      unint64_t v10 = a2;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Unable to prefetch asset %@: %lu", (uint8_t *)&v7, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __55__PKMobileAssetManager__downloadAllPrefetchableAssets___block_invoke_380(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)schedulePrefetchDynamicAssetsWithInterval:(double)a3 queue:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = PDScheduledActivityGetCriteria(@"PKMobileAssetManager", @"PrefetchDynamicAssets");
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 repeatInterval];
    double v10 = v9;
    uint64_t v11 = PKLogFacilityTypeGetObject(0xAuLL);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10 == a3)
    {
      if (v12)
      {
        *(_DWORD *)buf = 134217984;
        double v20 = a3;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Skipping scheduling prefetch. Activity already exists with interval %f.", buf, 0xCu);
      }
      goto LABEL_15;
    }
    if (v12)
    {
      *(_DWORD *)buf = 134217984;
      double v20 = a3;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Removing prefetch activity with interval %f.", buf, 0xCu);
    }

    PDScheduledActivityRemove(@"PKMobileAssetManager", @"PrefetchDynamicAssets");
  }
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:60.0];
  id v13 = +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:v11];
  [v13 setRequireNetworkConnectivity:1];
  [v13 setRequireScreenSleep:1];
  [v13 setRequireMainsPower:1];
  [v13 setRepeating:1];
  double v14 = 86400.0;
  if (a3 > 0.0) {
    double v14 = a3;
  }
  [v13 setRepeatInterval:v14];
  [v13 setReason:@"Prefetch provisioning assets"];
  id v15 = PKLogFacilityTypeGetObject(0xAuLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v13 debugDescription];
    *(_DWORD *)buf = 138412290;
    double v20 = *(double *)&v16;
    _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Scheduling prefetch mobile assets: %@", buf, 0xCu);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__PKMobileAssetManager_schedulePrefetchDynamicAssetsWithInterval_queue___block_invoke;
  v17[3] = &unk_1E56D8A90;
  v17[4] = self;
  id v18 = v6;
  if (schedulePrefetchDynamicAssetsWithInterval_queue__onceToken[0] != -1) {
    dispatch_once(schedulePrefetchDynamicAssetsWithInterval_queue__onceToken, v17);
  }
  _PDScheduledActivityRegister(@"PKMobileAssetManager", @"PrefetchDynamicAssets", v13, 0);

LABEL_15:
}

void __72__PKMobileAssetManager_schedulePrefetchDynamicAssetsWithInterval_queue___block_invoke(uint64_t a1)
{
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (__CFString *)v6;
  double v9 = v8;
  if (v8 == @"PrefetchDynamicAssets"
    || v8
    && (int v10 = [(__CFString *)v8 isEqualToString:@"PrefetchDynamicAssets"],
        v9,
        v10))
  {
    [(PKMobileAssetManager *)self prefetchDynamicAssets:&__block_literal_global_389];
  }
  else
  {
    uint64_t v11 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v9;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Unknown scheduled activity: %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

void __80__PKMobileAssetManager_performScheduledActivityWithIdentifier_activityCriteria___block_invoke()
{
  v0 = PKLogFacilityTypeGetObject(0xAuLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_190E10000, v0, OS_LOG_TYPE_DEFAULT, "Finished prefetch", v1, 2u);
  }
}

- (id)_queryForMarketNotificationIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKMobileAssetManager *)self _compatibleVersionsWithMinimumVersion:2 maximumVersion:2];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:@"com.apple.MobileAsset.WalletMobileAssets"];
  [v6 returnTypes:2];
  [v6 addKeyValuePair:@"Market" with:v4];

  [v6 addKeyValueArray:*MEMORY[0x1E4F77F18] with:v5];
  return v6;
}

- (id)_queryForCityCodeStationProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKMobileAssetManager *)self _compatibleVersionsWithMinimumVersion:2 maximumVersion:2];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:@"com.apple.MobileAsset.WalletMobileAssets"];
  [v6 returnTypes:2];
  [v6 addKeyValuePair:@"CityStationProvider" with:v4];

  [v6 addKeyValueArray:*MEMORY[0x1E4F77F18] with:v5];
  return v6;
}

- (id)_queryForStationCodeData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKMobileAssetManager *)self _compatibleVersionsWithMinimumVersion:1 maximumVersion:1];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:@"com.apple.MobileAsset.WalletMobileAssets"];
  [v6 returnTypes:2];
  [v6 addKeyValuePair:@"StationCodeDataKey" with:v4];

  [v6 addKeyValueArray:*MEMORY[0x1E4F77F18] with:v5];
  return v6;
}

- (id)_queryForDynamicAssetsWithParameters:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:@"com.apple.MobileAsset.WalletMobileAssets"];
  [v4 returnTypes:2];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v13);
        [v4 addKeyValuePair:v10 with:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [v4 addKeyValuePair:@"Feature" with:@"DynamicAssets"];
  return v4;
}

- (id)_queryForStringsBundleWithIdentifier:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F77FB8];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithType:@"com.apple.MobileAsset.WalletMobileAssets"];
  [v5 returnTypes:2];
  [v5 addKeyValuePair:@"Identifier" with:v4];

  [v5 addKeyValuePair:@"Feature" with:@"Strings"];
  return v5;
}

- (id)sortDescriptorsForLatestContentVersion
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"attributes" ascending:1 comparator:&__block_literal_global_391];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

uint64_t __62__PKMobileAssetManager_sortDescriptorsForLatestContentVersion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *MEMORY[0x1E4F77F20];
  id v5 = a3;
  uint64_t v6 = [a2 objectForKey:v4];
  uint64_t v7 = [v6 integerValue];

  uint64_t v8 = [v5 objectForKey:v4];

  uint64_t v9 = [v8 integerValue];
  if (v7 > v9) {
    return -1;
  }
  else {
    return v7 < v9;
  }
}

- (id)_compatibleVersionsWithMinimumVersion:(unint64_t)a3 maximumVersion:(unint64_t)a4
{
  for (id i = objc_alloc_init(MEMORY[0x1E4F1CA48]); a3 <= a4; ++a3)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
    [i addObject:v7];
  }
  return i;
}

- (id)_cachedAssetWithQuery:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 queryMetaDataSync];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      uint64_t v17 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Query failed with result %lu", (uint8_t *)&v16, 0xCu);
    }
  }
  uint64_t v8 = [(PKMobileAssetManager *)self sortDescriptorsForLatestContentVersion];
  uint64_t v9 = [v4 results];

  uint64_t v10 = [v9 sortedArrayUsingDescriptors:v8];
  uint64_t v11 = [v10 firstObject];

  int v12 = [v11 getLocalFileUrl];
  if (v12)
  {
    long long v13 = objc_msgSend(v9, "pk_arrayByRemovingObject:", v11);
    [(PKMobileAssetManager *)self _purgeAssets:v13];

    long long v14 = [MEMORY[0x1E4F28B50] bundleWithURL:v12];
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

- (void)_retrieveAssetWithQuery:(id)a3 maxCompatibleVersion:(unint64_t)a4 isDiscretionary:(BOOL)a5 sortDescriptors:(id)a6 timeout:(unint64_t)a7 catalogExpirationDays:(unint64_t)a8 completion:(id)a9
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a9;
  uint64_t v17 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__85;
  v59[4] = __Block_byref_object_dispose__85;
  id v60 = 0;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke;
  v58[3] = &unk_1E56F6860;
  v58[4] = self;
  v58[5] = a8;
  [(PKAsyncUnaryOperationComposer *)v17 addOperation:v58];
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__85;
  v56[4] = __Block_byref_object_dispose__85;
  id v57 = 0;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__85;
  v54[4] = __Block_byref_object_dispose__85;
  id v55 = 0;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_398;
  v48[3] = &unk_1E56F68B0;
  id v18 = v14;
  id v49 = v18;
  v50 = self;
  v51 = v59;
  v52 = v56;
  v53 = v54;
  [(PKAsyncUnaryOperationComposer *)v17 addOperation:v48];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_400;
  v47[3] = &unk_1E56D9460;
  v47[4] = self;
  v47[5] = v56;
  v47[6] = v54;
  [(PKAsyncUnaryOperationComposer *)v17 addOperation:v47];
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__85;
  v45[4] = __Block_byref_object_dispose__85;
  id v46 = 0;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_2_401;
  v43[3] = &unk_1E56F6900;
  v43[4] = self;
  v43[5] = v54;
  BOOL v44 = a5;
  v43[6] = v59;
  v43[7] = v45;
  [(PKAsyncUnaryOperationComposer *)v17 addOperation:v43];
  long long v19 = [MEMORY[0x1E4F1CA98] null];
  double v20 = [(PKAsyncUnaryOperationComposer *)v17 evaluatorWithInput:v19];

  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__85;
  v41 = __Block_byref_object_dispose__85;
  dispatch_source_t v42 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  uint64_t v21 = v38[5];
  dispatch_time_t v22 = dispatch_time(0, 1000000000 * a7);
  dispatch_source_set_timer(v21, v22, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  id v23 = v38[5];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_402;
  handler[3] = &unk_1E56F6928;
  v36 = &v37;
  id v24 = v20;
  id v34 = v24;
  id v25 = v16;
  id v35 = v25;
  dispatch_source_set_event_handler(v23, handler);
  dispatch_resume((dispatch_object_t)v38[5]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_403;
  v28[3] = &unk_1E56F6950;
  id v30 = &v37;
  id v26 = v25;
  id v29 = v26;
  v31 = v45;
  unint64_t v32 = v59;
  id v27 = (id)[v24 evaluateWithCompletion:v28];

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(v56, 8);

  _Block_object_dispose(v59, 8);
}

void __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_2;
  v12[3] = &unk_1E56D8798;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [v9 _downloadAssetCatalogIfExpired:v8 completion:v12];
}

uint64_t __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Continuing with expired catalog", v5, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_398(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_2_399;
  v14[3] = &unk_1E56F6888;
  uint64_t v9 = *(void *)(a1 + 48);
  id v18 = v7;
  uint64_t v19 = v9;
  id v15 = v6;
  id v10 = v8;
  uint64_t v11 = *(void *)(a1 + 40);
  id v16 = v10;
  uint64_t v17 = v11;
  long long v20 = *(_OWORD *)(a1 + 56);
  id v12 = v6;
  id v13 = v7;
  [v10 queryMetaData:v14];
}

void __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_2_399(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = a2;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Query failed with result %lu", buf, 0xCu);
    }

    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:0 userInfo:0];
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    return;
  }
  uint64_t v8 = [*(id *)(a1 + 40) results];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    uint64_t v17 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [*(id *)(a1 + 40) queryParams];
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v18;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Asset not present in catalog: %@", buf, 0xCu);
    }
    goto LABEL_5;
  }
  id v19 = [*(id *)(a1 + 48) sortDescriptorsForLatestContentVersion];
  id v10 = [*(id *)(a1 + 40) results];
  uint64_t v11 = [v10 sortedArrayUsingDescriptors:v19];
  uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) firstObject];
  uint64_t v15 = *(void *)(*(void *)(a1 + 80) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_400(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = (void *)a1[4];
  uint64_t v6 = *(void **)(*(void *)(a1[5] + 8) + 40);
  uint64_t v7 = *(void *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v8 = a4;
  id v10 = a3;
  uint64_t v9 = objc_msgSend(v6, "pk_arrayByRemovingObject:", v7);
  [v5 _purgeAssets:v9];

  v8[2](v8, v10, 0);
}

void __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_2_401(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 64);
  v14[0] = MEMORY[0x1E4F143A8];
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v14[1] = 3221225472;
  v14[2] = __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_3;
  v14[3] = &unk_1E56F68D8;
  id v15 = v6;
  id v16 = v7;
  int8x16_t v17 = v10;
  uint64_t v18 = *(void *)(a1 + 56);
  id v12 = v6;
  id v13 = v7;
  [v8 _downloadAsset:v11 isDiscretionary:v9 timeout:30 completion:v14];
}

void __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_3(void *a1, unint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2 <= 0x1D && ((1 << a2) & 0x2000C001) != 0)
  {
    uint64_t v4 = [*(id *)(*(void *)(a1[7] + 8) + 40) getLocalFileUrl];
    id v12 = (id)v4;
    if (v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B50] bundleWithURL:v4];
      uint64_t v6 = *(void *)(a1[8] + 8);
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:0];
      uint64_t v6 = *(void *)(a1[6] + 8);
    }
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v14 = a2;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Unable to download asset: %lu", buf, 0xCu);
    }

    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:2 userInfo:0];
    uint64_t v10 = *(void *)(a1[6] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    (*(void (**)(void))(a1[5] + 16))();
  }
}

void __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_402(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:4 userInfo:0];
    [*(id *)(a1 + 32) cancel];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  uint64_t v5 = PKLogFacilityTypeGetObject(0xAuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Failed to download mobile asset", v6, 2u);
  }
}

void __142__PKMobileAssetManager__retrieveAssetWithQuery_maxCompatibleVersion_isDiscretionary_sortDescriptors_timeout_catalogExpirationDays_completion___block_invoke_403(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v6 = a4;
  id v7 = *(NSObject **)(*(void *)(a1[5] + 8) + 40);
  if (v7)
  {
    dispatch_source_cancel(v7);
    uint64_t v8 = a1[4];
    if (v8) {
      (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40));
    }
  }
}

- (void)_purgeAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        unint64_t v9 = [v8 state];
        if (v9 <= 6 && ((1 << v9) & 0x4C) != 0)
        {
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __37__PKMobileAssetManager__purgeAssets___block_invoke;
          v11[3] = &unk_1E56E25E0;
          v11[4] = v8;
          [v8 purge:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

void __37__PKMobileAssetManager__purgeAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PKLogFacilityTypeGetObject(0xAuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2048;
    uint64_t v9 = a2;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Purged asset (%@) with result: %lu", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_downloadAssetCatalogIfExpired:(unint64_t)a3 completion:(id)a4
{
  int v6 = (void (**)(id, uint64_t))a4;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:@"com.apple.MobileAsset.WalletMobileAssets"];
  if ([v7 isCatalogFetchedWithinThePastFewDays:a3]
    && !PKMobileAssetEagerCatalogFetching())
  {
    if (v6) {
      v6[2](v6, 1);
    }
  }
  else
  {
    __int16 v8 = (void *)MEMORY[0x1E4F77FB0];
    uint64_t v9 = [(PKMobileAssetManager *)self _downloadOptionsWithTimeout:20 isDiscretionary:0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__PKMobileAssetManager__downloadAssetCatalogIfExpired_completion___block_invoke;
    v10[3] = &unk_1E56F6978;
    uint64_t v11 = v6;
    [v8 startCatalogDownload:@"com.apple.MobileAsset.WalletMobileAssets" options:v9 then:v10];
  }
}

uint64_t __66__PKMobileAssetManager__downloadAssetCatalogIfExpired_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PKLogFacilityTypeGetObject(0xAuLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      int v8 = 134217984;
      uint64_t v9 = a2;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to fetch asset catalog: %li", (uint8_t *)&v8, 0xCu);
    }

    uint64_t result = *(void *)(a1 + 32);
    if (result)
    {
      uint64_t v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Fetched asset catalog successfully", (uint8_t *)&v8, 2u);
    }

    uint64_t result = *(void *)(a1 + 32);
    if (result)
    {
      uint64_t v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  return result;
}

- (void)_downloadAsset:(id)a3 isDiscretionary:(BOOL)a4 timeout:(int64_t)a5 completion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = (void (**)(id, uint64_t))a6;
  uint64_t v12 = [v10 state];
  if ([v10 wasLocal])
  {
    long long v13 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Asset is already on device with an asset state (%ld)", (uint8_t *)&buf, 0xCu);
    }

    if (v11)
    {
      uint64_t v14 = 14;
      if (v12 == 6) {
        uint64_t v14 = 29;
      }
      if (v12 == 5) {
        uint64_t v15 = 15;
      }
      else {
        uint64_t v15 = v14;
      }
      v11[2](v11, v15);
    }
  }
  else
  {
    if (v12 == 4)
    {
      id v16 = PKLogFacilityTypeGetObject(0xAuLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Asset is already downloading", (uint8_t *)&buf, 2u);
      }
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v33 = 0x3032000000;
    id v34 = __Block_byref_object_copy__85;
    id v35 = __Block_byref_object_dispose__85;
    dispatch_source_t v36 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    uint64_t v17 = *(NSObject **)(*((void *)&buf + 1) + 40);
    dispatch_time_t v18 = dispatch_time(0, 1000000000 * a5);
    dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    id v19 = *(NSObject **)(*((void *)&buf + 1) + 40);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __74__PKMobileAssetManager__downloadAsset_isDiscretionary_timeout_completion___block_invoke;
    handler[3] = &unk_1E56DC448;
    p_long long buf = &buf;
    long long v20 = v11;
    id v28 = v20;
    dispatch_source_set_event_handler(v19, handler);
    dispatch_resume(*(dispatch_object_t *)(*((void *)&buf + 1) + 40));
    uint64_t v21 = PKLogFacilityTypeGetObject(0xAuLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = @"NO";
      if (v8) {
        uint64_t v22 = @"YES";
      }
      *(_DWORD *)id v30 = 138412290;
      v31 = v22;
      _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Beginning download of asset, isDiscretionary: %@", v30, 0xCu);
    }

    id v23 = [(PKMobileAssetManager *)self _downloadOptionsWithTimeout:a5 isDiscretionary:v8];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __74__PKMobileAssetManager__downloadAsset_isDiscretionary_timeout_completion___block_invoke_409;
    v24[3] = &unk_1E56F69C8;
    v24[4] = self;
    id v26 = &buf;
    id v25 = v20;
    [v10 startDownload:v23 then:v24];

    _Block_object_dispose(&buf, 8);
  }
}

void __74__PKMobileAssetManager__downloadAsset_isDiscretionary_timeout_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
  uint64_t v4 = PKLogFacilityTypeGetObject(0xAuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to download mobile asset", v5, 2u);
  }
}

void __74__PKMobileAssetManager__downloadAsset_isDiscretionary_timeout_completion___block_invoke_409(uint64_t a1, uint64_t a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKMobileAssetManager__downloadAsset_isDiscretionary_timeout_completion___block_invoke_2;
  block[3] = &unk_1E56F69A0;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  uint64_t v8 = a2;
  dispatch_async(v3, block);
}

NSObject *__74__PKMobileAssetManager__downloadAsset_isDiscretionary_timeout_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    dispatch_source_cancel(result);
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

- (id)_downloadOptionsWithTimeout:(int64_t)a3 isDiscretionary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F77FE8]);
  [v6 setAllowsCellularAccess:1];
  [v6 setDiscretionary:v4];
  [v6 setCanUseLocalCacheServer:1];
  if (a3 >= 1) {
    [v6 setTimeoutIntervalForResource:a3];
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStringsBundles, 0);
  objc_storeStrong((id *)&self->_dynamicAssetsIndex, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end