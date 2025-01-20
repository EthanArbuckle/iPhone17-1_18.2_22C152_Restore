@interface PXStoryPPTConfiguration
+ (id)configurationsForPreset:(unint64_t)a3 subpreset:(unint64_t)a4 testOptions:(id)a5;
+ (void)_configureConfiguration:(id)a3 forSubpreset:(unint64_t)a4;
+ (void)_fetchLatestMemoriesWithMaximumCount:(int64_t)a3 resultHandler:(id)a4;
+ (void)_requestPhotoLibraryWithResultHandler:(id)a3;
- (BOOL)useDefaultMemory;
- (NSString)contentDescription;
- (NSString)name;
- (PHAssetCollection)assetCollection;
- (PXStoryPPTConfiguration)init;
- (PXStoryPPTConfiguration)initWithAssetCollection:(id)a3 name:(id)a4;
- (PXStoryPPTConfiguration)initWithAssetType:(unint64_t)a3 count:(unint64_t)a4;
- (PXStoryPPTConfiguration)initWithDefaultMemory;
- (PXStoryPPTConfiguration)initWithLatestCollectionOfType:(int64_t)a3;
- (PXStoryPPTConfiguration)initWithPreset:(unint64_t)a3;
- (double)preferredStoryDuration;
- (id)_stringFromAssetCount:(unint64_t)a3;
- (id)_stringFromAssetType:(unint64_t)a3;
- (int64_t)collectionType;
- (unint64_t)assetCount;
- (unint64_t)assetType;
- (unint64_t)subpreset;
- (void)_completeConfigurationRequestWithAssetCollection:(id)a3 resultHandler:(id)a4;
- (void)_completeConfigurationRequestWithFetchResult:(id)a3 resultHandler:(id)a4;
- (void)_completeConfigurationRequestWithStoryConfiguration:(id)a3 resultHandler:(id)a4;
- (void)_configureWithMemoryFetchResultProvider:(id)a3 resultHandler:(id)a4;
- (void)_createSyntheticAssetsWithResultHandler:(id)a3;
- (void)_fetchAssetsWithResultHandler:(id)a3;
- (void)_fetchDefaultMemoryWithResultHandler:(id)a3;
- (void)_fetchLatestAssetCollectionOfType:(int64_t)a3 resultHandler:(id)a4;
- (void)_fetchMemoryByLocalIdentifier:(id)a3 resultHandler:(id)a4;
- (void)_fetchMemoryByName:(id)a3 resultHandler:(id)a4;
- (void)_performPhotoLibraryFetch:(id)a3;
- (void)requestStoryConfigurationWithOptions:(id)a3 resultHandler:(id)a4;
- (void)setAssetCount:(unint64_t)a3;
- (void)setPreferredStoryDuration:(double)a3;
- (void)setSubpreset:(unint64_t)a3;
@end

@implementation PXStoryPPTConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_contentDescription, 0);
}

- (void)setSubpreset:(unint64_t)a3
{
  self->_subpreset = a3;
}

- (unint64_t)subpreset
{
  return self->_subpreset;
}

- (void)setPreferredStoryDuration:(double)a3
{
  self->_preferredStoryDuration = a3;
}

- (double)preferredStoryDuration
{
  return self->_preferredStoryDuration;
}

- (void)setAssetCount:(unint64_t)a3
{
  self->_assetCount = a3;
}

- (unint64_t)assetCount
{
  return self->_assetCount;
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (BOOL)useDefaultMemory
{
  return self->_useDefaultMemory;
}

- (int64_t)collectionType
{
  return self->_collectionType;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (PXStoryPPTConfiguration)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPPTConfiguration.m", 406, @"%s is not available as initializer", "-[PXStoryPPTConfiguration init]");

  abort();
}

- (id)_stringFromAssetType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E5DCDD18[a3 - 1];
  }
}

