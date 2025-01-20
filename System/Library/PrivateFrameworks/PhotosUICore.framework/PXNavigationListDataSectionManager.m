@interface PXNavigationListDataSectionManager
+ (id)makeCollectionsDataSourceManagerForConfiguration:(id)a3;
- (BOOL)allowsEmptyDataSection;
- (BOOL)isChangeProcessingPaused;
- (BOOL)skipAssetCountFetches;
- (NSString)description;
- (PHCollectionList)collectionList;
- (PXNavigationListDataSectionManager)initWithChildDataSectionManagers:(id)a3;
- (PXNavigationListDataSectionManager)initWithCollectionList:(id)a3;
- (PXNavigationListDataSectionManager)initWithConfiguration:(id)a3;
- (PXPhotoKitCollectionsDataSource)collectionsDataSource;
- (PXPhotoKitCollectionsDataSourceManager)collectionsDataSourceManager;
- (id)_changeDetailsForItemAtIndex:(int64_t)a3 childDataSection:(id)a4 expanding:(BOOL)a5;
- (id)auxiliaryObjectForKey:(id)a3 dataSectionObject:(id)a4 hintIndex:(int64_t)a5;
- (id)collectionsDataSourceIfExisting;
- (id)createDataSection;
- (int64_t)indentationLevel;
- (void)_requestParentForListItem:(id)a3 hintIndex:(int64_t)a4 resultHandler:(id)a5 recursionHandler:(id)a6;
- (void)collapseListItem:(id)a3 hintIndex:(int64_t)a4;
- (void)expandListItem:(id)a3 hintIndex:(int64_t)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)pauseBackgroundFetching;
- (void)setAllowsEmptyDataSection:(BOOL)a3;
- (void)setChangeProcessingPaused:(BOOL)a3 forReason:(id)a4;
- (void)setCollectionsDataSource:(id)a3;
- (void)setIndentationLevel:(int64_t)a3;
- (void)startBackgroundFetchingIfNeeded;
@end

@implementation PXNavigationListDataSectionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionsDataSource, 0);
  objc_storeStrong((id *)&self->_collectionsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
  objc_storeStrong((id *)&self->_privacyControllersById, 0);
  objc_storeStrong((id *)&self->_collectionsByPrivacyControllerId, 0);
  objc_storeStrong((id *)&self->_parentListItems, 0);
  objc_storeStrong((id *)&self->_childDataSectionIndexes, 0);
  objc_storeStrong((id *)&self->_childDataSectionManagers, 0);
}

- (BOOL)skipAssetCountFetches
{
  return self->_skipAssetCountFetches;
}

- (void)setCollectionsDataSource:(id)a3
{
}

- (PXPhotoKitCollectionsDataSourceManager)collectionsDataSourceManager
{
  return self->_collectionsDataSourceManager;
}

- (void)setIndentationLevel:(int64_t)a3
{
  self->_indentationLevel = a3;
}

- (int64_t)indentationLevel
{
  return self->_indentationLevel;
}

- (PHCollectionList)collectionList
{
  return self->_collectionList;
}

