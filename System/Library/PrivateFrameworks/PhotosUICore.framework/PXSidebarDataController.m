@interface PXSidebarDataController
+ (id)allDuplicatesDataSectionManagerForLibrary:(id)a3 context:(id)a4;
+ (id)collectionsDataSectionManagerForLibrary:(id)a3 mediaTypesItemManager:(id)a4 context:(id)a5;
+ (id)dataSectionManagerForCollection:(id)a3 context:(id)a4;
+ (id)dataSectionManagerForCollection:(id)a3 context:(id)a4 enablementItem:(int64_t)a5;
+ (id)dataSectionManagerForTransientCollection:(id)a3 context:(id)a4;
+ (id)dataSectionManagerForUtilityCollectionType:(unsigned __int16)a3 photoLibrary:(id)a4 context:(id)a5;
+ (id)devicesDataSectionManagerForLibrary:(id)a3;
+ (id)favoritesDataSectionManagerForLibrary:(id)a3 context:(id)a4;
+ (id)hiddenDataSectionManagerForLibrary:(id)a3 context:(id)a4;
+ (id)libraryDataSectionManagerForLibrary:(id)a3 context:(id)a4;
+ (id)recentlySavedDataSectionManagerForLibrary:(id)a3 context:(id)a4;
+ (id)recoveredDataSectionManagerForLibrary:(id)a3 context:(id)a4;
+ (id)sharedLibrarySuggestionsDataSectionManagerForLibrary:(id)a3 context:(id)a4;
+ (id)sharingDataSectionManagerForLibrary:(id)a3 context:(id)a4;
+ (id)trashDataSectionManagerForLibrary:(id)a3 context:(id)a4;
+ (id)unableToUploadDataSectionManagerForLibrary:(id)a3 context:(id)a4;
+ (id)utilitiesDataSectionManagerForLibrary:(id)a3 context:(id)a4;
- (BOOL)isChangeProcessingPaused;
- (BOOL)isItemExpanded:(id)a3;
- (BOOL)moveGroupItem:(id)a3 afterGroupItem:(id)a4;
- (NSMapTable)requestDetailsBySidebarImageRequestID;
- (NSPredicate)assetsFilterPredicate;
- (PHAssetCollection)pickerAllPhotosVirtualCollection;
- (PHPhotoLibrary)photoLibrary;
- (PXDataSectionManager)mediaTypesSectionManager;
- (PXLibraryFilterState)libraryFilterState;
- (PXNavigationListItemDataSectionManager)mediaTypesItemManager;
- (PXPhotoLibraryLocalDefaults)localDefaults;
- (PXSidebarDataContext)context;
- (PXSidebarDataController)init;
- (PXSidebarDataController)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4 sectionEnablementProvider:(id)a5;
- (PXSidebarDataController)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4 sectionEnablementProvider:(id)a5 options:(unint64_t)a6 additionalAssetsFilterPredicate:(id)a7 pickerAllPhotosVirtualCollection:(id)a8;
- (PXSidebarDataSourceControllerDelegate)delegate;
- (id)_childDataSectionManagerForListItem:(id)a3;
- (id)beginRequestForMediaProvider:(id)a3 mediaRequestIDs:(id)a4;
- (id)child:(int64_t)a3 ofItem:(id)a4;
- (id)childDataSectionForItem:(id)a3;
- (id)childrenOfListItem:(id)a3;
- (id)dataSectionManagerForItem:(id)a3;
- (id)fetchCollectionsInDisplayCollectionList:(id)a3;
- (id)infoForItem:(id)a3 childIndex:(int64_t)a4;
- (id)itemForIdentifier:(id)a3;
- (id)makeSectionManagers;
- (id)outlineDataSectionManager:(id)a3 arrangedSectionContent:(id)a4;
- (int64_t)numberOfChildrenOfItem:(id)a3;
- (int64_t)requestImageForItem:(id)a3 parentItem:(id)a4 completion:(id)a5;
- (unint64_t)options;
- (void)_removeDataSectionManagerForKey:(id)a3;
- (void)_setDataSectionManager:(id)a3 forKey:(id)a4;
- (void)_updateDataSectionForRemovedItems:(id)a3;
- (void)_updateMediaTypesItemManager;
- (void)cancelImageRequest:(int64_t)a3;
- (void)cancelRequestDetails:(id)a3;
- (void)didNavigateToListItem:(id)a3;
- (void)markListItemAsRead:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setChangeProcessingPaused:(BOOL)a3 forReason:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3 forItem:(id)a4;
- (void)setRequestDetailsBySidebarImageRequestID:(id)a3;
@end

@implementation PXSidebarDataController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_requestDetailsBySidebarImageRequestID, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pickerAllPhotosVirtualCollection, 0);
  objc_storeStrong((id *)&self->_assetsFilterPredicate, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_mediaTypesItemManager, 0);
  objc_storeStrong((id *)&self->_mediaTypesSectionManager, 0);
  objc_storeStrong((id *)&self->_arrangedObjectIdentifiers, 0);
  objc_storeStrong((id *)&self->_dataSectionObjects, 0);
  objc_storeStrong((id *)&self->_dataSectionManagers, 0);
  objc_storeStrong((id *)&self->_rootDataSectionManager, 0);
}