- (id)_stringFromAssetCount:(unint64_t)a3
{
  if (a3 < 0x3E8) {
    v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lu", a3);
  }
  else {
    v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%luk", a3 / 0x3E8);
  }
  return v3;
}

- (void)_performPhotoLibraryFetch:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PXStoryPPTConfiguration__performPhotoLibraryFetch___block_invoke;
  v6[3] = &unk_1E5DCDCF8;
  id v7 = v3;
  id v5 = v3;
  [v4 _requestPhotoLibraryWithResultHandler:v6];
}

void __53__PXStoryPPTConfiguration__performPhotoLibraryFetch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 librarySpecificFetchOptions];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_completeConfigurationRequestWithStoryConfiguration:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PXStoryPPTConfiguration *)self assetType] == 1)
  {
    id v8 = objc_alloc_init((Class)off_1E5DA94B8);
    [v6 setMediaProvider:v8];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__PXStoryPPTConfiguration__completeConfigurationRequestWithStoryConfiguration_resultHandler___block_invoke;
  v11[3] = &unk_1E5DD3280;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

uint64_t __93__PXStoryPPTConfiguration__completeConfigurationRequestWithStoryConfiguration_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_completeConfigurationRequestWithFetchResult:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[PXStoryConfiguration alloc] initWithAssets:v7];

  [(PXStoryPPTConfiguration *)self _completeConfigurationRequestWithStoryConfiguration:v8 resultHandler:v6];
}

- (void)_completeConfigurationRequestWithAssetCollection:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    id v9 = [[PXStoryConfiguration alloc] initWithAssetCollection:v6];
    [(PXStoryPPTConfiguration *)self _completeConfigurationRequestWithStoryConfiguration:v9 resultHandler:v8];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__PXStoryPPTConfiguration__completeConfigurationRequestWithAssetCollection_resultHandler___block_invoke;
    block[3] = &unk_1E5DD3128;
    id v11 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __90__PXStoryPPTConfiguration__completeConfigurationRequestWithAssetCollection_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_createSyntheticAssetsWithResultHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PXStoryPPTConfiguration *)self assetCount])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = objc_alloc((Class)off_1E5DA94B0);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __67__PXStoryPPTConfiguration__createSyntheticAssetsWithResultHandler___block_invoke;
      v9[3] = &__block_descriptor_40_e35_v16__0___PXMutableSyntheticAsset__8l;
      v9[4] = v6;
      id v8 = (void *)[v7 initWithConfiguration:v9];
      [v5 addObject:v8];

      ++v6;
    }
    while (v6 < [(PXStoryPPTConfiguration *)self assetCount]);
  }
  PXDisplayAssetFetchResultFromArray();
}

void __67__PXStoryPPTConfiguration__createSyntheticAssetsWithResultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(unsigned char *)(a1 + 32)) {
    [MEMORY[0x1E4FB1618] orangeColor];
  }
  else {
  id v3 = [MEMORY[0x1E4FB1618] purpleColor];
  }
  [v5 setTintColor:v3];

  id v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"A%li", *(void *)(a1 + 32));
  [v5 setLabel:v4];
}

- (void)_fetchAssetsWithResultHandler:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__264237;
  v9[4] = __Block_byref_object_dispose__264238;
  id v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__PXStoryPPTConfiguration__fetchAssetsWithResultHandler___block_invoke;
  v6[3] = &unk_1E5DCDC88;
  void v6[4] = self;
  id v8 = v9;
  id v5 = v4;
  id v7 = v5;
  [(PXStoryPPTConfiguration *)self _performPhotoLibraryFetch:v6];

  _Block_object_dispose(v9, 8);
}

uint64_t __57__PXStoryPPTConfiguration__fetchAssetsWithResultHandler___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setFetchLimit:", objc_msgSend(v3, "assetCount"));
  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v17[0] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v4 setSortDescriptors:v6];

  if ([*(id *)(a1 + 32) assetType] == 2) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 1;
  }
  id v8 = (void *)MEMORY[0x1E4F28F60];
  id v9 = [NSNumber numberWithInteger:v7];
  v16 = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  id v11 = [v8 predicateWithFormat:@"playbackStyle IN %@", v10];
  [v4 setPredicate:v11];

  uint64_t v12 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v4];

  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  return [*(id *)(a1 + 32) _completeConfigurationRequestWithFetchResult:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) resultHandler:*(void *)(a1 + 40)];
}