- (BOOL)allowsEmptyDataSection
{
  return self->_allowsEmptyDataSection;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  v10 = v9;
  if ((void *)ChildDataSectionManagerObservationContext == a5)
  {
    v22 = v9;
    v12 = [(NSMapTable *)self->_parentListItems objectForKey:v9];
    v14 = [(NSMutableDictionary *)self->_childDataSectionIndexes objectForKeyedSubscript:v12];
    if (v14)
    {
      v17 = [v22 changeDetailsFromPreviousDataSection];
      v11 = objc_msgSend(v17, "changeDetailsShiftedBy:", objc_msgSend(v14, "integerValue") + 1);
    }
    else
    {
      v11 = 0;
    }
    [(PXDataSectionManager *)self updateDataSectionWithChangeDetails:v11];
    goto LABEL_13;
  }
  if ((void *)CollectionsDataSourceManagerObservationContext == a5)
  {
    v22 = v9;
    v11 = [(PXNavigationListDataSectionManager *)self collectionsDataSourceIfExisting];
    v12 = [(PXNavigationListDataSectionManager *)self collectionsDataSourceManager];
    v18 = [v12 dataSource];
    [(PXNavigationListDataSectionManager *)self setCollectionsDataSource:v18];

    v19 = [(PXNavigationListDataSectionManager *)self collectionsDataSource];
    v14 = [v12 changeDetailsFromDataSource:v11 toDataSource:v19];

    v15 = [v14 itemChangesInSection:0];
    v16 = [v14 itemsWithSubitemChangesInSection:0];
    v20 = [v15 changeDetailsByAddingChangedIndexes:v16];
    [(PXDataSectionManager *)self updateDataSectionWithChangeDetails:v20];

LABEL_10:
LABEL_13:

    goto LABEL_14;
  }
  if ((void *)PrivacyControllerObservationContext_105181 != a5)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"PXNavigationListDataSectionManager.m" lineNumber:342 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 3) != 0)
  {
    v22 = v9;
    v11 = [v9 identifier];
    v12 = [(NSMutableDictionary *)self->_collectionsByPrivacyControllerId objectForKeyedSubscript:v11];
    if (!v12)
    {
LABEL_14:

      v10 = v22;
      goto LABEL_15;
    }
    v13 = [(PXNavigationListDataSectionManager *)self collectionsDataSource];
    v14 = [v13 indexPathForCollection:v12];

    v15 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v14, "item"));
    v16 = [off_1E5DA5568 changeDetailsWithChangedIndexes:v15];
    [(PXDataSectionManager *)self updateDataSectionWithChangeDetails:v16];
    goto LABEL_10;
  }
LABEL_15:
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; collectionsDataSourceManager = %@>",
                       objc_opt_class(),
                       self,
                       self->_collectionsDataSourceManager);
}

- (void)collapseListItem:(id)a3 hintIndex:(int64_t)a4
{
  id v7 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PXNavigationListDataSectionManager_collapseListItem_hintIndex___block_invoke;
  v11[3] = &unk_1E5DC1C28;
  v11[4] = self;
  id v12 = v7;
  SEL v13 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__PXNavigationListDataSectionManager_collapseListItem_hintIndex___block_invoke_2;
  v9[3] = &unk_1E5DB9FE8;
  id v10 = v12;
  id v8 = v12;
  [(PXNavigationListDataSectionManager *)self _requestParentForListItem:v8 hintIndex:a4 resultHandler:v11 recursionHandler:v9];
}

void __65__PXNavigationListDataSectionManager_collapseListItem_hintIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(*(void *)(a1 + 32) + 144) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v4)
  {
    id v8 = v4;
    [v4 unregisterChangeObserver:*(void *)(a1 + 32) context:ChildDataSectionManagerObservationContext];
    [*(id *)(*(void *)(a1 + 32) + 160) removeObjectForKey:v8];
    [*(id *)(*(void *)(a1 + 32) + 144) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 152) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
    v5 = *(void **)(a1 + 32);
    char v6 = [v8 dataSection];
    id v7 = [v5 _changeDetailsForItemAtIndex:a2 childDataSection:v6 expanding:0];

    [*(id *)(a1 + 32) updateDataSectionWithChangeDetails:v7];
    v4 = v8;
  }
}

uint64_t __65__PXNavigationListDataSectionManager_collapseListItem_hintIndex___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 collapseListItem:*(void *)(a1 + 32) hintIndex:a3];
}

- (void)expandListItem:(id)a3 hintIndex:(int64_t)a4
{
  id v7 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__PXNavigationListDataSectionManager_expandListItem_hintIndex___block_invoke;
  v11[3] = &unk_1E5DC1C28;
  id v12 = v7;
  SEL v13 = self;
  SEL v14 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PXNavigationListDataSectionManager_expandListItem_hintIndex___block_invoke_2;
  v9[3] = &unk_1E5DB9FE8;
  id v10 = v12;
  id v8 = v12;
  [(PXNavigationListDataSectionManager *)self _requestParentForListItem:v8 hintIndex:a4 resultHandler:v11 recursionHandler:v9];
}

