@interface PXStoryRearrangeMemoryAssetsAction
- (PHAsset)targetAsset;
- (PXFastEnumeration)movedAssets;
- (PXStoryModel)model;
- (PXStoryRearrangeMemoryAssetsAction)initWithModel:(id)a3 movedAssets:(id)a4 beforeAsset:(id)a5;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXStoryRearrangeMemoryAssetsAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetAsset, 0);
  objc_storeStrong((id *)&self->_movedAssets, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (PHAsset)targetAsset
{
  return self->_targetAsset;
}

- (PXFastEnumeration)movedAssets
{
  return self->_movedAssets;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (void)performUndo:(id)a3
{
}

- (void)performAction:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXStoryRearrangeMemoryAssetsAction *)self movedAssets];
  v6 = [(PXStoryRearrangeMemoryAssetsAction *)self targetAsset];
  v7 = [(PXStoryRearrangeMemoryAssetsAction *)self model];
  v8 = [v7 recipeManager];

  v9 = [v8 assetsDataSourceManager];
  v10 = [v9 dataSource];

  v11 = +[PXStorySettings sharedInstance];
  if (![v11 allowCustomUserAssets] || !v10 || !objc_msgSend(v5, "count"))
  {

    goto LABEL_8;
  }
  uint64_t v12 = [v10 numberOfSections];

  if (v12 != 1)
  {
LABEL_8:
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    goto LABEL_9;
  }
  [v10 firstSectionIndexPath];
  v13 = [v10 assetsInSectionIndexPath:v43];
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, objc_msgSend(v13, "count"));
  v15 = [v13 objectsAtIndexes:v14];
  v31 = (void *)[v15 mutableCopy];

  if (v6) {
    uint64_t v16 = [v13 indexOfObject:v6];
  }
  else {
    uint64_t v16 = [v13 count];
  }
  v17 = v31;
  unint64_t v18 = +[PXDragAndDropUtilities adjustedTargetIndexForCollection:v31 movedObjects:v5 targetIndex:v16];
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
  else
  {
    v28 = v14;
    v29 = v13;
    v30 = v6;
    unint64_t v26 = v18;
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v18, objc_msgSend(v5, "count"));
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v20 = v5;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v20);
          }
          [v19 addObject:*(void *)(*((void *)&v39 + 1) + 8 * i)];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v22);
    }

    v17 = v31;
    [v31 removeObjectsInArray:v19];
    [v31 insertObjects:v19 atIndexes:v27];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PXStoryRearrangeMemoryAssetsAction_performAction___block_invoke;
    block[3] = &unk_1E5DCF088;
    block[4] = self;
    id v33 = v8;
    unint64_t v38 = v26;
    id v34 = v10;
    id v35 = v19;
    id v36 = v31;
    id v37 = v4;
    id v25 = v19;
    dispatch_async(MEMORY[0x1E4F14428], block);

    v13 = v29;
    v6 = v30;
    v14 = v28;
  }

LABEL_9:
}

void __52__PXStoryRearrangeMemoryAssetsAction_performAction___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) model];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PXStoryRearrangeMemoryAssetsAction_performAction___block_invoke_2;
  v5[3] = &unk_1E5DCF060;
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 80);
  id v7 = v3;
  uint64_t v11 = v4;
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  [v2 requestPersistencePermission:v5];
}

void __52__PXStoryRearrangeMemoryAssetsAction_performAction___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__PXStoryRearrangeMemoryAssetsAction_performAction___block_invoke_3;
    v7[3] = &unk_1E5DCF038;
    id v3 = *(void **)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 72);
    id v8 = v4;
    uint64_t v13 = v5;
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 64);
    [v3 performChanges:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v6();
  }
}

void __52__PXStoryRearrangeMemoryAssetsAction_performAction___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    [*(id *)(a1 + 32) firstSectionIndexPath];
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  uint64_t v5 = [v4 keyAssetsInSectionIndexPath:&v8];
  uint64_t v6 = [v5 firstObject];

  if (!*(void *)(a1 + 72) || [*(id *)(a1 + 40) containsObject:v6])
  {
    id v7 = objc_msgSend(*(id *)(a1 + 48), "firstObject", v8, v9);
    [v3 applyKeyAsset:v7];
  }
  PXDisplayAssetFetchResultFromArray();
}

uint64_t __52__PXStoryRearrangeMemoryAssetsAction_performAction___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 deleteAllChapters];
}

- (id)actionNameLocalizationKey
{
  return @"PXRearrangeMemoryAssetsActionName";
}

- (id)actionIdentifier
{
  return @"RearrangeMemoryAssets";
}

- (PXStoryRearrangeMemoryAssetsAction)initWithModel:(id)a3 movedAssets:(id)a4 beforeAsset:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v11 photoLibrary];
  v15.receiver = self;
  v15.super_class = (Class)PXStoryRearrangeMemoryAssetsAction;
  uint64_t v13 = [(PXPhotosAction *)&v15 initWithPhotoLibrary:v12];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_model, a3);
    objc_storeStrong((id *)&v13->_movedAssets, a4);
    objc_storeStrong((id *)&v13->_targetAsset, a5);
  }

  return v13;
}

@end