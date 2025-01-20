@interface PXAssetsDataSourceManager
- (BOOL)forceAccurateAllSectionsIfNeeded;
- (BOOL)forceAccurateSection:(int64_t)a3 andSectionsBeforeAndAfter:(int64_t)a4;
- (BOOL)forceAccurateSectionsIfNeeded:(id)a3;
- (BOOL)includeOthersInSocialGroupAssets;
- (BOOL)isBackgroundFetching;
- (BOOL)isLoadingInitialDataSource;
- (BOOL)supportsCurationToggling;
- (BOOL)supportsFiltering;
- (NSArray)sortDescriptors;
- (NSAttributedString)localizedEmptyPlaceholderAttributedMessage;
- (NSPredicate)filterPredicate;
- (NSString)localizedEmptyPlaceholderTitle;
- (NSString)localizedLoadingInitialDataSourceMessage;
- (id)createDataSourceManagerForAsset:(id)a3;
- (id)createDataSourceManagerForAssetsInSectionOfAsset:(id)a3 usingNewTransientAssetCollection:(BOOL)a4;
- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4;
- (int64_t)backgroundFetchOriginSection;
- (void)_performIfStartingSectionIsEmpty:(id)a3;
- (void)ensureLastSectionHasContent;
- (void)ensureStartingSectionHasContent;
- (void)registerChangeObserver:(id)a3 context:(void *)a4;
- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3;
- (void)setCurationEnabled:(BOOL)a3 forAssetCollection:(id)a4;
- (void)setCurationEnabledForAllCollections:(BOOL)a3 curationLength:(int64_t)a4 collectionsToDiff:(id)a5;
- (void)setFilterPredicate:(id)a3;
- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3;
- (void)unregisterChangeObserver:(id)a3 context:(void *)a4;
- (void)waitForAvailabilityOfAsset:(id)a3 completionHandler:(id)a4;
- (void)waitForAvailabilityOfAsset:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
@end

@implementation PXAssetsDataSourceManager

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PXAssetsDataSourceManager;
  [(PXSectionedDataSourceManager *)&v4 registerChangeObserver:a3 context:a4];
}

- (void)ensureLastSectionHasContent
{
  v3 = [(PXSectionedDataSourceManager *)self dataSource];
  uint64_t v4 = [v3 numberOfSections];

  uint64_t v5 = v4 - 1;
  if (v4 >= 1)
  {
    v6 = [(PXSectionedDataSourceManager *)self dataSource];
    uint64_t v7 = [v6 numberOfItemsInSection:v5];

    if (!v7)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __56__PXAssetsDataSourceManager_ensureLastSectionHasContent__block_invoke;
      v8[3] = &__block_descriptor_40_e44_v16__0___PXMutableAssetsDataSourceManager__8l;
      v8[4] = v5;
      [(PXObservable *)self performChanges:v8];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_localizedLoadingInitialDataSourceMessage, 0);
  objc_storeStrong((id *)&self->_localizedEmptyPlaceholderAttributedMessage, 0);

  objc_storeStrong((id *)&self->_localizedEmptyPlaceholderTitle, 0);
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (BOOL)includeOthersInSocialGroupAssets
{
  return self->_includeOthersInSocialGroupAssets;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (BOOL)supportsFiltering
{
  return self->_supportsFiltering;
}

- (BOOL)isBackgroundFetching
{
  return self->_isBackgroundFetching;
}

- (NSString)localizedLoadingInitialDataSourceMessage
{
  return self->_localizedLoadingInitialDataSourceMessage;
}

- (NSAttributedString)localizedEmptyPlaceholderAttributedMessage
{
  return self->_localizedEmptyPlaceholderAttributedMessage;
}

- (NSString)localizedEmptyPlaceholderTitle
{
  return self->_localizedEmptyPlaceholderTitle;
}

- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXAssetsDataSourceManager;
  [(PXSectionedDataSourceManager *)&v3 resumeChangeDeliveryAndBackgroundLoading:a3];
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PXAssetsDataSourceManager;
  uint64_t v4 = [(PXSectionedDataSourceManager *)&v6 pauseChangeDeliveryWithTimeout:a4 identifier:a3];

  return v4;
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3
{
  if (self->_includeOthersInSocialGroupAssets != a3) {
    self->_includeOthersInSocialGroupAssets = a3;
  }
}

- (void)setFilterPredicate:(id)a3
{
  v9 = (NSPredicate *)a3;
  uint64_t v4 = self->_filterPredicate;
  filterPredicate = v9;
  if (v4 != v9)
  {
    objc_super v6 = v4;
    char v7 = [(NSPredicate *)v4 isEqual:v9];

    if (v7) {
      goto LABEL_5;
    }
    v8 = v9;
    filterPredicate = self->_filterPredicate;
    self->_filterPredicate = v8;
  }

LABEL_5:
}

- (id)createDataSourceManagerForAsset:(id)a3
{
  return 0;
}

- (id)createDataSourceManagerForAssetsInSectionOfAsset:(id)a3 usingNewTransientAssetCollection:(BOOL)a4
{
  return 0;
}

- (void)waitForAvailabilityOfAsset:(id)a3 completionHandler:(id)a4
{
}

- (void)waitForAvailabilityOfAsset:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v19 = *(_OWORD *)PXSimpleIndexPathNull;
  long long v20 = *(_OWORD *)&PXSimpleIndexPathNull[16];
  v10 = [(PXSectionedObjectReference *)[PXAssetReference alloc] initWithSectionObject:0 itemObject:v8 subitemObject:0 indexPath:&v19];
  *(void *)&long long v19 = 0;
  *((void *)&v19 + 1) = &v19;
  *(void *)&long long v20 = 0x3032000000;
  *((void *)&v20 + 1) = __Block_byref_object_copy__6874;
  v21 = __Block_byref_object_dispose__6875;
  id v22 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__PXAssetsDataSourceManager_waitForAvailabilityOfAsset_timeout_completionHandler___block_invoke;
  v16[3] = &unk_26545B388;
  v18 = &v19;
  v11 = v10;
  v17 = v11;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__PXAssetsDataSourceManager_waitForAvailabilityOfAsset_timeout_completionHandler___block_invoke_2;
  v13[3] = &unk_26545B3B0;
  id v12 = v9;
  id v14 = v12;
  v15 = &v19;
  [(PXSectionedDataSourceManager *)self waitForCondition:v16 timeout:v13 completionHandler:a4];

  _Block_object_dispose(&v19, 8);
}

BOOL __82__PXAssetsDataSourceManager_waitForAvailabilityOfAsset_timeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 assetReferenceForAssetReference:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

uint64_t __82__PXAssetsDataSourceManager_waitForAvailabilityOfAsset_timeout_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (int64_t)backgroundFetchOriginSection
{
  return 0;
}

- (void)_performIfStartingSectionIsEmpty:(id)a3
{
  char v7 = (void (**)(id, void *, void))a3;
  uint64_t v4 = [(PXSectionedDataSourceManager *)self dataSource];
  uint64_t v5 = [v4 startingSection];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v5;
    if (![v4 numberOfItemsInSection:v5]) {
      v7[2](v7, v4, v6);
    }
  }
}

