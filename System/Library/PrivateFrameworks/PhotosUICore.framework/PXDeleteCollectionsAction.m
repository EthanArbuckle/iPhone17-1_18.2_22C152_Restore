@interface PXDeleteCollectionsAction
- (PXDeleteCollectionsAction)initWithCollection:(id)a3;
- (PXDeleteCollectionsAction)initWithCollections:(id)a3;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (id)collections;
- (void)performAction:(id)a3;
- (void)performRedo:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXDeleteCollectionsAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_collectionLists, 0);
  objc_storeStrong((id *)&self->_assetCollections, 0);
}

- (id)collections
{
  return self->_collections;
}

- (void)performRedo:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__PXDeleteCollectionsAction_performRedo___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

uint64_t __41__PXDeleteCollectionsAction_performRedo___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F38EF0] deleteAssetCollections:*(void *)(*(void *)(a1 + 32) + 88)];
  v2 = (void *)MEMORY[0x1E4F39010];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 96);
  return [v2 deleteCollectionLists:v3];
}

- (void)performUndo:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__PXDeleteCollectionsAction_performUndo___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

uint64_t __41__PXDeleteCollectionsAction_performUndo___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F38EF0] undeleteAssetCollections:*(void *)(*(void *)(a1 + 32) + 88)];
  v2 = (void *)MEMORY[0x1E4F39010];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 96);
  return [v2 undeleteCollectionLists:v3];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  v5 = [(PXDeleteCollectionsAction *)self collections];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__PXDeleteCollectionsAction_performAction___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  id v8 = v5;
  v9 = self;
  id v6 = v5;
  [(PXPhotosAction *)self performChanges:v7 completionHandler:v4];
}

void __43__PXDeleteCollectionsAction_performAction___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v9, "canPerformEditOperation:", 6, (void)v19))
        {
          char v10 = [v9 canContainAssets];
          v11 = v2;
          if ((v10 & 1) != 0 || (int v12 = [v9 canContainCollections], v11 = v3, v12)) {
            [v11 addObject:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  uint64_t v13 = [v2 copy];
  uint64_t v14 = *(void *)(a1 + 40);
  v15 = *(void **)(v14 + 88);
  *(void *)(v14 + 88) = v13;

  uint64_t v16 = [v3 copy];
  uint64_t v17 = *(void *)(a1 + 40);
  v18 = *(void **)(v17 + 96);
  *(void *)(v17 + 96) = v16;

  [MEMORY[0x1E4F38EF0] deleteAssetCollections:v2];
  [MEMORY[0x1E4F39010] deleteCollectionLists:v3];
}

- (id)actionNameLocalizationKey
{
  v2 = [(PXDeleteCollectionsAction *)self collections];
  if ([v2 count] == 1)
  {
    uint64_t v3 = [v2 firstObject];
    id v4 = v3;
    uint64_t v5 = @"PXDeleteActionName";
    if (v3)
    {
      if ([v3 canContainAssets])
      {
        uint64_t v5 = @"PXDeleteAlbumActionName";
      }
      else if ([v4 canContainCollections])
      {
        uint64_t v5 = @"PXDeleteFolderActionName";
      }
    }
  }
  else
  {
    id v4 = 0;
    uint64_t v5 = @"PXDeleteActionName";
  }

  return v5;
}

- (id)actionIdentifier
{
  return @"DeleteCollections";
}

- (PXDeleteCollectionsAction)initWithCollection:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v9 count:1];

  uint64_t v7 = -[PXDeleteCollectionsAction initWithCollections:](self, "initWithCollections:", v6, v9, v10);
  return v7;
}

- (PXDeleteCollectionsAction)initWithCollections:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 photoLibrary];
    v13.receiver = self;
    v13.super_class = (Class)PXDeleteCollectionsAction;
    id v8 = [(PXPhotosAction *)&v13 initWithPhotoLibrary:v7];

    if (v8)
    {
      uint64_t v9 = [v4 copy];
      collections = v8->_collections;
      v8->_collections = (PXFastEnumeration *)v9;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end