- (PXSidebarDataContext)context
{
  return self->_context;
}

- (void)setRequestDetailsBySidebarImageRequestID:(id)a3
{
}

- (NSMapTable)requestDetailsBySidebarImageRequestID
{
  return self->_requestDetailsBySidebarImageRequestID;
}

- (PXPhotoLibraryLocalDefaults)localDefaults
{
  return self->_localDefaults;
}

- (void)setDelegate:(id)a3
{
}

- (PXSidebarDataSourceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSidebarDataSourceControllerDelegate *)WeakRetained;
}

- (PHAssetCollection)pickerAllPhotosVirtualCollection
{
  return self->_pickerAllPhotosVirtualCollection;
}

- (NSPredicate)assetsFilterPredicate
{
  return self->_assetsFilterPredicate;
}

- (unint64_t)options
{
  return self->_options;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v7 = (PXDataSectionManager *)a3;
  if ((void *)PXDataSectionManagerChangeContext == a5)
  {
    v14 = v7;
    v8 = [(PXDataSectionManager *)v7 outlineObject];
    v9 = [(PXDataSectionManager *)v14 previousDataSection];
    v10 = [(PXDataSectionManager *)v14 changeDetailsFromPreviousDataSection];
    v11 = [[PXSidebarItemChangeDetails alloc] initWithArrayChangeDetails:v10 previousDataSection:v9];
    v12 = [(PXSidebarItemChangeDetails *)v11 removedItems];
    [(PXSidebarDataController *)self _updateDataSectionForRemovedItems:v12];

    v13 = [(PXSidebarDataController *)self delegate];
    [v13 sidebarDataSourceController:self didChangeChildrenOfItem:v8 changeDetails:v11];

    if (self->_mediaTypesSectionManager == v14) {
      [(PXSidebarDataController *)self _updateMediaTypesItemManager];
    }

    v7 = v14;
  }
}

- (id)outlineDataSectionManager:(id)a3 arrangedSectionContent:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v15 = [v14 identifier];
        [v8 setObject:v14 forKeyedSubscript:v15];
        [v7 addObject:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v11);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  location = (id *)&self->_arrangedObjectIdentifiers;
  v16 = self->_arrangedObjectIdentifiers;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v29;
    while (2)
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        uint64_t v22 = [v8 objectForKeyedSubscript:v21];
        if (!v22)
        {
          [v6 removeAllObjects];
          goto LABEL_18;
        }
        v23 = (void *)v22;
        [v6 addObject:v22];
        [v8 setObject:0 forKeyedSubscript:v21];
      }
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  if (!*location || [v8 count]) {
    objc_storeStrong(location, v7);
  }
  if ([v6 count]) {
    v24 = v6;
  }
  else {
    v24 = v9;
  }
  id v25 = v24;

  return v25;
}

- (id)fetchCollectionsInDisplayCollectionList:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "px_isUtilitiesFolder"))
  {
    id v5 = objc_opt_class();
    v6 = [(PXSidebarDataController *)self photoLibrary];
    id v7 = [(PXSidebarDataController *)self context];
    v8 = [v5 utilitiesDataSectionManagerForLibrary:v6 context:v7];
    id v9 = [v8 dataSection];

LABEL_5:
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v4;
    uint64_t v10 = [v7 photoLibrary];
    v6 = [v10 librarySpecificFetchOptions];

    [v6 setIncludeUserSmartAlbums:1];
    id v9 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v7 options:v6];
    goto LABEL_5;
  }
  id v9 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:

  return v9;
}

