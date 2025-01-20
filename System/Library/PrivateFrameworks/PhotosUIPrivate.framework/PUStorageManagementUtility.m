@interface PUStorageManagementUtility
+ (id)_predicateForPersonalLibraryAssets;
+ (id)predicateForMinimumVideoSize;
+ (id)predicateForUploadedAssetFetch;
+ (id)storageTipAssetCollectionForType:(unint64_t)a3 photoLibrary:(id)a4;
+ (id)storageTipAssetFetchOptionsForType:(unint64_t)a3 photoLibrary:(id)a4;
+ (unint64_t)cloudStorageTotalBytesSizeFromCloudQuotaDictionary:(id)a3;
- (BOOL)isCPLEnabled;
- (BOOL)isCPLInExitMode;
- (BOOL)isDeletableItemsInTrash;
- (BOOL)isOptimizedModeOn;
- (BOOL)shouldHideCPL;
- (BOOL)shouldShowCloudStorageTip;
- (NSNumber)cloudStorageTotalBytes;
- (NSNumber)sizeForRecentlyDeletedItems;
- (PHPhotoLibrary)photoLibrary;
- (PUStorageManagementUtility)initWithPhotoLibrary:(id)a3;
- (id)_assetsInTrash;
- (id)_defaultVideoAssetFetchOptionsWithSortOrder:(BOOL)a3;
- (id)_deleteableVideoAssets;
- (id)fetchVideoAssetsBySizeWithSortOrder:(BOOL)a3;
- (id)significantItems;
- (unint64_t)cloudStorageTotalBytesSize;
- (unint64_t)totalReclaimableSizeFromPurgingVideoClips;
- (void)enableCPLWithCompletionBlock:(id)a3;
- (void)enableOptimizedMode:(BOOL)a3;
- (void)expungeRecentlyDeletedItemsWithCompletionBlock:(id)a3;
- (void)purgeableSizeAndOriginalsInLibrary:(id)a3;
- (void)setCloudStorageTotalBytes:(id)a3;
- (void)setPhotoLibrary:(id)a3;
@end

@implementation PUStorageManagementUtility

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudStorageTotalBytes, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setCloudStorageTotalBytes:(id)a3
{
}

- (NSNumber)cloudStorageTotalBytes
{
  return self->_cloudStorageTotalBytes;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (unint64_t)cloudStorageTotalBytesSize
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(PUStorageManagementUtility *)self cloudStorageTotalBytes];

  if (!v3)
  {
    v4 = [(PUStorageManagementUtility *)self photoLibrary];
    id v13 = 0;
    id v14 = 0;
    char v5 = [v4 cloudQuotaResourceBytesUsed:&v14 error:&v13];
    id v6 = v14;
    id v7 = v13;

    if ((v5 & 1) == 0)
    {
      v8 = PXAssertGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v7;
        _os_log_error_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "Failed to get iCloud storage used with error %@", buf, 0xCu);
      }
    }
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", +[PUStorageManagementUtility cloudStorageTotalBytesSizeFromCloudQuotaDictionary:](PUStorageManagementUtility, "cloudStorageTotalBytesSizeFromCloudQuotaDictionary:", v6));
    [(PUStorageManagementUtility *)self setCloudStorageTotalBytes:v9];
  }
  v10 = [(PUStorageManagementUtility *)self cloudStorageTotalBytes];
  unint64_t v11 = [v10 unsignedLongValue];

  return v11;
}

- (BOOL)shouldShowCloudStorageTip
{
  BOOL v3 = [(PUStorageManagementUtility *)self isCPLEnabled];
  if (v3)
  {
    if ([(PUStorageManagementUtility *)self isCPLInExitMode]) {
      goto LABEL_5;
    }
    v4 = [(PUStorageManagementUtility *)self photoLibrary];
    char v5 = [v4 cplStatus];
    id v6 = [v5 initialSyncDate];

    if (!v6) {
LABEL_5:
    }
      LOBYTE(v3) = 0;
    else {
      LOBYTE(v3) = [(PUStorageManagementUtility *)self cloudStorageTotalBytesSize] != 0;
    }
  }
  return v3;
}