void __63__PXNavigationListDataSectionManager_expandListItem_hintIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  id v9 = [*(id *)(a1 + 32) collection];
  v4 = [*(id *)(*(void *)(a1 + 40) + 144) objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (!v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [[PXNavigationListDataSectionManager alloc] initWithCollectionList:v9];
      -[PXNavigationListDataSectionManager setIndentationLevel:](v4, "setIndentationLevel:", [*(id *)(a1 + 40) indentationLevel] + 1);
      v5 = [NSNumber numberWithInteger:a2];
      [*(id *)(*(void *)(a1 + 40) + 152) setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];

      [*(id *)(*(void *)(a1 + 40) + 144) setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
      [*(id *)(*(void *)(a1 + 40) + 160) setObject:*(void *)(a1 + 32) forKey:v4];
      [(PXNavigationListDataSectionManager *)v4 registerChangeObserver:*(void *)(a1 + 40) context:ChildDataSectionManagerObservationContext];
      char v6 = *(void **)(a1 + 40);
      id v7 = [(PXDataSectionManager *)v4 dataSection];
      id v8 = [v6 _changeDetailsForItemAtIndex:a2 childDataSection:v7 expanding:1];

      [*(id *)(a1 + 40) updateDataSectionWithChangeDetails:v8];
    }
    else
    {
      v4 = 0;
    }
  }
}

uint64_t __63__PXNavigationListDataSectionManager_expandListItem_hintIndex___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 expandListItem:*(void *)(a1 + 32) hintIndex:a3];
}

- (void)pauseBackgroundFetching
{
  id v2 = [(PXNavigationListDataSectionManager *)self collectionsDataSourceManager];
  [v2 pauseBackgroundFetching];
}

- (void)startBackgroundFetchingIfNeeded
{
  id v2 = [(PXNavigationListDataSectionManager *)self collectionsDataSourceManager];
  [v2 prepareBackgroundFetchingIfNeeded];
  [v2 startBackgroundFetchingIfNeeded];
}

- (void)setChangeProcessingPaused:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXNavigationListDataSectionManager;
  id v6 = a4;
  [(PXDataSectionManager *)&v8 setChangeProcessingPaused:v4 forReason:v6];
  id v7 = [(PXNavigationListDataSectionManager *)self collectionsDataSourceManager];
  [v7 setChangeProcessingPaused:v4 forReason:v6];
}

- (BOOL)isChangeProcessingPaused
{
  id v2 = [(PXNavigationListDataSectionManager *)self collectionsDataSourceManager];
  char v3 = [v2 isChangeProcessingPaused];

  return v3;
}

- (id)auxiliaryObjectForKey:(id)a3 dataSectionObject:(id)a4 hintIndex:(int64_t)a5
{
  id v8 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__105202;
  v36 = __Block_byref_object_dispose__105203;
  id v37 = 0;
  id v9 = a4;
  id v10 = [v9 collection];
  int v11 = objc_msgSend(v10, "px_allowsKeyAssetDisplay");
  if (([v8 isEqualToString:@"PXNavigationListItemKeyAsset"] & v11) == 1)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __88__PXNavigationListDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke;
    v29[3] = &unk_1E5DB9F98;
    v29[4] = self;
    id v30 = v10;
    v31 = &v32;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __88__PXNavigationListDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke_2;
    v25[3] = &unk_1E5DB9FC0;
    v28 = &v32;
    id v26 = v8;
    id v27 = v9;
    [(PXNavigationListDataSectionManager *)self _requestParentForListItem:v27 hintIndex:a5 resultHandler:v29 recursionHandler:v25];

    id v12 = v30;
LABEL_5:

    goto LABEL_7;
  }
  if (([v8 isEqualToString:@"PXNavigationListItemFolderKeyAssets"] & v11) == 1)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __88__PXNavigationListDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke_3;
    v22[3] = &unk_1E5DB9F98;
    v22[4] = self;
    id v23 = v10;
    v24 = &v32;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __88__PXNavigationListDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke_4;
    v18[3] = &unk_1E5DB9FC0;
    v21 = &v32;
    id v19 = v8;
    id v20 = v9;
    [(PXNavigationListDataSectionManager *)self _requestParentForListItem:v20 hintIndex:a5 resultHandler:v22 recursionHandler:v18];

    id v12 = v23;
    goto LABEL_5;
  }
  v17.receiver = self;
  v17.super_class = (Class)PXNavigationListDataSectionManager;
  uint64_t v13 = [(PXDataSectionManager *)&v17 auxiliaryObjectForKey:v8 dataSectionObject:v9 hintIndex:a5];
  SEL v14 = (void *)v33[5];
  v33[5] = v13;