- (void)_fetchLatestAssetCollectionOfType:(int64_t)a3 resultHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (a3 == 4)
  {
    id v8 = objc_opt_class();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__PXStoryPPTConfiguration__fetchLatestAssetCollectionOfType_resultHandler___block_invoke;
    v12[3] = &unk_1E5DCDC10;
    v12[4] = self;
    id v9 = &v13;
    id v13 = v7;
    [v8 _fetchLatestMemoriesWithMaximumCount:1 resultHandler:v12];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__PXStoryPPTConfiguration__fetchLatestAssetCollectionOfType_resultHandler___block_invoke_2;
    v10[3] = &unk_1E5DCDC38;
    v11[1] = a3;
    v10[4] = self;
    id v9 = (id *)v11;
    v11[0] = v6;
    [(PXStoryPPTConfiguration *)self _performPhotoLibraryFetch:v10];
  }
}

void __75__PXStoryPPTConfiguration__fetchLatestAssetCollectionOfType_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  [*(id *)(a1 + 32) _completeConfigurationRequestWithAssetCollection:v3 resultHandler:*(void *)(a1 + 40)];
}

void __75__PXStoryPPTConfiguration__fetchLatestAssetCollectionOfType_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(a1 + 48) == 1)
  {
    id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:0];
    v8[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v3 setSortDescriptors:v5];
  }
  [v3 setFetchLimit:1];
  id v6 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:*(void *)(a1 + 48) subtype:0x7FFFFFFFFFFFFFFFLL options:v3];
  uint64_t v7 = [v6 firstObject];
  [*(id *)(a1 + 32) _completeConfigurationRequestWithAssetCollection:v7 resultHandler:*(void *)(a1 + 40)];
}

- (void)_configureWithMemoryFetchResultProvider:(id)a3 resultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __81__PXStoryPPTConfiguration__configureWithMemoryFetchResultProvider_resultHandler___block_invoke;
  v11[3] = &unk_1E5DCDBE8;
  void v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  SEL v14 = a2;
  id v9 = v8;
  id v10 = v7;
  [(PXStoryPPTConfiguration *)self _performPhotoLibraryFetch:v11];
}

void __81__PXStoryPPTConfiguration__configureWithMemoryFetchResultProvider_resultHandler___block_invoke(uint64_t *a1, void *a2)
{
  id v3 = a2;
  [v3 setIncludePendingMemories:1];
  [v3 setIncludeRejectedMemories:1];
  [v3 setIncludeLocalMemories:1];
  [v3 setIncludeStoryMemories:1];
  (*(void (**)(void))(a1[5] + 16))();
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [v11 firstObject];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = a1[7];
      uint64_t v7 = a1[4];
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      id v10 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v5 handleFailureInMethod:v6, v7, @"PXStoryPPTConfiguration.m", 261, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"fetchResult.firstObject", v9, v10 object file lineNumber description];
    }
  }
  [(id)a1[4] _completeConfigurationRequestWithAssetCollection:v4 resultHandler:a1[6]];
}

- (void)_fetchMemoryByName:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __60__PXStoryPPTConfiguration__fetchMemoryByName_resultHandler___block_invoke;
  v8[3] = &unk_1E5DCDBC0;
  id v9 = v6;
  id v7 = v6;
  [(PXStoryPPTConfiguration *)self _configureWithMemoryFetchResultProvider:v8 resultHandler:a4];
}

