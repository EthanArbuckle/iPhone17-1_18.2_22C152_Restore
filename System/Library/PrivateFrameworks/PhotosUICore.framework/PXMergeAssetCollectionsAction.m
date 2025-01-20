@interface PXMergeAssetCollectionsAction
+ (BOOL)canPerformOnCollection:(id)a3;
- (PHAssetCollection)targetAssetCollection;
- (PXAddAssetsToAssetCollectionAction)addAssetsToCollectionAction;
- (PXDeleteCollectionsAction)deleteCollectionsAction;
- (PXFastEnumeration)sourceAssetCollections;
- (PXMergeAssetCollectionsAction)initWithSourceAssetCollections:(id)a3 targetAssetCollection:(id)a4;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
- (void)setAddAssetsToCollectionAction:(id)a3;
- (void)setDeleteCollectionsAction:(id)a3;
@end

@implementation PXMergeAssetCollectionsAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteCollectionsAction, 0);
  objc_storeStrong((id *)&self->_addAssetsToCollectionAction, 0);
  objc_storeStrong((id *)&self->_targetAssetCollection, 0);
  objc_storeStrong((id *)&self->_sourceAssetCollections, 0);
}

- (void)setDeleteCollectionsAction:(id)a3
{
}

- (PXDeleteCollectionsAction)deleteCollectionsAction
{
  return self->_deleteCollectionsAction;
}

- (void)setAddAssetsToCollectionAction:(id)a3
{
}

- (PXAddAssetsToAssetCollectionAction)addAssetsToCollectionAction
{
  return self->_addAssetsToCollectionAction;
}

- (PHAssetCollection)targetAssetCollection
{
  return self->_targetAssetCollection;
}

- (PXFastEnumeration)sourceAssetCollections
{
  return self->_sourceAssetCollections;
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  v5 = [(PXMergeAssetCollectionsAction *)self deleteCollectionsAction];
  v6 = [(PXMergeAssetCollectionsAction *)self addAssetsToCollectionAction];
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__PXMergeAssetCollectionsAction_performUndo___block_invoke;
    v8[3] = &unk_1E5DD2B90;
    id v10 = v4;
    id v9 = v6;
    [v5 performUndo:v8];
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Unable to undo merge of asset collections");
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }
}

void __45__PXMergeAssetCollectionsAction_performUndo___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    if (v6)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __45__PXMergeAssetCollectionsAction_performUndo___block_invoke_2;
      v7[3] = &unk_1E5DCDD58;
      id v8 = *(id *)(a1 + 40);
      [v6 performUndo:v7];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __45__PXMergeAssetCollectionsAction_performUndo___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performAction:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [(PXMergeAssetCollectionsAction *)self sourceAssetCollections];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:*(void *)(*((void *)&v23 + 1) + 8 * v10) options:0];
        v12 = [v11 fetchedObjects];
        [v5 addObjectsFromArray:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
  v13 = [[PXDeleteCollectionsAction alloc] initWithCollections:v6];
  [(PXMergeAssetCollectionsAction *)self setDeleteCollectionsAction:v13];
  if ([v5 count])
  {
    v14 = [PXAddAssetsToAssetCollectionAction alloc];
    v15 = [(PXMergeAssetCollectionsAction *)self targetAssetCollection];
    v16 = [(PXAddAssetsToAssetCollectionAction *)v14 initWithAssets:v5 assetCollection:v15];

    [(PXMergeAssetCollectionsAction *)self setAddAssetsToCollectionAction:v16];
    if (v16)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __47__PXMergeAssetCollectionsAction_performAction___block_invoke_2;
      v18[3] = &unk_1E5DD2B90;
      id v20 = v4;
      v19 = v13;
      [(PXAddAssetsToAssetCollectionAction *)v16 performAction:v18];

      v17 = v20;
    }
    else
    {
      v17 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Unable to merge asset collections");
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v17);
    }

    goto LABEL_15;
  }
  if (v13)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __47__PXMergeAssetCollectionsAction_performAction___block_invoke;
    v21[3] = &unk_1E5DCDD58;
    v22 = (PXAddAssetsToAssetCollectionAction *)v4;
    [(PXDeleteCollectionsAction *)v13 performAction:v21];
    v16 = v22;
LABEL_15:
  }
}

uint64_t __47__PXMergeAssetCollectionsAction_performAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__PXMergeAssetCollectionsAction_performAction___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    if (v6)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __47__PXMergeAssetCollectionsAction_performAction___block_invoke_3;
      v7[3] = &unk_1E5DCDD58;
      id v8 = *(id *)(a1 + 40);
      [v6 performAction:v7];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __47__PXMergeAssetCollectionsAction_performAction___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)actionNameLocalizationKey
{
  return @"PXMergeAlbumActionName";
}

- (id)actionIdentifier
{
  return @"MergeAssetCollection";
}

- (PXMergeAssetCollectionsAction)initWithSourceAssetCollections:(id)a3 targetAssetCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 photoLibrary];
  v13.receiver = self;
  v13.super_class = (Class)PXMergeAssetCollectionsAction;
  uint64_t v9 = [(PXPhotosAction *)&v13 initWithPhotoLibrary:v8];

  if (v9)
  {
    uint64_t v10 = [v6 copy];
    sourceAssetCollections = v9->_sourceAssetCollections;
    v9->_sourceAssetCollections = (PXFastEnumeration *)v10;

    objc_storeStrong((id *)&v9->_targetAssetCollection, a4);
  }

  return v9;
}

+ (BOOL)canPerformOnCollection:(id)a3
{
  return [a3 canPerformEditOperation:3];
}

@end