- (BOOL)isItemExpanded:(id)a3
{
  id v4 = a3;
  if ([v4 isExpandable])
  {
    int v5 = [v4 isGroup];
    v6 = [(PXSidebarDataController *)self localDefaults];
    id v7 = v6;
    if (v5)
    {
      v8 = [v6 identifiersForKey:@"CollapsedSidebarSectionIdentifiers"];
      id v9 = [v4 identifier];
      int v10 = [v8 containsObject:v9] ^ 1;
    }
    else
    {
      v8 = [v6 identifiersForKey:@"ExpandedSidebarItemIdentifiers"];
      id v9 = [v4 identifier];
      LOBYTE(v10) = [v8 containsObject:v9];
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)dataSectionManagerForItem:(id)a3
{
  dataSectionManagers = self->_dataSectionManagers;
  id v4 = [a3 identifier];
  int v5 = [(NSMutableDictionary *)dataSectionManagers objectForKeyedSubscript:v4];

  return v5;
}

- (id)childDataSectionForItem:(id)a3
{
  if (a3)
  {
    -[PXSidebarDataController _childDataSectionManagerForListItem:](self, "_childDataSectionManagerForListItem:");
    v3 = (PXOutlineDataSectionManager *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_rootDataSectionManager;
  }
  id v4 = v3;
  int v5 = [(PXDataSectionManager *)v3 dataSection];

  return v5;
}

- (void)cancelImageRequest:(int64_t)a3
{
  requestDetailsBySidebarImageRequestID = self->_requestDetailsBySidebarImageRequestID;
  int v5 = [NSNumber numberWithInteger:a3];
  id v7 = [(NSMapTable *)requestDetailsBySidebarImageRequestID objectForKey:v5];

  v6 = v7;
  if (v7)
  {
    [(PXSidebarDataController *)self cancelRequestDetails:v7];
    v6 = v7;
  }
}

- (int64_t)requestImageForItem:(id)a3 parentItem:(id)a4 completion:(id)a5
{
  return 0;
}

- (id)infoForItem:(id)a3 childIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PXSidebarDataController *)self childDataSectionForItem:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    int64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v9 = [v8 indexOfChildDataSourceForObjectAtIndex:a4 localIndex:&v14];
    id v7 = v8;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = v9;
      uint64_t v11 = [v8 childDataSections];
      id v7 = [v11 objectAtIndexedSubscript:v10];

      a4 = v14;
    }
  }
  uint64_t v12 = [[PXSidebarItemChildInfo alloc] initWithListItem:v6 dataSection:v7 childIndex:a4];

  return v12;
}

- (void)markListItemAsRead:(id)a3
{
  id v5 = [a3 collection];
  if (objc_msgSend(v5, "px_isSharedLibrarySharingSuggestionsSmartAlbum"))
  {
    v3 = [v5 photoLibrary];
    id v4 = objc_msgSend(v3, "px_sharedLibrarySharingSuggestionsCountsManager");
    [v4 markAllSuggestionsAsRead];
  }
}

- (void)didNavigateToListItem:(id)a3
{
  id v5 = [a3 collection];
  if (objc_msgSend(v5, "px_isSharedLibrarySharingSuggestionsSmartAlbum"))
  {
    v3 = [v5 photoLibrary];
    id v4 = objc_msgSend(v3, "px_sharedLibrarySharingSuggestionsCountsManager");
    [v4 markAnyNotificationsAsRead];
  }
}

- (void)setExpanded:(BOOL)a3 forItem:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  int v6 = [v10 isGroup];
  id v7 = [(PXSidebarDataController *)self localDefaults];
  id v8 = [v10 identifier];
  if (v6)
  {
    uint64_t v9 = @"CollapsedSidebarSectionIdentifiers";
    if (v4)
    {
LABEL_3:
      [v7 removeIdentifier:v8 forKey:v9];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v9 = @"ExpandedSidebarItemIdentifiers";
    if (!v4) {
      goto LABEL_3;
    }
  }
  [v7 addIdentifier:v8 forKey:v9];
LABEL_6:
}

- (BOOL)moveGroupItem:(id)a3 afterGroupItem:(id)a4
{
  id v6 = a4;
  arrangedObjectIdentifiers = self->_arrangedObjectIdentifiers;
  id v8 = [a3 identifier];
  [(NSArray *)arrangedObjectIdentifiers indexOfObject:v8];

  if (v6)
  {
    uint64_t v9 = self->_arrangedObjectIdentifiers;
    id v10 = [v6 identifier];
    [(NSArray *)v9 indexOfObject:v10];
  }
  PXArrayByMovingObjectFromIndexToIndex();
}

- (id)itemForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_dataSectionObjects objectForKeyedSubscript:a3];
}

- (id)childrenOfListItem:(id)a3
{
  BOOL v4 = [(PXSidebarDataController *)self childDataSectionForItem:a3];
  uint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:v5];
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v9 = [v4 objectAtIndex:i];
      id v10 = [v9 identifier];
      if (v10)
      {
        [(NSMutableDictionary *)self->_dataSectionObjects setObject:v9 forKeyedSubscript:v10];
        uint64_t v11 = [(NSMutableDictionary *)self->_dataSectionManagers objectForKeyedSubscript:v10];
        [v11 setOutlineObject:v9];
      }
      [v7 addObject:v9];
    }
    if (v6 != [v7 count]) {
      PXAssertGetLog();
    }
    uint64_t v12 = [v7 array];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)child:(int64_t)a3 ofItem:(id)a4
{
  uint64_t v6 = [(PXSidebarDataController *)self childDataSectionForItem:a4];
  id v7 = [v6 objectAtIndex:a3];
  id v8 = [v7 identifier];
  if (v8)
  {
    [(NSMutableDictionary *)self->_dataSectionObjects setObject:v7 forKeyedSubscript:v8];
    uint64_t v9 = [(NSMutableDictionary *)self->_dataSectionManagers objectForKeyedSubscript:v8];
    [v9 setOutlineObject:v7];
  }
  return v7;
}

