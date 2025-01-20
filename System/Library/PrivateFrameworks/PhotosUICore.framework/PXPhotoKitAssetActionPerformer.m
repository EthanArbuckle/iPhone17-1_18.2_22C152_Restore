@interface PXPhotoKitAssetActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3;
+ (BOOL)canPerformOnSubsetOfSelection;
+ (BOOL)canPerformWithActionManager:(id)a3;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (BOOL)shouldEnableWithActionManager:(id)a3;
+ (id)createActivityWithActionManager:(id)a3;
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)createStandardActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (BOOL)shouldExitSelectModeForState:(unint64_t)a3;
- (BOOL)shouldSkipUserConfirmation;
- (BOOL)supportsAirPlay;
- (NSArray)assets;
- (NSDictionary)assetsByAssetCollection;
- (NSDictionary)dataSourceUserInfo;
- (NSString)importSessionID;
- (PHFetchResult)assetsFetchResult;
- (PHPerson)person;
- (PHSocialGroup)socialGroup;
- (PXPhotoKitAssetsDataSourceManager)photoKitDataSourceManager;
- (PXPhotoKitImportStatusManager)importStatusManager;
- (PXPhotosDataSource)photosDataSourceSnapshot;
- (PXRadarConfigurationProvider)radarConfigurationProvider;
- (PXSectionedObjectReference)objectReference;
- (id)_indexPathsInPhotosDataSource:(id)a3;
- (id)createPerformerWithClass:(Class)a3 actionType:(id)a4;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (unint64_t)presentationSource;
- (void)forceIncludeAssetsInDataSource;
- (void)instantlyExcludeAssetsFromDataSource;
- (void)setImportSessionID:(id)a3;
- (void)setImportStatusManager:(id)a3;
- (void)setObjectReference:(id)a3;
- (void)setPerson:(id)a3;
- (void)setPhotoKitDataSourceManager:(id)a3;
- (void)setPresentationSource:(unint64_t)a3;
- (void)setRadarConfigurationProvider:(id)a3;
- (void)setShouldSkipUserConfirmation:(BOOL)a3;
- (void)setSocialGroup:(id)a3;
- (void)setSupportsAirPlay:(BOOL)a3;
- (void)stopExcludingAssetsFromDataSource;
@end

@implementation PXPhotoKitAssetActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_importSessionID, 0);
  objc_storeStrong((id *)&self->_importStatusManager, 0);
  objc_storeStrong((id *)&self->_objectReference, 0);
  objc_storeStrong((id *)&self->_socialGroup, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_photoKitDataSourceManager, 0);
  objc_storeStrong((id *)&self->_assetsByAssetCollection, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_assetsFetchResult, 0);
}

- (void)setSupportsAirPlay:(BOOL)a3
{
  self->_supportsAirPlay = a3;
}

- (BOOL)supportsAirPlay
{
  return self->_supportsAirPlay;
}

- (void)setRadarConfigurationProvider:(id)a3
{
}

- (PXRadarConfigurationProvider)radarConfigurationProvider
{
  return self->_radarConfigurationProvider;
}

- (void)setPresentationSource:(unint64_t)a3
{
  self->_presentationSource = a3;
}

- (unint64_t)presentationSource
{
  return self->_presentationSource;
}

- (void)setImportSessionID:(id)a3
{
}

- (NSString)importSessionID
{
  return self->_importSessionID;
}

- (void)setImportStatusManager:(id)a3
{
}

- (PXPhotoKitImportStatusManager)importStatusManager
{
  return self->_importStatusManager;
}

- (void)setShouldSkipUserConfirmation:(BOOL)a3
{
  self->_shouldSkipUserConfirmation = a3;
}

- (BOOL)shouldSkipUserConfirmation
{
  return self->_shouldSkipUserConfirmation;
}

- (void)setObjectReference:(id)a3
{
}

- (PXSectionedObjectReference)objectReference
{
  return self->_objectReference;
}

- (void)setSocialGroup:(id)a3
{
}

- (PHSocialGroup)socialGroup
{
  return self->_socialGroup;
}

- (void)setPerson:(id)a3
{
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setPhotoKitDataSourceManager:(id)a3
{
}

- (PXPhotoKitAssetsDataSourceManager)photoKitDataSourceManager
{
  return self->_photoKitDataSourceManager;
}

- (BOOL)shouldExitSelectModeForState:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotoKitAssetActionPerformer;
  if (![(PXAssetActionPerformer *)&v7 shouldExitSelectModeForState:a3]) {
    return 0;
  }
  v4 = [(PXPhotoKitAssetActionPerformer *)self objectReference];
  BOOL v5 = v4 == 0;

  return v5;
}