- (void)ensureStartingSectionHasContent
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __60__PXAssetsDataSourceManager_ensureStartingSectionHasContent__block_invoke;
  v2[3] = &unk_26545B360;
  v2[4] = self;
  [(PXAssetsDataSourceManager *)self _performIfStartingSectionIsEmpty:v2];
}

uint64_t __60__PXAssetsDataSourceManager_ensureStartingSectionHasContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__PXAssetsDataSourceManager_ensureStartingSectionHasContent__block_invoke_2;
  v5[3] = &__block_descriptor_40_e44_v16__0___PXMutableAssetsDataSourceManager__8l;
  v5[4] = a3;
  return [v3 performChanges:v5];
}

uint64_t __60__PXAssetsDataSourceManager_ensureStartingSectionHasContent__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 forceAccurateSection:*(void *)(a1 + 32) andSectionsBeforeAndAfter:0];
}

- (BOOL)isLoadingInitialDataSource
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__PXAssetsDataSourceManager_isLoadingInitialDataSource__block_invoke;
  v4[3] = &unk_26545B338;
  v4[4] = &v5;
  [(PXAssetsDataSourceManager *)self _performIfStartingSectionIsEmpty:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __55__PXAssetsDataSourceManager_isLoadingInitialDataSource__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "isSectionConsideredAccurate:");
  if ((result & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __56__PXAssetsDataSourceManager_ensureLastSectionHasContent__block_invoke(uint64_t a1, void *a2)
{
  return [a2 forceAccurateSection:*(void *)(a1 + 32) andSectionsBeforeAndAfter:0];
}

- (BOOL)forceAccurateSection:(int64_t)a3 andSectionsBeforeAndAfter:(int64_t)a4
{
  return 0;
}

- (BOOL)forceAccurateSectionsIfNeeded:(id)a3
{
  return 0;
}

- (BOOL)supportsCurationToggling
{
  return 0;
}

- (BOOL)forceAccurateAllSectionsIfNeeded
{
  char v2 = self;
  uint64_t v3 = (void *)MEMORY[0x263F088D0];
  uint64_t v4 = [(PXSectionedDataSourceManager *)self dataSource];
  uint64_t v5 = objc_msgSend(v3, "indexSetWithIndexesInRange:", 0, objc_msgSend(v4, "numberOfSections"));

  LOBYTE(v2) = [(PXAssetsDataSourceManager *)v2 forceAccurateSectionsIfNeeded:v5];
  return (char)v2;
}

- (void)setCurationEnabled:(BOOL)a3 forAssetCollection:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
  char v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  [v7 handleFailureInMethod:a2, self, @"PXAssetsDataSourceManager.m", 36, @"Method %s is a responsibility of subclass %@", "-[PXAssetsDataSourceManager setCurationEnabled:forAssetCollection:]", v9 object file lineNumber description];

  abort();
}

- (void)setCurationEnabledForAllCollections:(BOOL)a3 curationLength:(int64_t)a4 collectionsToDiff:(id)a5
{
  id v7 = a5;
  char v8 = [MEMORY[0x263F08690] currentHandler];
  id v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  [v8 handleFailureInMethod:a2, self, @"PXAssetsDataSourceManager.m", 32, @"Method %s is a responsibility of subclass %@", "-[PXAssetsDataSourceManager setCurationEnabledForAllCollections:curationLength:collectionsToDiff:]", v10 object file lineNumber description];

  abort();
}

- (void)unregisterChangeObserver:(id)a3 context:(void *)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PXAssetsDataSourceManager;
  [(PXSectionedDataSourceManager *)&v4 unregisterChangeObserver:a3 context:a4];
}

@end