- (int64_t)numberOfChildrenOfItem:(id)a3
{
  v3 = [(PXSidebarDataController *)self childDataSectionForItem:a3];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)_childDataSectionManagerForListItem:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [(NSMutableDictionary *)self->_dataSectionManagers objectForKeyedSubscript:v5];
  if (!v6)
  {
    if (![v4 isExpandable]
      || ([(PXOutlineDataSectionManager *)self->_rootDataSectionManager childDataSectionManagerForOutlineObject:v4], uint64_t v6 = (PXStackedDataSectionManager *)objc_claimAutoreleasedReturnValue(), [(PXSidebarDataController *)self _setDataSectionManager:v6 forKey:v5], !v6))
    {
      id v7 = [v4 collection];
      if (!objc_msgSend(v7, "px_isSharedAlbumsAndActivityFolder")) {
        goto LABEL_21;
      }
      id v8 = [PXNavigationListItemDataSectionManager alloc];
      uint64_t v9 = [(PXSidebarDataController *)self photoLibrary];
      id v10 = objc_msgSend(v9, "px_virtualCollections");
      uint64_t v11 = [v10 sharedActivityCollection];
      uint64_t v12 = [(PXSidebarDataController *)self context];
      v13 = [(PXNavigationListItemDataSectionManager *)v8 initWithCollection:v11 context:v12];

      int64_t v14 = [(PXSidebarDataController *)self photoLibrary];
      v15 = objc_msgSend(v14, "px_virtualCollections");
      v16 = [v15 sharedAlbumsCollectionList];

      uint64_t v17 = +[PXNavigationListDataSectionConfiguration configurationWithCollectionList:v16];
      [v17 setIncludeKeyAssetFetches:1];
      [v17 setSkipAssetFetches:1];
      [v17 setSkipAssetCountFetches:1];
      uint64_t v18 = [(PXSidebarDataController *)self assetsFilterPredicate];
      [v17 setAssetsFilterPredicate:v18];

      uint64_t v19 = [[PXNavigationListDataSectionManager alloc] initWithConfiguration:v17];
      [(PXNavigationListDataSectionManager *)v19 startBackgroundFetchingIfNeeded];
      v20 = [PXStackedDataSectionManager alloc];
      v42[0] = v13;
      v42[1] = v19;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
      uint64_t v6 = [(PXStackedDataSectionManager *)v20 initWithChildDataSectionManagers:v21];

      [(PXStackedDataSectionManager *)v6 setOutlineObject:v4];
      if (!v6)
      {
LABEL_21:
        if (!objc_msgSend(v7, "px_isUtilitiesFolder")) {
          goto LABEL_8;
        }
        uint64_t v22 = objc_opt_class();
        v23 = [(PXSidebarDataController *)self photoLibrary];
        v24 = [(PXSidebarDataController *)self context];
        uint64_t v6 = [v22 utilitiesDataSectionManagerForLibrary:v23 context:v24];

        [(PXStackedDataSectionManager *)v6 setOutlineObject:v4];
        if (!v6)
        {
LABEL_8:
          if (![v7 canContainCollections])
          {
            uint64_t v6 = 0;
            goto LABEL_15;
          }
          if (objc_msgSend(v7, "px_isProjectsFolder"))
          {
            id v25 = [(PXSidebarDataController *)self libraryFilterState];
            uint64_t v26 = [v25 viewMode];

            if (v26)
            {
              v27 = (void *)MEMORY[0x1E4F39008];
              long long v28 = [v7 localizedTitle];
              long long v29 = [(PXSidebarDataController *)self photoLibrary];
              uint64_t v30 = [v27 transientCollectionListWithCollections:MEMORY[0x1E4F1CBF0] title:v28 identifier:0 photoLibrary:v29];

              id v7 = (void *)v30;
            }
          }
          long long v31 = +[PXNavigationListDataSectionConfiguration configurationWithCollectionList:v7];
          uint64_t v32 = objc_msgSend(v7, "px_isMediaTypesFolder") ^ 1;
          long long v33 = [(PXSidebarDataController *)self assetsFilterPredicate];
          [v31 setAssetsFilterPredicate:v33];

          objc_msgSend(v31, "setEmptyCollectionsHidden:", -[PXSidebarDataController options](self, "options") & 1);
          [v31 setIncludeKeyAssetFetches:v32];
          [v31 setIncludeUserSmartAlbums:1];
          objc_msgSend(v31, "setEmptyCollectionsHidden:", objc_msgSend(v7, "px_isMediaTypesFolder"));
          [v31 setSkipKeyAssetFetchesForSmartAlbums:1];
          [v31 setSkipAssetFetches:1];
          [v31 setSkipAssetCountFetches:1];
          long long v34 = [[PXNavigationListDataSectionManager alloc] initWithConfiguration:v31];
          [(PXDataSectionManager *)v34 setOutlineObject:v4];
          long long v35 = +[PXPreloadScheduler sharedScheduler];
          uint64_t v37 = MEMORY[0x1E4F143A8];
          uint64_t v38 = 3221225472;
          v39 = __63__PXSidebarDataController__childDataSectionManagerForListItem___block_invoke;
          v40 = &unk_1E5DD36F8;
          uint64_t v6 = v34;
          v41 = v6;
          [v35 scheduleTaskAfterCATransactionCommits:&v37];

          if (!v6) {
            goto LABEL_15;
          }
        }
      }
      -[PXSidebarDataController _setDataSectionManager:forKey:](self, "_setDataSectionManager:forKey:", v6, v5, v37, v38, v39, v40);
LABEL_15:
    }
  }

  return v6;
}

