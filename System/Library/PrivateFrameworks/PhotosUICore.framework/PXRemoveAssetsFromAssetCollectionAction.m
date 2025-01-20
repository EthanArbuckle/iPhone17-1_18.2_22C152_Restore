@interface PXRemoveAssetsFromAssetCollectionAction
- (PXRemoveAssetsFromAssetCollectionAction)initWithAssets:(id)a3 assetCollection:(id)a4;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXRemoveAssetsFromAssetCollectionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionInput, 0);
  objc_storeStrong((id *)&self->_assetsInput, 0);
  objc_storeStrong((id *)&self->_removedAssetIndexes, 0);
  objc_storeStrong((id *)&self->_removedAssetIdentifiers, 0);
}

- (void)performUndo:(id)a3
{
  removedAssetIdentifiers = self->_removedAssetIdentifiers;
  id v5 = a3;
  v6 = [(NSDictionary *)removedAssetIdentifiers allKeys];
  v7 = [(PXPhotosAction *)self standardFetchOptions];
  v8 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithLocalIdentifiers:v6 options:v7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__PXRemoveAssetsFromAssetCollectionAction_performUndo___block_invoke_2;
  v11[3] = &unk_1E5DD2BB8;
  id v12 = v8;
  v13 = self;
  id v14 = v7;
  id v15 = &__block_literal_global_40;
  id v9 = v7;
  id v10 = v8;
  [(PXPhotosAction *)self performChanges:v11 completionHandler:v5];
}

void __55__PXRemoveAssetsFromAssetCollectionAction_performUndo___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v14 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v16 != v14) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v6 = [v5 localIdentifier];
        v7 = [*(id *)(*(void *)(a1 + 40) + 112) objectForKeyedSubscript:v6];
        v8 = [*(id *)(*(void *)(a1 + 40) + 104) objectForKeyedSubscript:v6];
        id v9 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v8 options:*(void *)(a1 + 48)];
        id v10 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:*(void *)(a1 + 48)];
        v11 = [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:v5 assets:v10];
        id v12 = (*(void (**)(void, void *, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v7, [v10 count]);
        [v11 insertAssets:v9 atIndexes:v12];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

id __55__PXRemoveAssetsFromAssetCollectionAction_performUndo___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v6 = [v4 firstIndex];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = v6;
    do
    {
      if (v7 >= a3) {
        unint64_t v8 = a3;
      }
      else {
        unint64_t v8 = v7;
      }
      [v5 addIndex:v8];
      unint64_t v7 = [v4 indexGreaterThanIndex:v7];
      ++a3;
    }
    while (v7 != 0x7FFFFFFFFFFFFFFFLL);
  }
  id v9 = (void *)[v5 copy];

  return v9;
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__PXRemoveAssetsFromAssetCollectionAction_performAction___block_invoke;
  v14[3] = &unk_1E5DD0F30;
  v14[4] = self;
  id v15 = v5;
  id v16 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PXRemoveAssetsFromAssetCollectionAction_performAction___block_invoke_5;
  v10[3] = &unk_1E5DD1B28;
  v10[4] = self;
  id v11 = v15;
  id v12 = v16;
  id v13 = v4;
  id v7 = v4;
  id v8 = v16;
  id v9 = v15;
  [(PXPhotosAction *)self performChanges:v14 completionHandler:v10];
}

void __57__PXRemoveAssetsFromAssetCollectionAction_performAction___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 120) count])
  {
    [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:*(void *)(*(void *)(a1 + 32) + 128) assets:0];
    [(id)objc_claimAutoreleasedReturnValue() removeAssets:*(void *)(*(void *)(a1 + 32) + 120)];
    [*(id *)(*(void *)(a1 + 32) + 128) localIdentifier];
    objc_claimAutoreleasedReturnValue();
    PXMap();
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__PXRemoveAssetsFromAssetCollectionAction_performAction___block_invoke_3;
  v3[3] = &unk_1E5DBEB10;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 enumerateSelectedAssetIndexSetsUsingBlock:v3];
}

void __57__PXRemoveAssetsFromAssetCollectionAction_performAction___block_invoke_5(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), *(id *)(a1 + 48));
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __57__PXRemoveAssetsFromAssetCollectionAction_performAction___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  id v10 = [v7 objectsAtIndexes:v6];
  id v9 = [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:v8 assets:v7];

  [v9 removeAssets:v10];
  [v8 localIdentifier];
  objc_claimAutoreleasedReturnValue();

  PXMap();
}

uint64_t __57__PXRemoveAssetsFromAssetCollectionAction_performAction___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

uint64_t __57__PXRemoveAssetsFromAssetCollectionAction_performAction___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

- (id)actionNameLocalizationKey
{
  return @"PXPhotoKitAssetActionManagerStandardActionTitle_Remove";
}

- (id)actionIdentifier
{
  return @"RemoveAssetsFromAssetCollection";
}

- (PXRemoveAssetsFromAssetCollectionAction)initWithAssets:(id)a3 assetCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 firstObject];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 photoLibrary];
    id v11 = [(PXPhotosAction *)self initWithPhotoLibrary:v10];

    if (v11)
    {
      uint64_t v12 = [v6 copy];
      assetsInput = v11->_assetsInput;
      v11->_assetsInput = (NSArray *)v12;

      objc_storeStrong((id *)&v11->_collectionInput, a4);
    }
    self = v11;
    uint64_t v14 = self;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

@end