id __60__PXStoryPPTConfiguration__fetchMemoryByName_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"title == %@", *(void *)(a1 + 32)];
  id v5 = [v3 predicate];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F28BA0];
    id v7 = [v3 predicate];
    v12[0] = v7;
    v12[1] = v4;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    id v9 = [v6 andPredicateWithSubpredicates:v8];
    [v3 setPredicate:v9];
  }
  else
  {
    [v3 setPredicate:v4];
  }
  id v10 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v3];

  return v10;
}

- (void)_fetchMemoryByLocalIdentifier:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __71__PXStoryPPTConfiguration__fetchMemoryByLocalIdentifier_resultHandler___block_invoke;
  v8[3] = &unk_1E5DCDBC0;
  id v9 = v6;
  id v7 = v6;
  [(PXStoryPPTConfiguration *)self _configureWithMemoryFetchResultProvider:v8 resultHandler:a4];
}

id __71__PXStoryPPTConfiguration__fetchMemoryByLocalIdentifier_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F38EE8];
  uint64_t v8 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v8 count:1];
  id v6 = objc_msgSend(v2, "fetchAssetCollectionsWithType:localIdentifiers:options:", 4, v5, v4, v8, v9);

  return v6;
}

- (void)_fetchDefaultMemoryWithResultHandler:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v6 = [v5 objectForKey:@"PXStoryPPTDefaultMemoryLocalIdentifier"];
  uint64_t v7 = [v5 objectForKey:@"PXStoryPPTDefaultMemoryName"];
  uint64_t v8 = (void *)v7;
  if (v6)
  {
    [(PXStoryPPTConfiguration *)self _fetchMemoryByLocalIdentifier:v6 resultHandler:v4];
  }
  else
  {
    if (!v7) {
      PXAssertGetLog();
    }
    [(PXStoryPPTConfiguration *)self _fetchMemoryByName:v7 resultHandler:v4];
  }
}

- (void)requestStoryConfigurationWithOptions:(id)a3 resultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 objectForKeyedSubscript:@"storyDuration"];
  [v9 doubleValue];
  double v11 = v10;

  if (v11 > 0.0)
  {
    self->_assetCount = vcvtmd_u64_f64(v11);
    [(PXStoryPPTConfiguration *)self setPreferredStoryDuration:v11];
  }
  unint64_t v12 = [(PXStoryPPTConfiguration *)self subpreset];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __78__PXStoryPPTConfiguration_requestStoryConfigurationWithOptions_resultHandler___block_invoke;
  v21 = &unk_1E5DCDB98;
  unint64_t v23 = v12;
  id v13 = v8;
  id v22 = v13;
  SEL v14 = _Block_copy(&v18);
  v15 = [(PXStoryPPTConfiguration *)self assetCollection];
  if (v15)
  {
    [(PXStoryPPTConfiguration *)self _completeConfigurationRequestWithAssetCollection:v15 resultHandler:v14];
  }
  else if ([(PXStoryPPTConfiguration *)self collectionType] == 1 {
         || [(PXStoryPPTConfiguration *)self collectionType] == 4)
  }
  {
    [(PXStoryPPTConfiguration *)self _fetchLatestAssetCollectionOfType:[(PXStoryPPTConfiguration *)self collectionType] resultHandler:v14];
  }
  else if ([(PXStoryPPTConfiguration *)self useDefaultMemory])
  {
    [(PXStoryPPTConfiguration *)self _fetchDefaultMemoryWithResultHandler:v14];
  }
  else
  {
    unint64_t v16 = [(PXStoryPPTConfiguration *)self assetType];
    if (v16 - 2 < 2)
    {
      [(PXStoryPPTConfiguration *)self _fetchAssetsWithResultHandler:v14];
    }
    else if (v16 == 1)
    {
      [(PXStoryPPTConfiguration *)self _createSyntheticAssetsWithResultHandler:v14];
    }
    else if (!v16)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:self file:@"PXStoryPPTConfiguration.m" lineNumber:199 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
}