- (id)significantItems
{
  v2 = [(PUStorageManagementUtility *)self _defaultVideoAssetFetchOptionsWithSortOrder:0];
  BOOL v3 = [MEMORY[0x1E4F38EB8] fetchAssetsWithMediaType:2 options:v2];
  v4 = [v3 fetchedObjects];

  return v4;
}

- (unint64_t)totalReclaimableSizeFromPurgingVideoClips
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [(PUStorageManagementUtility *)self _deleteableVideoAssets];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) originalMetadataProperties];
        v5 += [v8 originalFilesize];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)_deleteableVideoAssets
{
  v2 = [(PUStorageManagementUtility *)self fetchVideoAssetsBySizeWithSortOrder:0];
  uint64_t v3 = [v2 fetchedObjects];
  uint64_t v4 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_88957];
  unint64_t v5 = [v3 objectsAtIndexes:v4];

  return v5;
}

uint64_t __52__PUStorageManagementUtility__deleteableVideoAssets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 canPerformEditOperation:1];
}

- (id)fetchVideoAssetsBySizeWithSortOrder:(BOOL)a3
{
  uint64_t v3 = [(PUStorageManagementUtility *)self _defaultVideoAssetFetchOptionsWithSortOrder:a3];
  uint64_t v4 = [MEMORY[0x1E4F38EB8] fetchAssetsWithMediaType:2 options:v3];
  unint64_t v5 = [v4 fetchedObjects];
  uint64_t v6 = [v5 valueForKey:@"localIdentifier"];

  id v7 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v6 options:v3];
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E4F38EB8];
    v9 = [v3 photoLibrary];
    id v7 = objc_msgSend(v8, "px_fetchAssetsInArray:photoLibrary:", MEMORY[0x1E4F1CBF0], v9);
  }
  return v7;
}

- (id)_defaultVideoAssetFetchOptionsWithSortOrder:(BOOL)a3
{
  BOOL v3 = a3;
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PUStorageManagementUtility *)self photoLibrary];
  unint64_t v5 = +[PUStorageManagementUtility storageTipAssetFetchOptionsForType:2 photoLibrary:v4];

  uint64_t v6 = *MEMORY[0x1E4F39518];
  v12[0] = *MEMORY[0x1E4F394E8];
  v12[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v5 addFetchPropertySets:v7];

  v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"additionalAttributes.originalFilesize" ascending:v3];
  long long v11 = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  [v5 setInternalSortDescriptors:v9];

  return v5;
}

- (void)expungeRecentlyDeletedItemsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PUStorageManagementUtility *)self _assetsInTrash];
  if ([v5 count])
  {
    uint64_t v6 = [v5 firstObject];
    id v7 = [v6 photoLibrary];

    id v8 = objc_alloc_init(MEMORY[0x1E4F38F30]);
    [v8 setExpungeSource:5];
    v9 = (void *)MEMORY[0x1E4F38ED0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__PUStorageManagementUtility_expungeRecentlyDeletedItemsWithCompletionBlock___block_invoke;
    v10[3] = &unk_1E5F2D848;
    id v11 = v5;
    id v12 = v4;
    [v9 performBatchExpungeWithAssets:v11 deleteOptions:v8 photoLibrary:v7 completionHandler:v10];
  }
}

void __77__PUStorageManagementUtility_expungeRecentlyDeletedItemsWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "Unable to expunge assets:%@ error:%@", (uint8_t *)&v7, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enableCPLWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLCanEnableCloudPhotoLibrary();
}

void __59__PUStorageManagementUtility_enableCPLWithCompletionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PUStorageManagementUtility_enableCPLWithCompletionBlock___block_invoke_2;
  block[3] = &unk_1E5F2C610;
  char v11 = a2;
  id v6 = *(id *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__PUStorageManagementUtility_enableCPLWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v1 = (void *)MEMORY[0x1E4F8A718];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__PUStorageManagementUtility_enableCPLWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E5F2DB20;
    id v7 = *(id *)(a1 + 40);
    [v1 enableCPL:v6];
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2)
    {
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = *(void (**)(uint64_t, void, uint64_t))(v2 + 16);
      uint64_t v5 = *(void *)(a1 + 40);
      v4(v5, 0, v3);
    }
  }
}