LABEL_7:
  id v15 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v15;
}

void __88__PXNavigationListDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 208) keyAssetsFetchResultForCollection:a1[5] fetchIfNeeded:0];
  id v4 = [v2 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = v4;
  }
  else {
    char v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v3);
}

void __88__PXNavigationListDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = [a2 auxiliaryObjectForKey:a1[4] dataSectionObject:a1[5] hintIndex:a3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __88__PXNavigationListDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke_3(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 208) displayableAssetsForCollectionList:a1[5] maximumCount:4 useCache:1 correspondingCollections:0];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __88__PXNavigationListDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke_4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = [a2 auxiliaryObjectForKey:a1[4] dataSectionObject:a1[5] hintIndex:a3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)createDataSection
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v4 = self->_childDataSectionManagers;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v63 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        id v10 = [(NSMutableDictionary *)self->_childDataSectionManagers objectForKeyedSubscript:v9];
        int v11 = [v10 dataSection];
        [v3 setObject:v11 forKeyedSubscript:v9];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v6);
  }

  unint64_t v12 = 0x1E4F1C000uLL;
  uint64_t v13 = (NSMutableDictionary *)objc_opt_new();
  v48 = [(PXDataSectionManager *)self dataSectionIfCreated];
  if (v48)
  {
    v49 = v13;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v13 = self->_childDataSectionIndexes;
    uint64_t v14 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v58 objects:v68 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v59 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v58 + 1) + 8 * j);
          id v19 = [(NSMutableDictionary *)self->_childDataSectionIndexes objectForKeyedSubscript:v18];
          uint64_t v20 = [v19 integerValue];

          v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v48, "indexInCollectionsDataSectionOfListItem:hintIndex:", v18, v20));
          [(NSMutableDictionary *)v49 setObject:v21 forKeyedSubscript:v18];
        }
        uint64_t v15 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v58 objects:v68 count:16];
      }
      while (v15);
      unint64_t v12 = 0x1E4F1C000;
    }
  }
  else
  {
    v49 = self->_childDataSectionIndexes;
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v22 = [(NSMutableDictionary *)self->_privacyControllersById allValues];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v55;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v55 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v54 + 1) + 8 * k) unregisterChangeObserver:self context:PrivacyControllerObservationContext_105181];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v24);
  }

  [(NSMutableDictionary *)self->_privacyControllersById removeAllObjects];
  [(NSMutableDictionary *)self->_collectionsByPrivacyControllerId removeAllObjects];
  id v27 = [(PXNavigationListDataSectionManager *)self collectionsDataSource];
  v28 = [v27 allItemsEnumerator];

  v47 = objc_msgSend(*(id *)(v12 + 2656), "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v29 = v28;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v50 objects:v66 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v51;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v51 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v50 + 1) + 8 * v33);
        v35 = +[PXContentPrivacyController privacyControllerForCollection:v34];
        v36 = v35;
        if (v35)
        {
          [v35 registerChangeObserver:self context:PrivacyControllerObservationContext_105181];
          v46 = [v36 identifier];
          [(NSMutableDictionary *)self->_privacyControllersById setObject:v36 forKeyedSubscript:v46];
          [(NSMutableDictionary *)self->_collectionsByPrivacyControllerId setObject:v34 forKeyedSubscript:v46];
          if ([v36 isContentPrivacyEnabled])
          {
            if ([v36 isLocked]) {
              uint64_t v37 = 1;
            }
            else {
              uint64_t v37 = 2;
            }
            v45 = [NSNumber numberWithUnsignedInteger:v37];
            [v47 setObject:v45 forKeyedSubscript:v34];
          }
        }

        ++v33;
      }
      while (v31 != v33);
      uint64_t v38 = [v29 countByEnumeratingWithState:&v50 objects:v66 count:16];
      uint64_t v31 = v38;
    }
    while (v38);
  }

  v39 = [PXCollectionsDataSection alloc];
  v40 = [(PXNavigationListDataSectionManager *)self collectionsDataSource];
  v41 = [(PXDataSectionManager *)self outlineObject];
  v42 = [(PXCollectionsDataSection *)v39 initWithCollectionsDataSource:v40 lockStatePerCollection:v47 outlineObject:v41];

  v43 = [[PXNavigationListDataSection alloc] initWithCollectionsDataSection:v42 indentationLevel:[(PXNavigationListDataSectionManager *)self indentationLevel] childDataSections:v3 childIndexHints:v49 skipAssetCountFetches:[(PXNavigationListDataSectionManager *)self skipAssetCountFetches]];
  return v43;
}

