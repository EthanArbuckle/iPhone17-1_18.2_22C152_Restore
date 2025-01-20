@interface PXCreateAssetCollectionAction
- (NSArray)unsavedSyndicatedAssets;
- (NSArray)userLibraryAssets;
- (NSString)createdCollectionIdentifier;
- (NSString)title;
- (PHAssetCollection)createdAssetCollection;
- (PHCollectionList)parentCollectionList;
- (PXContentSyndicationPhotoKitAssetGroup)assetGroup;
- (PXCreateAssetCollectionAction)initWithTitle:(id)a3 parentCollectionList:(id)a4 selectedAssets:(id)a5;
- (PXFastEnumeration)selectedAssets;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (void)performAction:(id)a3;
- (void)performRedo:(id)a3;
- (void)performUndo:(id)a3;
- (void)setCreatedCollectionIdentifier:(id)a3;
@end

@implementation PXCreateAssetCollectionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdCollectionIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedAssets, 0);
  objc_storeStrong((id *)&self->_parentCollectionList, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_createdAssetCollection, 0);
  objc_storeStrong((id *)&self->_assetGroup, 0);
}

- (void)setCreatedCollectionIdentifier:(id)a3
{
}

- (NSString)createdCollectionIdentifier
{
  return self->_createdCollectionIdentifier;
}

- (PXFastEnumeration)selectedAssets
{
  return self->_selectedAssets;
}

- (PHCollectionList)parentCollectionList
{
  return self->_parentCollectionList;
}

- (NSString)title
{
  return self->_title;
}

- (void)performRedo:(id)a3
{
  id v4 = a3;
  v5 = [(PXCreateAssetCollectionAction *)self createdAssetCollection];
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__PXCreateAssetCollectionAction_performRedo___block_invoke;
    v7[3] = &unk_1E5DD36F8;
    id v8 = v5;
    [(PXPhotosAction *)self performChanges:v7 completionHandler:v4];

    id v4 = v8;
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __45__PXCreateAssetCollectionAction_performRedo___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F38EF0];
  v3[0] = *(void *)(a1 + 32);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 undeleteAssetCollections:v2];
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  v5 = [(PXCreateAssetCollectionAction *)self createdAssetCollection];
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__PXCreateAssetCollectionAction_performUndo___block_invoke;
    v7[3] = &unk_1E5DD36F8;
    id v8 = v5;
    [(PXPhotosAction *)self performChanges:v7 completionHandler:v4];

    id v4 = v8;
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __45__PXCreateAssetCollectionAction_performUndo___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F38EF0];
  v3[0] = *(void *)(a1 + 32);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 deleteAssetCollections:v2];
}

- (void)performAction:(id)a3
{
  id v6 = a3;
  id v4 = [(PXCreateAssetCollectionAction *)self unsavedSyndicatedAssets];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__PXCreateAssetCollectionAction_performAction___block_invoke;
    v7[3] = &unk_1E5DD36F8;
    void v7[4] = self;
    [(PXPhotosAction *)self performChanges:v7 completionHandler:v6];
  }
}

void __47__PXCreateAssetCollectionAction_performAction___block_invoke(uint64_t a1)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F38EF0];
  v3 = [*(id *)(a1 + 32) title];
  id v4 = [v2 creationRequestForAssetCollectionWithTitle:v3];

  [v4 setCustomSortKey:1];
  [v4 setCustomSortAscending:0];
  uint64_t v5 = [*(id *)(a1 + 32) assetGroup];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v7 = [v5 userLibraryAssets];
    id v8 = (void *)[v6 initWithArray:v7];

    v9 = [v5 syndicationIdentifiers];
    v10 = [*(id *)(a1 + 32) photoLibrary];
    v11 = PXContentSyndicationUserLibraryAssetsFromSyndicationIdentifiers(v9, v10, 0);

    [v8 addObjectsFromArray:v11];
    v12 = (void *)MEMORY[0x1E4F38EB8];
    v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v28[0] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    v15 = objc_msgSend(v12, "px_orderedAssetsFromAssets:sortDescriptors:", v8, v14);

    [v4 addAssets:v15];
  }
  v16 = [v4 placeholderForCreatedAssetCollection];
  v17 = [v16 localIdentifier];
  [*(id *)(a1 + 32) setCreatedCollectionIdentifier:v17];

  v18 = [*(id *)(a1 + 32) parentCollectionList];
  v19 = +[PXPhotoKitCollectionsDataSourceManager standardDataSourceManagerForCollectionList:v18];

  v20 = [v19 collectionsFetchResult];
  uint64_t v21 = [v19 indexOfFirstReorderableCollection];
  v22 = (void *)MEMORY[0x1E4F39010];
  v23 = [*(id *)(a1 + 32) parentCollectionList];
  v24 = [v22 changeRequestForCollectionList:v23 childCollections:v20];

  v27 = v16;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v26 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v21];
  [v24 insertChildCollections:v25 atIndexes:v26];

  +[PXTipsAppDonation donateSignalForEvent:2];
}

- (id)actionNameLocalizationKey
{
  return @"PXCreateAlbumActionName";
}

- (id)actionIdentifier
{
  return @"CreateAssetCollection";
}

- (PHAssetCollection)createdAssetCollection
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PXCreateAssetCollectionAction *)self createdCollectionIdentifier];
  createdAssetCollection = self->_createdAssetCollection;
  if (createdAssetCollection) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    id v6 = (void *)MEMORY[0x1E4F38EE8];
    v14[0] = v3;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v8 = [(PXPhotosAction *)self standardFetchOptions];
    v9 = [v6 fetchAssetCollectionsWithLocalIdentifiers:v7 options:v8];
    v10 = [v9 firstObject];
    v11 = self->_createdAssetCollection;
    self->_createdAssetCollection = v10;

    createdAssetCollection = self->_createdAssetCollection;
  }
  v12 = createdAssetCollection;

  return v12;
}

- (NSArray)unsavedSyndicatedAssets
{
  v2 = [(PXCreateAssetCollectionAction *)self assetGroup];
  v3 = [v2 unsavedSyndicatedAssets];

  return (NSArray *)v3;
}

- (NSArray)userLibraryAssets
{
  v2 = [(PXCreateAssetCollectionAction *)self assetGroup];
  v3 = [v2 userLibraryAssets];

  return (NSArray *)v3;
}

- (PXContentSyndicationPhotoKitAssetGroup)assetGroup
{
  assetGroup = self->_assetGroup;
  if (!assetGroup)
  {
    id v4 = [PXContentSyndicationPhotoKitAssetGroup alloc];
    BOOL v5 = [(PXCreateAssetCollectionAction *)self selectedAssets];
    id v6 = [(PXContentSyndicationPhotoKitAssetGroup *)v4 initWithAssets:v5];
    v7 = self->_assetGroup;
    self->_assetGroup = v6;

    assetGroup = self->_assetGroup;
  }
  return assetGroup;
}

- (PXCreateAssetCollectionAction)initWithTitle:(id)a3 parentCollectionList:(id)a4 selectedAssets:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 photoLibrary];
  v16.receiver = self;
  v16.super_class = (Class)PXCreateAssetCollectionAction;
  v12 = [(PXPhotosAction *)&v16 initWithPhotoLibrary:v11];

  if (v12)
  {
    uint64_t v13 = [v8 copy];
    title = v12->_title;
    v12->_title = (NSString *)v13;

    objc_storeStrong((id *)&v12->_parentCollectionList, a4);
    objc_storeStrong((id *)&v12->_selectedAssets, a5);
  }

  return v12;
}

@end