uint64_t __63__PXSidebarDataController__childDataSectionManagerForListItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startBackgroundFetchingIfNeeded];
}

- (void)_updateMediaTypesItemManager
{
  v3 = PLSidebarGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PXSidebarDataController._updateMediaTypesItemManager", "", buf, 2u);
  }

  id v7 = self->_mediaTypesItemManager;
  if (v7)
  {
    id v8 = [(PXSidebarDataController *)self mediaTypesSectionManager];
    if ([v8 allowsEmptyDataSection]) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = [v8 isDataSectionEmpty] ^ 1;
    }
    [(PXNavigationListItemDataSectionManager *)v7 setEnabled:v9];
  }
  id v10 = v6;
  uint64_t v11 = v10;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_END, v4, "PXSidebarDataController._updateMediaTypesItemManager", "", v12, 2u);
  }
}

- (void)_updateDataSectionForRemovedItems:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) identifier];
        if (([v9 isEqualToString:@"PXMediaTypesVirtualCollection"] & 1) == 0)
        {
          [(PXSidebarDataController *)self _removeDataSectionManagerForKey:v9];
          [(NSMutableDictionary *)self->_dataSectionObjects removeObjectForKey:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_removeDataSectionManagerForKey:(id)a3
{
  id v5 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSectionManagers, "objectForKeyedSubscript:");
  if (v4)
  {
    [(NSMutableDictionary *)self->_dataSectionManagers setObject:0 forKeyedSubscript:v5];
    [v4 unregisterChangeObserver:self context:PXDataSectionManagerChangeContext];
  }
}

- (void)_setDataSectionManager:(id)a3 forKey:(id)a4
{
  dataSectionManagers = self->_dataSectionManagers;
  id v7 = a3;
  [(NSMutableDictionary *)dataSectionManagers setObject:v7 forKeyedSubscript:a4];
  [v7 registerChangeObserver:self context:PXDataSectionManagerChangeContext];
}

- (void)cancelRequestDetails:(id)a3
{
  requestDetailsBySidebarImageRequestID = self->_requestDetailsBySidebarImageRequestID;
  id v4 = NSNumber;
  id v6 = a3;
  id v5 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v6, "sidebarRequestID"));
  [(NSMapTable *)requestDetailsBySidebarImageRequestID removeObjectForKey:v5];

  [v6 cancel];
}

- (id)beginRequestForMediaProvider:(id)a3 mediaRequestIDs:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[PXSidebarImageRequestDetails alloc] initWithMediaProvider:v7 mediaRequestIDs:v6];

  requestDetailsBySidebarImageRequestID = self->_requestDetailsBySidebarImageRequestID;
  long long v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[PXSidebarImageRequestDetails sidebarRequestID](v8, "sidebarRequestID"));
  [(NSMapTable *)requestDetailsBySidebarImageRequestID setObject:v8 forKey:v10];

  return v8;
}

- (void)setChangeProcessingPaused:(BOOL)a3 forReason:(id)a4
{
}

- (BOOL)isChangeProcessingPaused
{
  return [(PXDataSectionManager *)self->_rootDataSectionManager isChangeProcessingPaused];
}

- (PXSidebarDataController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithPhotoLibrary_);
  [v4 handleFailureInMethod:a2, self, @"PXSidebarDataController.m", 335, @"Use the designated initializer %@", v5 object file lineNumber description];

  return 0;
}

- (id)makeSectionManagers
{
  v3 = [(PXSidebarDataController *)self photoLibrary];
  id v4 = [(PXSidebarDataController *)self context];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  id v6 = [(id)objc_opt_class() libraryDataSectionManagerForLibrary:v3 context:v4];
  [v5 addObject:v6];

  id v7 = [(id)objc_opt_class() devicesDataSectionManagerForLibrary:v3];
  [v5 addObject:v7];

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(PXSidebarDataController *)self mediaTypesItemManager];
  long long v10 = [v8 collectionsDataSectionManagerForLibrary:v3 mediaTypesItemManager:v9 context:v4];
  [v5 addObject:v10];

  long long v11 = [(id)objc_opt_class() sharingDataSectionManagerForLibrary:v3 context:v4];
  [v5 addObject:v11];

  long long v12 = (void *)[v5 copy];
  return v12;
}