uint64_t __59__PUStorageManagementUtility_enableCPLWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)enableOptimizedMode:(BOOL)a3
{
}

- (BOOL)isOptimizedModeOn
{
  return [(PHPhotoLibrary *)self->_photoLibrary isKeepOriginalsEnabled] ^ 1;
}

- (BOOL)isDeletableItemsInTrash
{
  uint64_t v2 = [(PUStorageManagementUtility *)self _assetsInTrash];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSNumber)sizeForRecentlyDeletedItems
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PUStorageManagementUtility *)self _assetsInTrash];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) originalMetadataProperties];
        v5 += [v8 originalFilesize];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v9 = [NSNumber numberWithUnsignedLongLong:v5];

  return (NSNumber *)v9;
}

- (id)_assetsInTrash
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F390A0];
  uint64_t v3 = [(PUStorageManagementUtility *)self photoLibrary];
  uint64_t v4 = [v2 fetchOptionsWithInclusiveDefaultsForPhotoLibrary:v3];

  v10[0] = *MEMORY[0x1E4F394E8];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v4 addFetchPropertySets:v5];

  [v4 setIncludeTrashedAssets:1];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"trashedState = %d", 1);
  [v4 setInternalPredicate:v6];

  id v7 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v4];
  uint64_t v8 = [v7 fetchedObjects];

  return v8;
}

- (BOOL)shouldHideCPL
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F8A668], "pl_sharedAccountStore");
  uint64_t v3 = [v2 cachedPrimaryAppleAccount];

  if (v3)
  {
    uint64_t v4 = [v3 provisionedDataclasses];
    int v5 = [v4 containsObject:*MEMORY[0x1E4F17A88]] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  uint64_t v6 = [MEMORY[0x1E4F74230] sharedConnection];
  int v7 = [v6 BOOLRestrictionForFeature:*MEMORY[0x1E4F73FB0]];

  if (v7 == 2) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v5;
  }

  return v8;
}

- (BOOL)isCPLInExitMode
{
  uint64_t v2 = [(PUStorageManagementUtility *)self photoLibrary];
  uint64_t v3 = [v2 cplStatus];
  uint64_t v4 = [v3 exitDeleteTime];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isCPLEnabled
{
  uint64_t v2 = [(PUStorageManagementUtility *)self photoLibrary];
  char v3 = [v2 isCloudPhotoLibraryEnabled];

  return v3;
}

- (void)purgeableSizeAndOriginalsInLibrary:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PUStorageManagementUtility *)self photoLibrary];
  uint64_t v6 = [v5 photoLibraryURL];

  int v7 = [MEMORY[0x1E4F8AA90] sharedAssetsdClientForPhotoLibraryURL:v6];
  BOOL v8 = [v7 libraryInternalClient];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __65__PUStorageManagementUtility_purgeableSizeAndOriginalsInLibrary___block_invoke;
  v10[3] = &unk_1E5F2C158;
  id v11 = v4;
  id v9 = v4;
  [v8 getLibrarySizesFromDB:1 completionHandler:v10];
}

void __65__PUStorageManagementUtility_purgeableSizeAndOriginalsInLibrary___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    id v9 = [&unk_1F078CE90 stringValue];
    id v10 = [v7 objectForKeyedSubscript:v9];

    if (v10)
    {
      id v11 = v10;
      long long v12 = PLUIGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 134217984;
        uint64_t v14 = [v11 unsignedLongLongValue];
        _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "purgeableSizeAndOriginalsInLibrary potential purgeable originals in optimize mode = %llu bytes", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      long long v12 = PLUIGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "purgeableSizeAndOriginalsInLibrary did not find key in sizes dictionary", (uint8_t *)&v13, 2u);
      }
      id v11 = &unk_1F078CE78;
    }
  }
  else
  {
    id v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      uint64_t v14 = (uint64_t)v8;
      _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_ERROR, "Error getting library sizes from assetsd: %@", (uint8_t *)&v13, 0xCu);
    }
    id v11 = &unk_1F078CE78;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PUStorageManagementUtility)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUStorageManagementUtility;
  uint64_t v6 = [(PUStorageManagementUtility *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    cloudStorageTotalBytes = v7->_cloudStorageTotalBytes;
    v7->_cloudStorageTotalBytes = 0;
  }
  return v7;
}