- (void)setAllowsEmptyDataSection:(BOOL)a3
{
  if (self->_allowsEmptyDataSection != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __64__PXNavigationListDataSectionManager_setAllowsEmptyDataSection___block_invoke;
    v3[3] = &unk_1E5DCEB78;
    v3[4] = self;
    BOOL v4 = a3;
    [(PXNavigationListDataSectionManager *)self performChanges:v3];
  }
}

uint64_t __64__PXNavigationListDataSectionManager_setAllowsEmptyDataSection___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 184) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) signalChange:2];
}

- (void)_requestParentForListItem:(id)a3 hintIndex:(int64_t)a4 resultHandler:(id)a5 recursionHandler:(id)a6
{
  id v10 = (void (**)(id, uint64_t))a5;
  int v11 = (void (**)(id, uint64_t, uint64_t))a6;
  id v12 = a3;
  uint64_t v13 = [(PXDataSectionManager *)self dataSection];
  uint64_t v14 = [v13 validatedIndexOfListItem:v12 hintIndex:a4];

  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v15 = [v13 parentOfListItemAtIndex:v14 localIndex:&v18];
  uint64_t v16 = [(NSMutableDictionary *)self->_childDataSectionManagers objectForKeyedSubscript:v15];
  objc_super v17 = (void *)v16;
  if (v15 && v16) {
    v11[2](v11, v16, v18);
  }
  else {
    v10[2](v10, v14);
  }
}

- (id)_changeDetailsForItemAtIndex:(int64_t)a3 childDataSection:(id)a4 expanding:(BOOL)a5
{
  BOOL v5 = a5;
  int64_t v7 = a3 + 1;
  uint64_t v8 = [a4 count];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v7, v8);
  BOOL v10 = !v5;
  if (v5) {
    int v11 = (void *)v9;
  }
  else {
    int v11 = 0;
  }
  if (v10) {
    id v12 = (void *)v9;
  }
  else {
    id v12 = 0;
  }
  uint64_t v13 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
  uint64_t v14 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:v12 insertedIndexes:v11 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v13];

  return v14;
}

- (PXPhotoKitCollectionsDataSource)collectionsDataSource
{
  p_collectionsDataSource = &self->_collectionsDataSource;
  BOOL v4 = self->_collectionsDataSource;
  if (!v4)
  {
    BOOL v4 = [(PXSectionedDataSourceManager *)self->_collectionsDataSourceManager dataSource];
    objc_storeStrong((id *)p_collectionsDataSource, v4);
  }
  return v4;
}

- (id)collectionsDataSourceIfExisting
{
  return self->_collectionsDataSource;
}

- (PXNavigationListDataSectionManager)initWithChildDataSectionManagers:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXNavigationListDataSectionManager.m", 109, @"%s is not available as initializer", "-[PXNavigationListDataSectionManager initWithChildDataSectionManagers:]");

  abort();
}

- (PXNavigationListDataSectionManager)initWithCollectionList:(id)a3
{
  BOOL v4 = +[PXNavigationListDataSectionConfiguration configurationWithCollectionList:a3];
  id v5 = [(PXNavigationListDataSectionManager *)self initWithConfiguration:v4];

  return v5;
}