- (PXNavigationListItemDataSectionManager)mediaTypesItemManager
{
  p_mediaTypesItemManager = &self->_mediaTypesItemManager;
  id v4 = self->_mediaTypesItemManager;
  if (!v4)
  {
    id v5 = PLSidebarGetLog();
    os_signpost_id_t v6 = os_signpost_id_generate(v5);
    id v7 = v5;
    uint64_t v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PXSidebarDataController.mediaTypesItemManager", "", buf, 2u);
    }

    uint64_t v9 = objc_opt_class();
    long long v10 = [(PXSidebarDataController *)self photoLibrary];
    long long v11 = objc_msgSend(v10, "px_virtualCollections");
    long long v12 = [v11 mediaTypesCollectionList];
    long long v13 = [(PXSidebarDataController *)self context];
    id v4 = [v9 dataSectionManagerForCollection:v12 context:v13];

    objc_storeStrong((id *)p_mediaTypesItemManager, v4);
    int64_t v14 = v8;
    uint64_t v15 = v14;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_END, v6, "PXSidebarDataController.mediaTypesItemManager", "", v17, 2u);
    }

    [(PXSidebarDataController *)self _updateMediaTypesItemManager];
  }
  return v4;
}

- (PXDataSectionManager)mediaTypesSectionManager
{
  p_mediaTypesSectionManager = &self->_mediaTypesSectionManager;
  id v4 = self->_mediaTypesSectionManager;
  if (!v4)
  {
    id v5 = PLSidebarGetLog();
    os_signpost_id_t v6 = os_signpost_id_generate(v5);
    id v7 = v5;
    uint64_t v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PXSidebarDataController.mediaTypesSectionManager", "", buf, 2u);
    }

    uint64_t v9 = [(PXSidebarDataController *)self photoLibrary];
    long long v10 = objc_msgSend(v9, "px_virtualCollections");
    long long v11 = [v10 mediaTypesCollectionList];
    long long v12 = PXNavigationListItemWithObject(v11, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0, 0);

    id v4 = [(PXSidebarDataController *)self _childDataSectionManagerForListItem:v12];
    objc_storeStrong((id *)p_mediaTypesSectionManager, v4);
    long long v13 = v8;
    int64_t v14 = v13;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)v16 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_END, v6, "PXSidebarDataController.mediaTypesSectionManager", "", v16, 2u);
    }
  }
  return v4;
}

- (PXSidebarDataController)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4 sectionEnablementProvider:(id)a5 options:(unint64_t)a6 additionalAssetsFilterPredicate:(id)a7 pickerAllPhotosVirtualCollection:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v30 = a8;
  v31.receiver = self;
  v31.super_class = (Class)PXSidebarDataController;
  uint64_t v19 = [(PXSidebarDataController *)&v31 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_photoLibrary, a3);
    objc_storeStrong((id *)&v20->_libraryFilterState, a4);
    v20->_options = a6;
    objc_storeStrong((id *)&v20->_assetsFilterPredicate, a7);
    objc_storeStrong((id *)&v20->_pickerAllPhotosVirtualCollection, a8);
    uint64_t v21 = objc_msgSend(v15, "px_localDefaults");
    localDefaults = v20->_localDefaults;
    v20->_localDefaults = (PXPhotoLibraryLocalDefaults *)v21;

    uint64_t v23 = objc_opt_new();
    dataSectionManagers = v20->_dataSectionManagers;
    v20->_dataSectionManagers = (NSMutableDictionary *)v23;

    uint64_t v25 = objc_opt_new();
    dataSectionObjects = v20->_dataSectionObjects;
    v20->_dataSectionObjects = (NSMutableDictionary *)v25;

    uint64_t v27 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    requestDetailsBySidebarImageRequestID = v20->_requestDetailsBySidebarImageRequestID;
    v20->_requestDetailsBySidebarImageRequestID = (NSMapTable *)v27;

    [(PXPhotoLibraryLocalDefaults *)v20->_localDefaults arrayForKey:@"ArrangedSidebarSectionIdentifiers"];
    objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    PXFilterArrayForObjectsOfClass();
  }

  return 0;
}

- (PXSidebarDataController)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4 sectionEnablementProvider:(id)a5
{
  return [(PXSidebarDataController *)self initWithPhotoLibrary:a3 libraryFilterState:a4 sectionEnablementProvider:a5 options:0 additionalAssetsFilterPredicate:0 pickerAllPhotosVirtualCollection:0];
}

+ (id)devicesDataSectionManagerForLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [[PXImportSourceDataSectionManager alloc] initWithPhotoLibrary:v3];

  id v5 = [[PXNavigationListGroupItem alloc] initWithIdentifier:@"PXNavigationListGroupItemTypeDevices"];
  [(PXDataSectionManager *)v4 setOutlineObject:v5];

  return v4;
}

