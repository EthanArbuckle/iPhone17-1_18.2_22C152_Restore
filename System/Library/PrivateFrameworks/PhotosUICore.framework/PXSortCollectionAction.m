@interface PXSortCollectionAction
- (PHCollection)collection;
- (PHFetchResult)originalCollectionContent;
- (PXSortCollectionAction)initWithCollection:(id)a3 sortType:(PXSortCollectionActionSortType)a4;
- (PXSortCollectionActionSortType)originalSortType;
- (PXSortCollectionActionSortType)sortType;
- (id)actionIdentifier;
- (void)_performPeopleVirtualCollectionActionWithCompletion:(id)a3;
- (void)performAction:(id)a3;
- (void)performChangeToSortType:(PXSortCollectionActionSortType)a3 completeCallback:(id)a4;
- (void)performUndo:(id)a3;
@end

@implementation PXSortCollectionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalCollectionContent, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

- (PXSortCollectionActionSortType)originalSortType
{
  return self->_originalSortType;
}

- (PHFetchResult)originalCollectionContent
{
  return self->_originalCollectionContent;
}

- (PHCollection)collection
{
  return self->_collection;
}

- (PXSortCollectionActionSortType)sortType
{
  return self->_sortType;
}

- (id)actionIdentifier
{
  return @"SortCollectionAction";
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  [(PXSortCollectionAction *)self performChangeToSortType:[(PXSortCollectionAction *)self originalSortType] completeCallback:v4];
}

- (void)performAction:(id)a3
{
  id v6 = a3;
  id v4 = [(PXSortCollectionAction *)self collection];
  int v5 = objc_msgSend(v4, "px_isPeopleVirtualCollection");

  if (v5) {
    [(PXSortCollectionAction *)self _performPeopleVirtualCollectionActionWithCompletion:v6];
  }
  else {
    [(PXSortCollectionAction *)self performChangeToSortType:[(PXSortCollectionAction *)self sortType] completeCallback:v6];
  }
}

- (void)performChangeToSortType:(PXSortCollectionActionSortType)a3 completeCallback:(id)a4
{
  id v6 = a4;
  v7 = [(PXSortCollectionAction *)self collection];
  v8 = [(PXSortCollectionAction *)self originalCollectionContent];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__PXSortCollectionAction_performChangeToSortType_completeCallback___block_invoke;
  v11[3] = &unk_1E5DC6248;
  unsigned int sortKey = a3.sortKey;
  BOOL ascending = a3.ascending;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(PXPhotosAction *)self performChanges:v11 completionHandler:v6];
}

void __67__PXSortCollectionAction_performChangeToSortType_completeCallback___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) canContainAssets];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = v3;
    BOOL v5 = [v4 assetCollectionType] == 1 && objc_msgSend(v4, "assetCollectionSubtype") == 101;
    if ([v4 assetCollectionType] == 2 && objc_msgSend(v4, "assetCollectionSubtype") == 1000000204)
    {
      id v6 = [MEMORY[0x1E4F392F8] changeRequestForSmartAlbum:v4];
    }
    else
    {
      if (([v4 canPerformEditOperation:5] | v5) != 1)
      {
        v7 = PLUIGetLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v11 = v8;
          _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Failed change sort order for %@", buf, 0xCu);
        }
        goto LABEL_17;
      }
      id v6 = [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:v4];
    }
    v7 = v6;
    [v6 setCustomSortKey:*(unsigned int *)(a1 + 48)];
    [v7 setCustomSortAscending:*(unsigned __int8 *)(a1 + 52)];
LABEL_17:

    return;
  }
  if ([v3 canContainCollections])
  {
    id v9 = [MEMORY[0x1E4F39010] changeRequestForCollectionList:*(void *)(a1 + 32) childCollections:*(void *)(a1 + 40)];
    [v9 setCustomSortKey:*(unsigned int *)(a1 + 48)];
    [v9 setCustomSortAscending:*(unsigned __int8 *)(a1 + 52)];
  }
}

- (void)_performPeopleVirtualCollectionActionWithCompletion:(id)a3
{
  uint64_t v12 = (void (**)(id, uint64_t, void))a3;
  PXSortCollectionActionSortType v4 = [(PXSortCollectionAction *)self sortType];
  BOOL v5 = [(PXPhotosAction *)self photoLibrary];
  unint64_t v6 = +[PXPeopleUtilities currentSortOrderFor:v5];

  if (v4.sortKey == 5) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v6;
  }
  if (v6) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v4.sortKey == 5;
  }
  if (!v8 && (*(void *)&v4 & 0x100000000) == 0) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = 1;
  }
  uint64_t v11 = [(PXPhotosAction *)self photoLibrary];
  +[PXPeopleUtilities setSortOrder:v10 toPhotoLibrary:v11];

  v12[2](v12, 1, 0);
}

- (PXSortCollectionAction)initWithCollection:(id)a3 sortType:(PXSortCollectionActionSortType)a4
{
  id v7 = a3;
  BOOL v8 = [v7 photoLibrary];
  v17.receiver = self;
  v17.super_class = (Class)PXSortCollectionAction;
  id v9 = [(PXPhotosAction *)&v17 initWithPhotoLibrary:v8];

  if (!v9) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v9->_collection, a3);
  v9->_sortType = a4;
  uint64_t v10 = [(PXPhotosAction *)v9 standardFetchOptions];
  if ([v7 canContainAssets])
  {
    uint64_t v11 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v7 options:v10];
LABEL_6:
    originalCollectionContent = v9->_originalCollectionContent;
    v9->_originalCollectionContent = (PHFetchResult *)v11;

    goto LABEL_7;
  }
  if ([v7 canContainCollections])
  {
    uint64_t v11 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v7 options:v10];
    goto LABEL_6;
  }
LABEL_7:
  unsigned int v13 = [v7 customSortKey];
  int v14 = [v7 customSortAscending];
  uint64_t v15 = 0x100000000;
  if (!v14) {
    uint64_t v15 = 0;
  }
  v9->_originalSortType = (PXSortCollectionActionSortType)(v15 | v13);

LABEL_10:
  return v9;
}

@end