void __78__PXStoryPPTConfiguration_requestStoryConfigurationWithOptions_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  +[PXStoryPPTConfiguration _configureConfiguration:v4 forSubpreset:v3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)name
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PXStoryPPTConfiguration *)self contentDescription];
  [v3 addObject:v4];

  unint64_t v5 = [(PXStoryPPTConfiguration *)self subpreset];
  if (v5)
  {
    if (v5 > 3) {
      id v6 = @"??";
    }
    else {
      id v6 = off_1E5DB70D0[v5];
    }
    id v7 = v6;
    id v8 = [(__CFString *)v7 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    [v3 addObject:v8];
  }
  uint64_t v9 = [v3 componentsJoinedByString:@"-"];

  return (NSString *)v9;
}

- (PXStoryPPTConfiguration)initWithAssetType:(unint64_t)a3 count:(unint64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PXStoryPPTConfiguration;
  id v6 = [(PXStoryPPTConfiguration *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    v6->_assetType = a3;
    v6->_assetCount = a4;
    id v8 = [(PXStoryPPTConfiguration *)v6 _stringFromAssetCount:a4];
    uint64_t v9 = [(PXStoryPPTConfiguration *)v7 _stringFromAssetType:a3];
    uint64_t v10 = [[NSString alloc] initWithFormat:@"%@_%@", v8, v9];
    contentDescription = v7->_contentDescription;
    v7->_contentDescription = (NSString *)v10;
  }
  return v7;
}

- (PXStoryPPTConfiguration)initWithAssetCollection:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryPPTConfiguration;
  uint64_t v9 = [(PXStoryPPTConfiguration *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetCollection, a3);
    uint64_t v11 = [v8 copy];
    contentDescription = v10->_contentDescription;
    v10->_contentDescription = (NSString *)v11;
  }
  return v10;
}

- (PXStoryPPTConfiguration)initWithDefaultMemory
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryPPTConfiguration;
  v2 = [(PXStoryPPTConfiguration *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    contentDescription = v2->_contentDescription;
    v2->_contentDescription = (NSString *)@"DefaultMemory";

    v3->_useDefaultMemory = 1;
  }
  return v3;
}

- (PXStoryPPTConfiguration)initWithLatestCollectionOfType:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PXStoryPPTConfiguration;
  unint64_t v5 = [(PXStoryPPTConfiguration *)&v11 init];
  objc_super v6 = v5;
  if (v5)
  {
    if (a3 == 1)
    {
      contentDescription = v5->_contentDescription;
      id v8 = @"LatestAlbum";
    }
    else
    {
      if (a3 != 4)
      {
        uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2 object:v6 file:@"PXStoryPPTConfiguration.m" lineNumber:114 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      contentDescription = v5->_contentDescription;
      id v8 = @"LatestMemory";
    }
    v5->_contentDescription = &v8->isa;

    v6->_collectionType = a3;
  }
  return v6;
}

- (PXStoryPPTConfiguration)initWithPreset:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_super v11 = v10;
      SEL v12 = a2;
      objc_super v13 = self;
      uint64_t v14 = 86;
      goto LABEL_13;
    case 2uLL:
      uint64_t v3 = 4;
      goto LABEL_4;
    case 3uLL:
      uint64_t v3 = 1;
LABEL_4:
      id v4 = [(PXStoryPPTConfiguration *)self initWithLatestCollectionOfType:v3];
      break;
    case 4uLL:
      uint64_t v5 = 3;
      goto LABEL_8;
    case 5uLL:
      uint64_t v5 = 2;
      goto LABEL_8;
    case 6uLL:
      uint64_t v5 = 1;
LABEL_8:
      id v4 = [(PXStoryPPTConfiguration *)self initWithAssetType:v5 count:1000];
      break;
    case 7uLL:
      id v4 = [(PXStoryPPTConfiguration *)self initWithDefaultMemory];
      break;
    default:
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_super v11 = v10;
      SEL v12 = a2;
      objc_super v13 = self;
      uint64_t v14 = 100;
