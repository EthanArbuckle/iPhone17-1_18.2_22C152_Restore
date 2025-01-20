@interface PXCreateSmartAlbumAction
- (NSString)createdCollectionIdentifier;
- (NSString)title;
- (PHAssetCollection)createdAssetCollection;
- (PHCollectionList)parentCollectionList;
- (PXCreateSmartAlbumAction)initWithTitle:(id)a3 parentCollectionList:(id)a4;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (void)performAction:(id)a3;
- (void)performRedo:(id)a3;
- (void)performUndo:(id)a3;
- (void)setCreatedCollectionIdentifier:(id)a3;
@end

@implementation PXCreateSmartAlbumAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdCollectionIdentifier, 0);
  objc_storeStrong((id *)&self->_parentCollectionList, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_createdAssetCollection, 0);
}

- (void)setCreatedCollectionIdentifier:(id)a3
{
}

- (NSString)createdCollectionIdentifier
{
  return self->_createdCollectionIdentifier;
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
  v5 = [(PXCreateSmartAlbumAction *)self createdAssetCollection];
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__PXCreateSmartAlbumAction_performRedo___block_invoke;
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

void __40__PXCreateSmartAlbumAction_performRedo___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F392F8];
  v3[0] = *(void *)(a1 + 32);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 undeleteSmartAlbumsFromAssetCollection:v2];
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  v5 = [(PXCreateSmartAlbumAction *)self createdAssetCollection];
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__PXCreateSmartAlbumAction_performUndo___block_invoke;
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

void __40__PXCreateSmartAlbumAction_performUndo___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F392F8];
  v3[0] = *(void *)(a1 + 32);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 deleteSmartAlbumsFromAssetCollection:v2];
}

- (void)performAction:(id)a3
{
}

- (id)actionNameLocalizationKey
{
  return @"PXCreateSmartAlbumActionName";
}

- (id)actionIdentifier
{
  return @"CreateSmartAlbum";
}

- (PHAssetCollection)createdAssetCollection
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PXCreateSmartAlbumAction *)self createdCollectionIdentifier];
  createdAssetCollection = self->_createdAssetCollection;
  if (createdAssetCollection) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E4F38EE8];
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

- (PXCreateSmartAlbumAction)initWithTitle:(id)a3 parentCollectionList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 photoLibrary];
  v13.receiver = self;
  v13.super_class = (Class)PXCreateSmartAlbumAction;
  v9 = [(PXPhotosAction *)&v13 initWithPhotoLibrary:v8];

  if (v9)
  {
    uint64_t v10 = [v6 copy];
    title = v9->_title;
    v9->_title = (NSString *)v10;

    objc_storeStrong((id *)&v9->_parentCollectionList, a4);
  }

  return v9;
}

@end