- (id)createPerformerWithClass:(Class)a3 actionType:(id)a4
{
  id v6 = a4;
  objc_super v7 = (void *)[[a3 alloc] initWithActionType:v6];

  v8 = [(PXAssetActionPerformer *)self selectionSnapshot];
  [v7 setSelectionSnapshot:v8];

  v9 = [(PXPhotoKitAssetActionPerformer *)self photoKitDataSourceManager];
  [v7 setPhotoKitDataSourceManager:v9];

  v10 = [(PXPhotoKitAssetActionPerformer *)self person];
  [v7 setPerson:v10];

  v11 = [(PXActionPerformer *)self sender];
  [v7 setSender:v11];

  v12 = [(PXActionPerformer *)self delegate];
  [v7 setDelegate:v12];

  return v7;
}

- (NSDictionary)assetsByAssetCollection
{
  assetsByAssetCollection = self->_assetsByAssetCollection;
  if (!assetsByAssetCollection)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    BOOL v5 = [(PXAssetActionPerformer *)self selectionSnapshot];
    id v6 = [v5 selectedIndexPaths];

    objc_super v7 = [(PXPhotoKitAssetActionPerformer *)self photosDataSourceSnapshot];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__PXPhotoKitAssetActionPerformer_assetsByAssetCollection__block_invoke;
    v13[3] = &unk_1E5DC2550;
    id v14 = v7;
    v8 = v4;
    v15 = v8;
    id v9 = v7;
    [v6 enumerateItemIndexSetsUsingBlock:v13];
    v10 = self->_assetsByAssetCollection;
    self->_assetsByAssetCollection = v8;
    v11 = v8;

    assetsByAssetCollection = self->_assetsByAssetCollection;
  }
  return assetsByAssetCollection;
}

void __57__PXPhotoKitAssetActionPerformer_assetsByAssetCollection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v10 = [v6 assetCollectionForSection:a3];
  v8 = [*(id *)(a1 + 32) assetsInSection:a3];
  id v9 = [v8 objectsAtIndexes:v7];

  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v10];
}

- (NSArray)assets
{
  assets = self->_assets;
  if (!assets)
  {
    v4 = [(PXPhotoKitAssetActionPerformer *)self assetsFetchResult];
    BOOL v5 = [v4 fetchedObjects];
    id v6 = self->_assets;
    self->_assets = v5;

    assets = self->_assets;
  }
  return assets;
}

- (PHFetchResult)assetsFetchResult
{
  assetsFetchResult = self->_assetsFetchResult;
  if (!assetsFetchResult)
  {
    v4 = [(PXAssetActionPerformer *)self selectionSnapshot];
    BOOL v5 = [v4 selectedIndexPaths];

    id v6 = [(PXPhotoKitAssetActionPerformer *)self photosDataSourceSnapshot];
    id v7 = [v6 fetchResultWithAssetsAtIndexPaths:v5];
    v8 = self->_assetsFetchResult;
    self->_assetsFetchResult = v7;

    assetsFetchResult = self->_assetsFetchResult;
  }
  return assetsFetchResult;
}

- (id)_indexPathsInPhotosDataSource:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = [(PXPhotoKitAssetActionPerformer *)self assets];
  id v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  v8 = [(PXPhotoKitAssetActionPerformer *)self assetsByAssetCollection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__PXPhotoKitAssetActionPerformer__indexPathsInPhotosDataSource___block_invoke;
  v14[3] = &unk_1E5DC2528;
  id v15 = v4;
  id v9 = v7;
  id v16 = v9;
  id v10 = v4;
  [v8 enumerateKeysAndObjectsUsingBlock:v14];

  v11 = v16;
  id v12 = v9;

  return v12;
}

void __64__PXPhotoKitAssetActionPerformer__indexPathsInPhotosDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(a1 + 32) indexPathForAsset:*(void *)(*((void *)&v12 + 1) + 8 * v10) hintIndexPath:0 hintCollection:v5];
        if (v11) {
          [*(id *)(a1 + 40) addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)forceIncludeAssetsInDataSource
{
  v3 = [(PXPhotoKitAssetActionPerformer *)self photoKitDataSourceManager];
  id v5 = [v3 photosDataSource];

  id v4 = [(PXPhotoKitAssetActionPerformer *)self _indexPathsInPhotosDataSource:v5];
  [v5 forceIncludeAssetsAtIndexPaths:v4];
}

- (void)stopExcludingAssetsFromDataSource
{
  v3 = [(PXPhotoKitAssetActionPerformer *)self photoKitDataSourceManager];
  id v5 = [v3 photosDataSource];

  id v4 = [(PXPhotoKitAssetActionPerformer *)self assets];
  [v5 stopExcludingAssets:v4];
}

- (void)instantlyExcludeAssetsFromDataSource
{
  v3 = [(PXPhotoKitAssetActionPerformer *)self photoKitDataSourceManager];
  id v5 = [v3 photosDataSource];

  id v4 = [(PXPhotoKitAssetActionPerformer *)self _indexPathsInPhotosDataSource:v5];
  [v5 forceExcludeAssetsAtIndexPaths:v4];
}

- (NSDictionary)dataSourceUserInfo
{
  id v4 = [(PXAssetActionPerformer *)self selectionSnapshot];
  id v5 = [v4 dataSource];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v11);
    long long v12 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXPhotoKitAssetActionManager.m", 704, @"%@ should be an instance inheriting from %@, but it is %@", @"self.selectionSnapshot.dataSource", v10, v12 object file lineNumber description];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXPhotoKitAssetActionManager.m", 704, @"%@ should be an instance inheriting from %@, but it is nil", @"self.selectionSnapshot.dataSource", v10 object file lineNumber description];
  }

