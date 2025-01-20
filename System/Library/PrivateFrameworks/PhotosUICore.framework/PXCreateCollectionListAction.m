@interface PXCreateCollectionListAction
- (NSString)createdCollectionIdentifier;
- (NSString)title;
- (PHCollectionList)createdCollectionList;
- (PHCollectionList)parentCollectionList;
- (PXCreateCollectionListAction)initWithTitle:(id)a3 parentCollectionList:(id)a4 childCollections:(id)a5;
- (PXFastEnumeration)childCollections;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (unint64_t)indexInParentCollectionList;
- (void)performAction:(id)a3;
- (void)performRedo:(id)a3;
- (void)performUndo:(id)a3;
- (void)setCreatedCollectionIdentifier:(id)a3;
@end

@implementation PXCreateCollectionListAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdCollectionIdentifier, 0);
  objc_storeStrong((id *)&self->_childCollections, 0);
  objc_storeStrong((id *)&self->_parentCollectionList, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_createdCollectionList, 0);
}

- (void)setCreatedCollectionIdentifier:(id)a3
{
}

- (NSString)createdCollectionIdentifier
{
  return self->_createdCollectionIdentifier;
}

- (PXFastEnumeration)childCollections
{
  return self->_childCollections;
}

- (unint64_t)indexInParentCollectionList
{
  return self->_indexInParentCollectionList;
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
  v5 = [(PXCreateCollectionListAction *)self createdCollectionList];
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__PXCreateCollectionListAction_performRedo___block_invoke;
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

void __44__PXCreateCollectionListAction_performRedo___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F39010];
  v3[0] = *(void *)(a1 + 32);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 undeleteCollectionLists:v2];
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  v5 = [(PXCreateCollectionListAction *)self createdCollectionList];
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__PXCreateCollectionListAction_performUndo___block_invoke;
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

void __44__PXCreateCollectionListAction_performUndo___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F39010];
  v3[0] = *(void *)(a1 + 32);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 deleteCollectionLists:v2];
}

- (void)performAction:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __46__PXCreateCollectionListAction_performAction___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

void __46__PXCreateCollectionListAction_performAction___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F39010];
  v3 = [*(id *)(a1 + 32) title];
  id v4 = [v2 creationRequestForCollectionListWithTitle:v3];

  v5 = [v4 placeholderForCreatedCollectionList];
  v6 = [v5 localIdentifier];
  [*(id *)(a1 + 32) setCreatedCollectionIdentifier:v6];

  uint64_t v7 = [*(id *)(a1 + 32) indexInParentCollectionList];
  id v8 = *(void **)(a1 + 32);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = [v8 parentCollectionList];
    v10 = +[PXPhotoKitCollectionsDataSourceManager standardDataSourceManagerForCollectionList:v9];

    v11 = [v10 collectionsFetchResult];
    uint64_t v12 = [v10 indexOfFirstReorderableCollection];
    v13 = (void *)MEMORY[0x1E4F39010];
    v14 = [*(id *)(a1 + 32) parentCollectionList];
    v15 = [v13 changeRequestForCollectionList:v14 childCollections:v11];

    v21[0] = v5;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    v17 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v12];
    [v15 insertChildCollections:v16 atIndexes:v17];
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F39010];
    v19 = [v8 parentCollectionList];
    v10 = [v18 changeRequestForCollectionList:v19];

    v20 = v5;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    v15 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v7];
    [v10 insertChildCollections:v11 atIndexes:v15];
  }
}

- (id)actionNameLocalizationKey
{
  return @"PXCreateFolderActionName";
}

- (id)actionIdentifier
{
  return @"CreateCollectionList";
}

- (PHCollectionList)createdCollectionList
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PXCreateCollectionListAction *)self createdCollectionIdentifier];
  createdCollectionList = self->_createdCollectionList;
  if (createdCollectionList) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E4F39008];
    v14[0] = v3;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v8 = [(PXPhotosAction *)self standardFetchOptions];
    v9 = [v6 fetchCollectionListsWithLocalIdentifiers:v7 options:v8];
    v10 = [v9 firstObject];
    v11 = self->_createdCollectionList;
    self->_createdCollectionList = v10;

    createdCollectionList = self->_createdCollectionList;
  }
  uint64_t v12 = createdCollectionList;

  return v12;
}

- (PXCreateCollectionListAction)initWithTitle:(id)a3 parentCollectionList:(id)a4 childCollections:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 photoLibrary];
  v16.receiver = self;
  v16.super_class = (Class)PXCreateCollectionListAction;
  uint64_t v12 = [(PXPhotosAction *)&v16 initWithPhotoLibrary:v11];

  if (v12)
  {
    uint64_t v13 = [v8 copy];
    title = v12->_title;
    v12->_title = (NSString *)v13;

    objc_storeStrong((id *)&v12->_parentCollectionList, a4);
    v12->_indexInParentCollectionList = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v12->_childCollections, a5);
  }

  return v12;
}

@end