+ (id)utilitiesDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  v32[14] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v26 = objc_msgSend(v7, "px_virtualCollections");
  objc_super v31 = [a1 unableToUploadDataSectionManagerForLibrary:v7 context:v6];
  v32[0] = v31;
  id v30 = [a1 hiddenDataSectionManagerForLibrary:v7 context:v6];
  v32[1] = v30;
  long long v29 = [a1 trashDataSectionManagerForLibrary:v7 context:v6];
  v32[2] = v29;
  long long v28 = [a1 recoveredDataSectionManagerForLibrary:v7 context:v6];
  v32[3] = v28;
  uint64_t v27 = [a1 allDuplicatesDataSectionManagerForLibrary:v7 context:v6];
  v32[4] = v27;
  uint64_t v25 = [a1 dataSectionManagerForUtilityCollectionType:2 photoLibrary:v7 context:v6];
  v32[5] = v25;
  v24 = [a1 dataSectionManagerForUtilityCollectionType:4 photoLibrary:v7 context:v6];
  v32[6] = v24;
  uint64_t v23 = [a1 dataSectionManagerForUtilityCollectionType:3 photoLibrary:v7 context:v6];
  v32[7] = v23;
  uint64_t v22 = [a1 recentlySavedDataSectionManagerForLibrary:v7 context:v6];
  v32[8] = v22;
  uint64_t v21 = [v26 recentlyViewedCollection];
  uint64_t v8 = [a1 dataSectionManagerForTransientCollection:v21 context:v6];
  v32[9] = v8;
  uint64_t v9 = [v26 recentlyEditedCollection];
  long long v10 = [a1 dataSectionManagerForTransientCollection:v9 context:v6];
  v32[10] = v10;
  long long v11 = [v26 recentlySharedCollection];
  long long v12 = [a1 dataSectionManagerForTransientCollection:v11 context:v6];
  v32[11] = v12;
  long long v13 = [a1 dataSectionManagerForUtilityCollectionType:1 photoLibrary:v7 context:v6];
  v32[12] = v13;
  int64_t v14 = objc_msgSend(v7, "px_virtualCollections");

  id v15 = [v14 importHistoryCollection];
  id v16 = [a1 dataSectionManagerForCollection:v15 context:v6];

  v32[13] = v16;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:14];

  id v18 = [[PXStackedDataSectionManager alloc] initWithChildDataSectionManagers:v17];
  uint64_t v19 = [[PXNavigationListGroupItem alloc] initWithIdentifier:@"PXNavigationListGroupItemTypeOtherAlbums"];
  [(PXStackedDataSectionManager *)v18 setOutlineObject:v19];

  return v18;
}

+ (id)collectionsDataSectionManagerForLibrary:(id)a3 mediaTypesItemManager:(id)a4 context:(id)a5
{
  v35[10] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v25 = a4;
  uint64_t v9 = objc_msgSend(a3, "px_virtualCollections");
  uint64_t v27 = [PXStackedDataSectionManager alloc];
  long long v34 = [v9 featuredCollection];
  long long v33 = [a1 dataSectionManagerForCollection:v34 context:v8 enablementItem:7];
  v35[0] = v33;
  uint64_t v32 = [v9 eventsCollection];
  objc_super v31 = [a1 dataSectionManagerForCollection:v32 context:v8];
  v35[1] = v31;
  id v30 = [v9 peopleCollection];
  long long v29 = [a1 dataSectionManagerForCollection:v30 context:v8];
  v35[2] = v29;
  long long v28 = [v9 memoriesCollection];
  uint64_t v26 = [a1 dataSectionManagerForCollection:v28 context:v8 enablementItem:1];
  v35[3] = v26;
  v24 = [v9 tripsCollection];
  uint64_t v23 = [a1 dataSectionManagerForCollection:v24 context:v8 enablementItem:9];
  v35[4] = v23;
  uint64_t v22 = [v9 featuredPhotosCollection];
  long long v10 = [a1 dataSectionManagerForCollection:v22 context:v8 enablementItem:12];
  v35[5] = v10;
  long long v11 = [v9 utilitiesCollectionList];
  long long v12 = [a1 dataSectionManagerForCollection:v11 context:v8];
  v35[6] = v12;
  v35[7] = v25;
  long long v13 = [v9 rootAlbumCollectionList];
  int64_t v14 = [a1 dataSectionManagerForCollection:v13 context:v8];
  v35[8] = v14;
  id v15 = [v9 rootProjectCollectionList];
  id v16 = [a1 dataSectionManagerForCollection:v15 context:v8];

  v35[9] = v16;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:10];
  id v18 = [(PXStackedDataSectionManager *)v27 initWithChildDataSectionManagers:v17];

  uint64_t v19 = [PXNavigationListGroupItem alloc];
  v20 = [(PXNavigationListGroupItem *)v19 initWithIdentifier:@"PXNavigationListGroupItemTypeCollections"];
  [(PXStackedDataSectionManager *)v18 setOutlineObject:v20];

  return v18;
}

