@interface PXAddAssetsToAssetCollectionAction
- (BOOL)shouldSortAssetsByCreationDate;
- (NSArray)unsavedSyndicatedAssets;
- (NSArray)userLibraryAssets;
- (PHAsset)dropTargetAsset;
- (PHAssetCollection)assetCollection;
- (PHFetchResult)existingAssets;
- (PHPhotoLibrary)targetPhotoLibrary;
- (PXAddAssetsToAssetCollectionAction)initWithAssets:(id)a3 assetCollection:(id)a4;
- (PXContentSyndicationPhotoKitAssetGroup)assetGroup;
- (PXFastEnumeration)addedAssets;
- (id)actionNameLocalizationKey;
- (void)_addAssets:(id)a3 completionHandler:(id)a4;
- (void)performAction:(id)a3;
- (void)performRedo:(id)a3;
- (void)performUndo:(id)a3;
- (void)setAddedAssets:(id)a3;
- (void)setDropTargetAsset:(id)a3;
- (void)setShouldSortAssetsByCreationDate:(BOOL)a3;
@end

@implementation PXAddAssetsToAssetCollectionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedAssets, 0);
  objc_storeStrong((id *)&self->_existingAssets, 0);
  objc_storeStrong((id *)&self->_targetPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_dropTargetAsset, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_assetGroup, 0);
}

- (void)setAddedAssets:(id)a3
{
}

- (PXFastEnumeration)addedAssets
{
  return self->_addedAssets;
}

- (PHFetchResult)existingAssets
{
  return self->_existingAssets;
}

- (PHPhotoLibrary)targetPhotoLibrary
{
  return self->_targetPhotoLibrary;
}

- (PHAsset)dropTargetAsset
{
  return self->_dropTargetAsset;
}

- (BOOL)shouldSortAssetsByCreationDate
{
  return self->_shouldSortAssetsByCreationDate;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)performRedo:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAddAssetsToAssetCollectionAction *)self addedAssets];
  [(PXAddAssetsToAssetCollectionAction *)self _addAssets:v5 completionHandler:v4];
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAddAssetsToAssetCollectionAction *)self targetPhotoLibrary];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PXAddAssetsToAssetCollectionAction_performUndo___block_invoke;
  v6[3] = &unk_1E5DD36F8;
  v6[4] = self;
  [v5 performChanges:v6 completionHandler:v4];
}

void __50__PXAddAssetsToAssetCollectionAction_performUndo___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F38EF0];
  v3 = [*(id *)(a1 + 32) assetCollection];
  id v5 = [v2 changeRequestForAssetCollection:v3];

  id v4 = [*(id *)(a1 + 32) addedAssets];
  [v5 removeAssets:v4];
}

- (void)performAction:(id)a3
{
  id v13 = a3;
  id v4 = [(PXAddAssetsToAssetCollectionAction *)self assetGroup];
  id v5 = [v4 unsavedSyndicatedAssets];
  if ([v5 count])
  {
    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v7 = [v4 userLibraryAssets];
    v8 = (void *)[v6 initWithArray:v7];

    v9 = [v4 syndicationIdentifiers];
    v10 = [(PXAddAssetsToAssetCollectionAction *)self targetPhotoLibrary];
    v11 = PXContentSyndicationUserLibraryAssetsFromSyndicationIdentifiers(v9, v10, 0);

    [v8 addObjectsFromArray:v11];
    v12 = [(PXAddAssetsToAssetCollectionAction *)self assetCollection];
    +[PXAddAssetsToLastUsedAssetCollectionAction userDidAddAssetsToAssetCollection:v12];

    [(PXAddAssetsToAssetCollectionAction *)self _addAssets:v8 completionHandler:v13];
  }
}

- (id)actionNameLocalizationKey
{
  return @"PXPhotosGridAddPhotosActionMenuTitle";
}

- (void)_addAssets:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXAddAssetsToAssetCollectionAction *)self addedAssets];
  if (v8) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = [(PXAddAssetsToAssetCollectionAction *)self shouldSortAssetsByCreationDate];
  }

  v10 = [(PXAddAssetsToAssetCollectionAction *)self existingAssets];
  v11 = [(PXAddAssetsToAssetCollectionAction *)self dropTargetAsset];
  v12 = [(PXAddAssetsToAssetCollectionAction *)self targetPhotoLibrary];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__PXAddAssetsToAssetCollectionAction__addAssets_completionHandler___block_invoke;
  v20[3] = &unk_1E5DC3A48;
  BOOL v25 = v9;
  id v21 = v6;
  id v22 = v11;
  id v23 = v10;
  v24 = self;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__PXAddAssetsToAssetCollectionAction__addAssets_completionHandler___block_invoke_2;
  v17[3] = &unk_1E5DD1B00;
  v17[4] = self;
  id v18 = v21;
  id v19 = v7;
  id v13 = v7;
  id v14 = v21;
  id v15 = v10;
  id v16 = v11;
  [v12 performChanges:v20 completionHandler:v17];
}