+ (id)_predicateForPersonalLibraryAssets
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"activeLibraryScopeParticipationState", 0);
}

+ (id)predicateForUploadedAssetFetch
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil && %K == %d", @"master", @"master.cloudLocalState", 3);
}

+ (id)predicateForMinimumVideoSize
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > %d", @"additionalAttributes.originalFilesize", 31457279);
}

+ (unint64_t)cloudStorageTotalBytesSizeFromCloudQuotaDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__PUStorageManagementUtility_cloudStorageTotalBytesSizeFromCloudQuotaDictionary___block_invoke;
  v6[3] = &unk_1E5F2C180;
  void v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __81__PUStorageManagementUtility_cloudStorageTotalBytesSizeFromCloudQuotaDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v6 unsignedLongValue];
  uint64_t v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(v6, "unsignedLongValue"), 0);
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    long long v12 = v8;
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_INFO, "Cloud Storage Recoverable for %@: %@", (uint8_t *)&v9, 0x16u);
  }
}

+ (id)storageTipAssetFetchOptionsForType:(unint64_t)a3 photoLibrary:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 librarySpecificFetchOptions];
  if ([v5 isCloudPhotoLibraryEnabled])
  {
    uint64_t v7 = +[PUStorageManagementUtility predicateForUploadedAssetFetch];
    [v6 setInternalPredicate:v7];
  }
  if (a3 == 2)
  {
    id v8 = [v6 internalPredicate];
    if (v8)
    {
      int v9 = (void *)MEMORY[0x1E4F28BA0];
      id v10 = [v6 internalPredicate];
      v26[0] = v10;
      __int16 v11 = +[PUStorageManagementUtility predicateForMinimumVideoSize];
      v26[1] = v11;
      long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
      uint64_t v13 = [v9 andPredicateWithSubpredicates:v12];
      [v6 setInternalPredicate:v13];
    }
    else
    {
      uint64_t v14 = +[PUStorageManagementUtility predicateForMinimumVideoSize];
      [v6 setInternalPredicate:v14];
    }
  }
  uint64_t v15 = [MEMORY[0x1E4F90690] sharedLibraryStatusProviderWithPhotoLibrary:v5];
  uint64_t v16 = [v15 sharedLibrary];
  char v17 = [v16 isOwned];

  if ((v17 & 1) == 0)
  {
    v18 = [v6 internalPredicate];
    if (v18)
    {
      v19 = (void *)MEMORY[0x1E4F28BA0];
      v20 = [v6 internalPredicate];
      v25[0] = v20;
      v21 = +[PUStorageManagementUtility _predicateForPersonalLibraryAssets];
      v25[1] = v21;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
      v23 = [v19 andPredicateWithSubpredicates:v22];
      [v6 setInternalPredicate:v23];
    }
    else
    {
      v20 = +[PUStorageManagementUtility _predicateForPersonalLibraryAssets];
      [v6 setInternalPredicate:v20];
    }
  }
  return v6;
}

+ (id)storageTipAssetCollectionForType:(unint64_t)a3 photoLibrary:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  switch(a3)
  {
    case 0uLL:
      uint64_t v9 = 1000000212;
      break;
    case 1uLL:
      uint64_t v9 = 211;
      break;
    case 2uLL:
      uint64_t v9 = 202;
      break;
    case 3uLL:
      long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:a1 file:@"PUStorageManagementUtility.m" lineNumber:240 description:@"Code which should be unreachable has been reached"];

      abort();
    default:
      uint64_t v9 = 0;
      break;
  }
  id v10 = objc_msgSend(v7, "px_assetCollectionForSmartAlbumWithSubtype:", v9);

  return v10;
}

@end