@interface PXRearrangeCollectionListAction
+ (BOOL)canPerformOnCollection:(id)a3;
- (BOOL)_canPerformUndo;
- (PHCollection)targetCollection;
- (PHCollectionList)collectionList;
- (PXFastEnumeration)movedCollections;
- (PXRearrangeCollectionListAction)initWithCollectionList:(id)a3 movedCollections:(id)a4 targetCollection:(id)a5;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (id)standardFetchOptions;
- (int64_t)adjustedTargetIndexForFetchResult:(id)a3 movedAssets:(id)a4 targetAsset:(id)a5;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXRearrangeCollectionListAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetCollection, 0);
  objc_storeStrong((id *)&self->_movedCollections, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
  objc_storeStrong((id *)&self->_afterFetchResult, 0);
  objc_storeStrong((id *)&self->_beforeFetchResult, 0);
}

- (PHCollection)targetCollection
{
  return self->_targetCollection;
}

- (PXFastEnumeration)movedCollections
{
  return self->_movedCollections;
}

- (PHCollectionList)collectionList
{
  return self->_collectionList;
}

- (void)performUndo:(id)a3
{
  v4 = (PHCollectionList *)a3;
  if ([(PXRearrangeCollectionListAction *)self _canPerformUndo])
  {
    v5 = self->_collectionList;
    v6 = self->_beforeFetchResult;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__PXRearrangeCollectionListAction_performUndo___block_invoke;
    v9[3] = &unk_1E5DD32A8;
    v10 = v6;
    v11 = v5;
    v7 = v5;
    v8 = v6;
    [(PXPhotosAction *)self performChanges:v9 completionHandler:v4];

    v4 = v7;
  }
  else
  {
    (*(void (**)(PHCollectionList *, void, void))&v4->super.super._propertyHintLock._os_unfair_lock_opaque)(v4, 0, 0);
  }
}

void __47__PXRearrangeCollectionListAction_performUndo___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = [MEMORY[0x1E4F39010] changeRequestForCollectionList:*(void *)(a1 + 40)];
  [v2 removeChildCollections:*(void *)(a1 + 32)];
  [v2 insertChildCollections:*(void *)(a1 + 32) atIndexes:v3];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  v5 = self->_collectionList;
  v6 = self->_movedCollections;
  v7 = self->_targetCollection;
  v8 = [(PXRearrangeCollectionListAction *)self standardFetchOptions];
  v9 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v5 options:v8];
  beforeFetchResult = self->_beforeFetchResult;
  self->_beforeFetchResult = v9;

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __49__PXRearrangeCollectionListAction_performAction___block_invoke;
  v20[3] = &unk_1E5DCAEC8;
  v20[4] = self;
  v21 = v6;
  v22 = v7;
  v23 = v5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __49__PXRearrangeCollectionListAction_performAction___block_invoke_2;
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

void __49__PXRearrangeCollectionListAction_performAction___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) adjustedTargetIndexForFetchResult:*(void *)(*(void *)(a1 + 32) + 88) movedAssets:*(void *)(a1 + 40) targetAsset:*(void *)(a1 + 48)];
  id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v2, objc_msgSend(*(id *)(a1 + 40), "count"));
  id v3 = [MEMORY[0x1E4F39010] changeRequestForCollectionList:*(void *)(a1 + 56) childCollections:*(void *)(*(void *)(a1 + 32) + 88)];
  [v3 removeChildCollections:*(void *)(a1 + 40)];
  [v3 insertChildCollections:*(void *)(a1 + 40) atIndexes:v4];
}

void __49__PXRearrangeCollectionListAction_performAction___block_invoke_2(void *a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    v5 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:a1[5] options:a1[6]];
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
  return @"PXRearrangeFolderActionName";
}

- (id)actionIdentifier
{
  return @"RearrangeCollectionList";
}

- (id)standardFetchOptions
{
  v4.receiver = self;
  v4.super_class = (Class)PXRearrangeCollectionListAction;
  uint64_t v2 = [(PXPhotosAction *)&v4 standardFetchOptions];
  [v2 setIncludeUserSmartAlbums:1];
  return v2;
}

- (BOOL)_canPerformUndo
{
  id v3 = [(PXRearrangeCollectionListAction *)self standardFetchOptions];
  objc_super v4 = [MEMORY[0x1E4F39008] fetchCollectionsInCollectionList:self->_collectionList options:v3];
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

- (PXRearrangeCollectionListAction)initWithCollectionList:(id)a3 movedCollections:(id)a4 targetCollection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 photoLibrary];
  v15.receiver = self;
  v15.super_class = (Class)PXRearrangeCollectionListAction;
  v13 = [(PXPhotosAction *)&v15 initWithPhotoLibrary:v12];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_collectionList, a3);
    objc_storeStrong((id *)&v13->_movedCollections, a4);
    objc_storeStrong((id *)&v13->_targetCollection, a5);
  }

  return v13;
}

+ (BOOL)canPerformOnCollection:(id)a3
{
  id v3 = a3;
  if ([v3 canContainCollections]) {
    char v4 = [v3 canPerformEditOperation:5];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

@end