+ (id)sharingDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(v7, "px_virtualCollections");
  uint64_t v9 = [PXStackedDataSectionManager alloc];
  v20 = [v8 sharedAlbumsAndActivityCollectionList];
  long long v10 = [a1 dataSectionManagerForCollection:v20 context:v6 enablementItem:6];
  v21[0] = v10;
  long long v11 = [v8 contentSyndicationCollection];
  long long v12 = [a1 dataSectionManagerForCollection:v11 context:v6 enablementItem:17];
  v21[1] = v12;
  long long v13 = [v8 completeMyMomentCollection];
  int64_t v14 = [a1 dataSectionManagerForCollection:v13 context:v6 enablementItem:15];
  v21[2] = v14;
  id v15 = [a1 sharedLibrarySuggestionsDataSectionManagerForLibrary:v7 context:v6];

  v21[3] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  id v17 = [(PXStackedDataSectionManager *)v9 initWithChildDataSectionManagers:v16];

  id v18 = [[PXNavigationListGroupItem alloc] initWithIdentifier:@"PXNavigationListGroupItemTypeSharing"];
  [(PXStackedDataSectionManager *)v17 setOutlineObject:v18];

  return v17;
}

+ (id)libraryDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(v7, "px_virtualCollections");
  uint64_t v9 = [PXStackedDataSectionManager alloc];
  long long v10 = [v8 photosCollection];
  long long v11 = [a1 dataSectionManagerForCollection:v10 context:v6];
  v20[0] = v11;
  long long v12 = [a1 favoritesDataSectionManagerForLibrary:v7 context:v6];
  v20[1] = v12;
  long long v13 = [a1 recentlySavedDataSectionManagerForLibrary:v7 context:v6];

  v20[2] = v13;
  int64_t v14 = [v8 mapCollection];
  id v15 = [a1 dataSectionManagerForCollection:v14 context:v6 enablementItem:18];

  v20[3] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  id v17 = [(PXStackedDataSectionManager *)v9 initWithChildDataSectionManagers:v16];

  id v18 = [[PXNavigationListGroupItem alloc] initWithIdentifier:@"PXNavigationListGroupItemTypePhotos"];
  [(PXStackedDataSectionManager *)v17 setOutlineObject:v18];

  return v17;
}

+ (id)trashDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000201);
  id v8 = [a1 dataSectionManagerForCollection:v7 context:v6];
  uint64_t v9 = [v6 enablementProvider];

  [v9 configureEnablementOfSectionManager:v8 enablementItem:3];
  [v8 setHiddenWhenEmpty:0];

  return v8;
}

+ (id)recoveredDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000219);
  id v8 = [a1 dataSectionManagerForCollection:v7 context:v6];
  uint64_t v9 = [v6 enablementProvider];

  [v9 configureEnablementOfSectionManager:v8 enablementItem:4];
  [v8 setHiddenWhenEmpty:1];

  return v8;
}

+ (id)hiddenDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 205);
  id v8 = [a1 dataSectionManagerForCollection:v7 context:v6 enablementItem:2];

  [v8 setHiddenWhenEmpty:0];
  return v8;
}

+ (id)allDuplicatesDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000212);
  id v8 = [a1 dataSectionManagerForCollection:v7 context:v6 enablementItem:21];

  [v8 setHiddenWhenEmpty:1];
  return v8;
}

+ (id)sharedLibrarySuggestionsDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000214);
  id v8 = [a1 dataSectionManagerForCollection:v7 context:v6];
  uint64_t v9 = [v6 enablementProvider];

  [v9 configureEnablementOfSectionManager:v8 enablementItem:16];
  [v8 setHiddenWhenEmpty:1];

  return v8;
}

+ (id)dataSectionManagerForUtilityCollectionType:(unsigned __int16)a3 photoLibrary:(id)a4 context:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a5;
  uint64_t v9 = objc_msgSend(a4, "px_utilityCollectionWithType:", v6);
  long long v10 = [a1 dataSectionManagerForCollection:v9 context:v8];

  [v10 setHiddenWhenEmpty:1];
  return v10;
}

+ (id)unableToUploadDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 216);
  id v8 = [a1 dataSectionManagerForCollection:v7 context:v6];

  [v8 setHiddenWhenEmpty:1];
  return v8;
}

+ (id)recentlySavedDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000218);
  id v8 = [a1 dataSectionManagerForCollection:v7 context:v6];

  [v8 setHiddenWhenEmpty:1];
  return v8;
}

+ (id)favoritesDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 203);
  id v8 = [a1 dataSectionManagerForCollection:v7 context:v6];

  [v8 setHiddenWhenEmpty:1];
  return v8;
}

+ (id)dataSectionManagerForCollection:(id)a3 context:(id)a4 enablementItem:(int64_t)a5
{
  id v8 = a4;
  uint64_t v9 = [a1 dataSectionManagerForCollection:a3 context:v8];
  long long v10 = [v8 enablementProvider];

  [v10 configureEnablementOfSectionManager:v9 enablementItem:a5];
  return v9;
}

+ (id)dataSectionManagerForTransientCollection:(id)a3 context:(id)a4
{
  id v4 = [a1 dataSectionManagerForCollection:a3 context:a4];
  [v4 setHiddenWhenEmpty:1];
  return v4;
}

+ (id)dataSectionManagerForCollection:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PXNavigationListItemDataSectionManager alloc] initWithCollection:v6 context:v5];

  return v7;
}

@end