LABEL_13:
      [v10 handleFailureInMethod:v12 object:v13 file:@"PXStoryPPTConfiguration.m" lineNumber:v14 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  objc_super v6 = v4;

  return v6;
}

+ (void)_requestPhotoLibraryWithResultHandler:(id)a3
{
  id v5 = a3;
  objc_super v6 = (void *)MEMORY[0x1E4F39228];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __65__PXStoryPPTConfiguration__requestPhotoLibraryWithResultHandler___block_invoke;
  v8[3] = &unk_1E5DCDCD0;
  SEL v10 = a2;
  id v11 = a1;
  id v9 = v5;
  id v7 = v5;
  [v6 requestAuthorizationForAccessLevel:2 handler:v8];
}

void __65__PXStoryPPTConfiguration__requestPhotoLibraryWithResultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 != 3)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 48) file:@"PXStoryPPTConfiguration.m" lineNumber:367 description:@"No photo library access"];
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  *(id *)(a1 + 32);
  id v4 = v3;
  px_dispatch_on_main_queue();
}

uint64_t __65__PXStoryPPTConfiguration__requestPhotoLibraryWithResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)_fetchLatestMemoriesWithMaximumCount:(int64_t)a3 resultHandler:(id)a4
{
  id v7 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__PXStoryPPTConfiguration__fetchLatestMemoriesWithMaximumCount_resultHandler___block_invoke;
  v9[3] = &unk_1E5DCDC60;
  SEL v12 = a2;
  id v13 = a1;
  id v10 = v7;
  int64_t v11 = a3;
  id v8 = v7;
  [a1 _requestPhotoLibraryWithResultHandler:v9];
}

void __78__PXStoryPPTConfiguration__fetchLatestMemoriesWithMaximumCount_resultHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v32 = a2;
  uint64_t v3 = [[PXMemoriesFeedDataSourceManager alloc] initWithPhotoLibrary:v32];
  [(PXMemoriesFeedDataSourceManager *)v3 startGeneratingMemories];
  v31 = v3;
  id v4 = [(PXSectionedDataSourceManager *)v3 dataSource];
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  if ((uint64_t)a1[5] <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = a1[5];
  }
  id v7 = (void *)[v5 initWithCapacity:v6];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v30 = v4;
  id obj = [v4 entries];
  uint64_t v35 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v42;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v8;
        id v9 = *(void **)(*((void *)&v41 + 1) + 8 * v8);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v10 = [v9 memories];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v38;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v38 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = [*(id *)(*((void *)&v37 + 1) + 8 * v14) assetCollection];
              if (v15)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  goto LABEL_16;
                }
                uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
                uint64_t v27 = a1[7];
                uint64_t v29 = a1[6];
                v21 = (objc_class *)objc_opt_class();
                v20 = NSStringFromClass(v21);
                v25 = objc_msgSend(v15, "px_descriptionForAssertionMessage");
                [v18 handleFailureInMethod:v29, v27, @"PXStoryPPTConfiguration.m", 297, @"%@ should be an instance inheriting from %@, but it is %@", @"memoryInfo.assetCollection", v20, v25 object file lineNumber description];
              }
              else
              {
                uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
                uint64_t v26 = a1[7];
                uint64_t v28 = a1[6];
                uint64_t v19 = (objc_class *)objc_opt_class();
                v20 = NSStringFromClass(v19);
                [v18 handleFailureInMethod:v28, v26, @"PXStoryPPTConfiguration.m", 297, @"%@ should be an instance inheriting from %@, but it is nil", @"memoryInfo.assetCollection", v20 object file lineNumber description];
              }

LABEL_16:
              [v7 addObject:v15];
              unint64_t v16 = [v7 count];
              unint64_t v17 = a1[5];

              if (v16 >= v17) {
                goto LABEL_23;
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v22 = [v10 countByEnumeratingWithState:&v37 objects:v45 count:16];
            uint64_t v12 = v22;
          }
          while (v22);
        }