LABEL_3:
  id v6 = [v5 userInfo];

  return (NSDictionary *)v6;
}

- (PXPhotosDataSource)photosDataSourceSnapshot
{
  id v4 = [(PXAssetActionPerformer *)self selectionSnapshot];
  id v5 = [v4 dataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXPhotoKitAssetActionManager.m", 698, @"Invalid parameter not satisfying: %@", @"[[[self selectionSnapshot] dataSource] isKindOfClass:[PXPhotoKitAssetsDataSource class]]" object file lineNumber description];
  }
  uint64_t v7 = [(PXAssetActionPerformer *)self selectionSnapshot];
  uint64_t v8 = [v7 dataSource];
  uint64_t v9 = [v8 photosDataSource];

  return (PXPhotosDataSource *)v9;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  id v4 = objc_opt_class();
  return (id)[v4 localizedTitleForUseCase:a3 actionManager:0];
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return 0;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return 0;
}

+ (id)createActivityWithActionManager:(id)a3
{
  return 0;
}

+ (id)createStandardActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v6 = [MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
  if ([a1 isActionDestructive]) {
    [v6 setAttributes:2];
  }
  return v6;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v6 = [MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
  if ([a1 isActionDestructive]) {
    [v6 setAttributes:2];
  }
  return v6;
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  return 0;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return 0;
}

+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3
{
  return 0;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 0;
}

+ (BOOL)shouldEnableWithActionManager:(id)a3
{
  return 0;
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v12 = [v9 dataSource];
  if (!v12)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    [v19 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetActionManager.m", 596, @"%@ should be an instance inheriting from %@, but it is nil", @"selectionSnapshot.dataSource", v21 object file lineNumber description];
LABEL_9:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v22);
    v23 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
    [v19 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetActionManager.m", 596, @"%@ should be an instance inheriting from %@, but it is %@", @"selectionSnapshot.dataSource", v21, v23 object file lineNumber description];

    goto LABEL_9;
  }
LABEL_3:
  long long v13 = [v12 photosDataSource];
  long long v14 = [v9 selectedIndexPaths];
  long long v15 = v14;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  if (v13 && [v14 itemCount] >= 1)
  {
    char v16 = [a1 canPerformOnSubsetOfSelection];
    *((unsigned char *)v32 + 24) = v16 ^ 1;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __85__PXPhotoKitAssetActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke;
    v24[3] = &unk_1E5DC2500;
    id v25 = v13;
    id v29 = a1;
    id v26 = v10;
    char v30 = v16;
    id v27 = v11;
    v28 = &v31;
    [v15 enumerateItemIndexSetsUsingBlock:v24];
  }
  char v17 = *((unsigned char *)v32 + 24);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __85__PXPhotoKitAssetActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = a4;
  id v10 = [v8 assetCollectionForSection:a3];
  id v11 = [*(id *)(a1 + 32) assetsInSection:a3];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__PXPhotoKitAssetActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke_2;
  v16[3] = &unk_1E5DC24D8;
  uint64_t v22 = *(void *)(a1 + 64);
  id v17 = v11;
  id v18 = v10;
  id v19 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  char v24 = *(unsigned char *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 56);
  id v20 = v12;
  uint64_t v21 = v13;
  uint64_t v23 = a5;
  id v14 = v10;
  id v15 = v11;
  [v9 enumerateIndexesUsingBlock:v16];
}

void __85__PXPhotoKitAssetActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  char v5 = objc_msgSend(*(id *)(a1 + 72), "canPerformOnAsset:inAssetCollection:person:socialGroup:");
  if (*(unsigned char *)(a1 + 88))
  {
    id v6 = (void *)v8;
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    char v7 = 1;
  }
  else
  {
    id v6 = (void *)v8;
    if (v5) {
      goto LABEL_7;
    }
    char v7 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v7;
  *a3 = 1;
  **(unsigned char **)(a1 + 80) = 1;
LABEL_7:
}

+ (BOOL)canPerformWithActionManager:(id)a3
{
  id v4 = a3;
  char v5 = [v4 _selectionSnapshotForPerformerClass:a1 applySubsetIfNeeded:0];
  id v6 = [v4 person];
  char v7 = [v4 socialGroup];

  if (v5) {
    char v8 = [a1 canPerformWithSelectionSnapshot:v5 person:v6 socialGroup:v7];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

@end