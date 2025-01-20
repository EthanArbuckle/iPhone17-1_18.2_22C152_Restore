@interface PXRearrangeAssetCollectionAction
+ (BOOL)canPerformOnCollection:(id)a3;
- (BOOL)_canPerformUndo;
- (PHAsset)targetAsset;
- (PHAssetCollection)assetCollection;
- (PXFastEnumeration)movedAssets;
- (PXRearrangeAssetCollectionAction)initWithAssetCollection:(id)a3 movedAssets:(id)a4 targetAsset:(id)a5;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (int64_t)adjustedTargetIndexForFetchResult:(id)a3 movedAssets:(id)a4 targetAsset:(id)a5;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXRearrangeAssetCollectionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetAsset, 0);
  objc_storeStrong((id *)&self->_movedAssets, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_afterFetchResult, 0);
  objc_storeStrong((id *)&self->_beforeFetchResult, 0);
}

- (PHAsset)targetAsset
{
  return self->_targetAsset;
}

- (PXFastEnumeration)movedAssets
{
  return self->_movedAssets;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)performUndo:(id)a3
{
  v4 = (PHAssetCollection *)a3;
  if ([(PXRearrangeAssetCollectionAction *)self _canPerformUndo])
  {
    v5 = self->_assetCollection;
    v6 = self->_beforeFetchResult;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__PXRearrangeAssetCollectionAction_performUndo___block_invoke;
    v9[3] = &unk_1E5DD32A8;
    v10 = v5;
    v11 = v6;
    v7 = v6;
    v8 = v5;
    [(PXPhotosAction *)self performChanges:v9 completionHandler:v4];

    v4 = v8;
  }
  else
  {
    (*(void (**)(PHAssetCollection *, void, void))&v4->super.super._propertyHintLock._os_unfair_lock_opaque)(v4, 0, 0);
  }
}

void __48__PXRearrangeAssetCollectionAction_performUndo___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:*(void *)(a1 + 32)];
  [v2 removeAssets:*(void *)(a1 + 40)];
  [v2 addAssets:*(void *)(a1 + 40)];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  v5 = self->_assetCollection;
  v6 = self->_movedAssets;
  v7 = self->_targetAsset;
  v8 = [(PXPhotosAction *)self standardFetchOptions];
  v9 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:v8];
  beforeFetchResult = self->_beforeFetchResult;
  self->_beforeFetchResult = v9;

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __50__PXRearrangeAssetCollectionAction_performAction___block_invoke;
  v20[3] = &unk_1E5DCAEC8;
  v20[4] = self;
  v21 = v6;
  v22 = v7;
  v23 = v5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__PXRearrangeAssetCollectionAction_performAction___block_invoke_2;
  v16[3] = &unk_1E5DD1B28;
  v16[4] = self;
  v17 = v23;
  id v18 = v8;
  id v19 = v4;
  id v11 = v4;
  id v12 = v8;
  v13 = v23;
  v14 = v7;
  v15 = v6;
  [(PXPhotosAction *)self performChanges:v20 completionHandler:v16];
}

void __50__PXRearrangeAssetCollectionAction_performAction___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) adjustedTargetIndexForFetchResult:*(void *)(*(void *)(a1 + 32) + 88) movedAssets:*(void *)(a1 + 40) targetAsset:*(void *)(a1 + 48)];
  id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v2, objc_msgSend(*(id *)(a1 + 40), "count"));
  v3 = [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:*(void *)(a1 + 56)];
  [v3 removeAssets:*(void *)(a1 + 40)];
  [v3 insertAssets:*(void *)(a1 + 40) atIndexes:v4];
}

void __50__PXRearrangeAssetCollectionAction_performAction___block_invoke_2(void *a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    v5 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:a1[5] options:a1[6]];
  }
  else
  {
    v5 = 0;
  }
  objc_storeStrong((id *)(a1[4] + 96), v5);
  if (a2) {

  }
  (*(void (**)(void))(a1[7] + 16))();
}

- (id)actionNameLocalizationKey
{
  return @"PXRearrangeAlbumActionName";
}

- (id)actionIdentifier
{
  return @"RearrangeAssetCollection";
}

- (BOOL)_canPerformUndo
{
  v3 = [(PXPhotosAction *)self standardFetchOptions];
  id v4 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:self->_assetCollection options:v3];
  v5 = [v4 fetchedObjectIDs];
  id v6 = [(PHFetchResult *)self->_afterFetchResult fetchedObjectIDs];
  char v7 = [v5 isEqualToArray:v6];

  return v7;
}

- (int64_t)adjustedTargetIndexForFetchResult:(id)a3 movedAssets:(id)a4 targetAsset:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = v8;
  if (a5) {
    uint64_t v10 = [v8 indexOfObject:a5];
  }
  else {
    uint64_t v10 = [v8 count];
  }
  int64_t v11 = +[PXDragAndDropUtilities adjustedTargetIndexForCollection:v9 movedObjects:v7 targetIndex:v10];

  return v11;
}

- (PXRearrangeAssetCollectionAction)initWithAssetCollection:(id)a3 movedAssets:(id)a4 targetAsset:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 photoLibrary];
  v15.receiver = self;
  v15.super_class = (Class)PXRearrangeAssetCollectionAction;
  v13 = [(PXPhotosAction *)&v15 initWithPhotoLibrary:v12];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_assetCollection, a3);
    objc_storeStrong((id *)&v13->_movedAssets, a4);
    objc_storeStrong((id *)&v13->_targetAsset, a5);
  }

  return v13;
}

+ (BOOL)canPerformOnCollection:(id)a3
{
  return [a3 canPerformEditOperation:5];
}

@end