LABEL_23:

        if ((unint64_t)[v7 count] >= a1[5]) {
          goto LABEL_26;
        }
        uint64_t v8 = v36 + 1;
      }
      while (v36 + 1 != v35);
      uint64_t v35 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v35);
  }
LABEL_26:

  unint64_t v23 = [MEMORY[0x1E4F39008] transientCollectionListWithCollections:v7 title:0 identifier:0 photoLibrary:v32];
  v24 = [MEMORY[0x1E4F38EE8] fetchCollectionsInCollectionList:v23 options:0];
  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)_configureConfiguration:(id)a3 forSubpreset:(unint64_t)a4
{
  id v5 = a3;
  if (a4 - 1 <= 2)
  {
    id v7 = v5;
    uint64_t v6 = [[PXStoryPrecomposedTimelineProducer alloc] initWithTimelineKind:a4];
    [v7 setTimelineProducer:v6];

    id v5 = v7;
  }
}

+ (id)configurationsForPreset:(unint64_t)a3 subpreset:(unint64_t)a4 testOptions:(id)a5
{
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PXStoryPPTConfiguration_configurationsForPreset_subpreset_testOptions___block_invoke;
  aBlock[3] = &unk_1E5DCDAF8;
  unint64_t v32 = a4;
  id v11 = v10;
  id v31 = v11;
  uint64_t v12 = _Block_copy(aBlock);
  uint64_t v13 = v12;
  if (a3 == 1)
  {
    uint64_t v14 = [v9 objectForKeyedSubscript:@"dataSet"];
    v15 = [v9 objectForKeyedSubscript:@"dataSetLimit"];
    if (v14 && ![v14 isEqualToString:@"Default"])
    {
      if (![v14 isEqualToString:@"Memories"])
      {
        uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:a2, a1, @"PXStoryPPTConfiguration.m", 73, @"invalid dataSet option: %@", v14 object file lineNumber description];

        abort();
      }
      dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
      uint64_t v19 = [v15 integerValue];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __73__PXStoryPPTConfiguration_configurationsForPreset_subpreset_testOptions___block_invoke_3;
      v23[3] = &unk_1E5DCDB70;
      id v24 = v11;
      dispatch_semaphore_t v25 = v18;
      unint64_t v17 = v18;
      [a1 _fetchLatestMemoriesWithMaximumCount:v19 resultHandler:v23];
      dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      uint64_t v27 = __73__PXStoryPPTConfiguration_configurationsForPreset_subpreset_testOptions___block_invoke_2;
      uint64_t v28 = &unk_1E5DCDB20;
      uint64_t v29 = v13;
      for (uint64_t i = 1; i != 8; ++i)
        v27((uint64_t)v26, i);
      unint64_t v17 = v29;
    }
  }
  else
  {
    (*((void (**)(void *, unint64_t))v12 + 2))(v12, a3);
  }
  id v20 = v11;

  return v20;
}

void __73__PXStoryPPTConfiguration_configurationsForPreset_subpreset_testOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[PXStoryPPTConfiguration alloc] initWithPreset:a2];
  [(PXStoryPPTConfiguration *)v3 setSubpreset:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) addObject:v3];
}

uint64_t __73__PXStoryPPTConfiguration_configurationsForPreset_subpreset_testOptions___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2 != 1) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __73__PXStoryPPTConfiguration_configurationsForPreset_subpreset_testOptions___block_invoke_3(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__PXStoryPPTConfiguration_configurationsForPreset_subpreset_testOptions___block_invoke_4;
  v4[3] = &unk_1E5DCDB48;
  id v5 = *(id *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v4];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __73__PXStoryPPTConfiguration_configurationsForPreset_subpreset_testOptions___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [PXStoryPPTConfiguration alloc];
  id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"LatestMemory%li", a3);
  uint64_t v8 = [(PXStoryPPTConfiguration *)v6 initWithAssetCollection:v5 name:v7];

  [*(id *)(a1 + 32) addObject:v8];
}

@end