- (PXNavigationListDataSectionManager)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PXNavigationListDataSectionManager;
  id v5 = [(PXDataSectionManager *)&v23 initWithChildDataSectionManagers:MEMORY[0x1E4F1CBF0]];
  if (v5)
  {
    uint64_t v6 = [v4 collectionList];
    int64_t v7 = PXNavigationListItemWithObject(v6, 0x7FFFFFFFFFFFFFFFLL, 0, 1, 0, 0);
    [(PXDataSectionManager *)v5 setOutlineObject:v7];

    uint64_t v8 = [(id)objc_opt_class() makeCollectionsDataSourceManagerForConfiguration:v4];
    collectionsDataSourceManager = v5->_collectionsDataSourceManager;
    v5->_collectionsDataSourceManager = (PXPhotoKitCollectionsDataSourceManager *)v8;

    uint64_t v10 = objc_opt_new();
    childDataSectionManagers = v5->_childDataSectionManagers;
    v5->_childDataSectionManagers = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    childDataSectionIndexes = v5->_childDataSectionIndexes;
    v5->_childDataSectionIndexes = (NSMutableDictionary *)v12;

    uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    collectionsByPrivacyControllerId = v5->_collectionsByPrivacyControllerId;
    v5->_collectionsByPrivacyControllerId = v14;

    uint64_t v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    privacyControllersById = v5->_privacyControllersById;
    v5->_privacyControllersById = v16;

    uint64_t v18 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    parentListItems = v5->_parentListItems;
    v5->_parentListItems = (NSMapTable *)v18;

    uint64_t v20 = [v4 collectionList];
    collectionList = v5->_collectionList;
    v5->_collectionList = (PHCollectionList *)v20;

    v5->_skipAssetCountFetches = [v4 skipAssetCountFetches];
    [(PXCollectionsDataSourceManager *)v5->_collectionsDataSourceManager registerChangeObserver:v5 context:CollectionsDataSourceManagerObservationContext];
  }

  return v5;
}

+ (id)makeCollectionsDataSourceManagerForConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = [v3 collectionList];
  uint64_t v5 = [v3 collectionsFetchResult];
  uint64_t v6 = (void *)v5;
  if (v4)
  {
    int64_t v7 = [[PXPhotoKitCollectionsDataSourceManagerConfiguration alloc] initWithCollectionList:v4];
LABEL_5:
    uint64_t v8 = v7;
    goto LABEL_6;
  }
  if (v5)
  {
    int64_t v7 = [[PXPhotoKitCollectionsDataSourceManagerConfiguration alloc] initWithCollectionsFetchResult:v5];
    goto LABEL_5;
  }
  uint64_t v8 = 0;
LABEL_6:
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setSkipSyndicatedAssetFetches:](v8, "setSkipSyndicatedAssetFetches:", [v3 skipSyndicatedAssetFetches]);
  if ([v3 emptyCollectionsHidden])
  {
    uint64_t v9 = -3;
  }
  else if ([v3 showSyncedFromMacAlbums])
  {
    uint64_t v9 = 0x200000;
  }
  else
  {
    if (!objc_msgSend(v4, "px_isTopLevelFolder")) {
      goto LABEL_13;
    }
    uint64_t v9 = 4980738;
  }
  [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 setCollectionTypesToInclude:v9];
LABEL_13:
  if ([v3 includeUserSmartAlbums]) {
    [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 setCollectionTypesToInclude:[(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 collectionTypesToInclude] | 0x400000];
  }
  if ([v3 hideHiddenAlbum]) {
    [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 setCollectionTypesToInclude:[(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 collectionTypesToInclude] & 0xFFFFFFFFFFFFFEFFLL];
  }
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setSkipKeyAssetFetches:](v8, "setSkipKeyAssetFetches:", [v3 includeKeyAssetFetches] ^ 1);
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setUpdateKeyAssetFetchesInBackground:](v8, "setUpdateKeyAssetFetchesInBackground:", [v3 includeKeyAssetFetches]);
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setSkipKeyAssetFetchesForSmartAlbums:](v8, "setSkipKeyAssetFetchesForSmartAlbums:", [v3 skipKeyAssetFetchesForSmartAlbums]);
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setSkipAssetFetches:](v8, "setSkipAssetFetches:", [v3 skipAssetFetches]);
  uint64_t v10 = [v3 assetsFilterPredicate];
  [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 setAssetsFilterPredicate:v10];

  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setSimulateNonIncrementalChanges:](v8, "setSimulateNonIncrementalChanges:", [v3 simulateNonIncrementalChanges]);
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setPausedChangeDetailsBufferLength:](v8, "setPausedChangeDetailsBufferLength:", [v3 pausedChangeDetailsBufferLength]);
  int v11 = [[PXPhotoKitCollectionsDataSourceManager alloc] initWithConfiguration:v8];

  return v11;
}

@end