void __67__PXAddAssetsToAssetCollectionAction__addAssets_completionHandler___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = (void *)MEMORY[0x1E4F38EB8];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v24[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    objc_msgSend(v2, "px_orderedAssetsFromAssets:sortDescriptors:", v3, v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = *(id *)(a1 + 32);
  }
  if (*(void *)(a1 + 40)) {
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 48), "indexOfObject:");
  }
  else {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v8 = (void *)MEMORY[0x1E4F38EF0];
  BOOL v9 = [*(id *)(a1 + 56) assetCollection];
  v10 = [v8 changeRequestForAssetCollection:v9];

  v11 = [MEMORY[0x1E4F28E60] indexSet];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(a1 + 48), "indexOfObject:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
          [v11 addIndex:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  if ([v11 count]) {
    [v10 removeAssets:v12];
  }
  if (objc_msgSend(v11, "count", (void)v19) && *(void *)(a1 + 40))
  {
    if ([v11 containsIndex:v7]) {
      goto LABEL_23;
    }
    v7 -= objc_msgSend(v11, "countOfIndexesInRange:", 0, v7);
  }
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v18 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v7];
    [v10 insertAssets:v12 atIndexes:v18];

    goto LABEL_25;
  }
LABEL_23:
  [v10 addAssets:v12];
LABEL_25:
}

void __67__PXAddAssetsToAssetCollectionAction__addAssets_completionHandler___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  id v5 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v6 = a3;
  [v5 setAddedAssets:v4];
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)setDropTargetAsset:(id)a3
{
  id v5 = (PHAsset *)a3;
  if ([(PXAction *)self executionStarted])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAddAssetsToAssetCollectionAction.m", 83, @"%s cannot be called after the receiver has started executing.", "-[PXAddAssetsToAssetCollectionAction setDropTargetAsset:]");
  }
  dropTargetAsset = self->_dropTargetAsset;
  self->_dropTargetAsset = v5;
}

- (void)setShouldSortAssetsByCreationDate:(BOOL)a3
{
  if ([(PXAction *)self executionStarted])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAddAssetsToAssetCollectionAction.m", 78, @"%s cannot be called after the receiver has started executing.", "-[PXAddAssetsToAssetCollectionAction setShouldSortAssetsByCreationDate:]");
  }
  self->_shouldSortAssetsByCreationDate = a3;
}

- (NSArray)unsavedSyndicatedAssets
{
  v2 = [(PXAddAssetsToAssetCollectionAction *)self assetGroup];
  uint64_t v3 = [v2 unsavedSyndicatedAssets];

  return (NSArray *)v3;
}

- (NSArray)userLibraryAssets
{
  v2 = [(PXAddAssetsToAssetCollectionAction *)self assetGroup];
  uint64_t v3 = [v2 userLibraryAssets];

  return (NSArray *)v3;
}

- (PXContentSyndicationPhotoKitAssetGroup)assetGroup
{
  assetGroup = self->_assetGroup;
  if (!assetGroup)
  {
    uint64_t v4 = [PXContentSyndicationPhotoKitAssetGroup alloc];
    id v5 = [(PXAssetsAction *)self assets];
    id v6 = [(PXContentSyndicationPhotoKitAssetGroup *)v4 initWithAssets:v5];
    uint64_t v7 = self->_assetGroup;
    self->_assetGroup = v6;

    assetGroup = self->_assetGroup;
  }
  return assetGroup;
}

- (PXAddAssetsToAssetCollectionAction)initWithAssets:(id)a3 assetCollection:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id obj = a4;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v8 = [v6 photoLibrary];
  uint64_t v9 = [v8 librarySpecificFetchOptions];

  v26 = (void *)v9;
  BOOL v25 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v6 options:v9];
  v10 = [v25 fetchedObjectIDsSet];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(v16, "objectID", obj);
        char v18 = [v10 containsObject:v17];

        if ((v18 & 1) == 0) {
          [v7 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }

  v27.receiver = self;
  v27.super_class = (Class)PXAddAssetsToAssetCollectionAction;
  long long v19 = [(PXAssetsAction *)&v27 initWithAssets:v7];
  if (v19)
  {
    uint64_t v20 = [v6 photoLibrary];
    targetPhotoLibrary = v19->_targetPhotoLibrary;
    v19->_targetPhotoLibrary = (PHPhotoLibrary *)v20;

    objc_storeStrong((id *)&v19->_assetCollection, obj);
    objc_storeStrong((id *)&v19->_existingAssets, v25);
  }

  return v19;
}

@end