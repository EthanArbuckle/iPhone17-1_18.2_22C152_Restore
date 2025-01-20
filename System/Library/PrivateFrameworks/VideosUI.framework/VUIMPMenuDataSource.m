@interface VUIMPMenuDataSource
- (BOOL)_addOrRemoveDownloadCategoryIfNeeded;
- (BOOL)_addOrRemoveFamilySharingCategoryIfNeeded;
- (BOOL)_allFetchesHaveCompleted;
- (BOOL)hasDownloadDataSourceFetchCompleted;
- (BOOL)hasMediaEntitiesFetchCompleted;
- (NSArray)categoryTypes;
- (NSArray)genreTitles;
- (NSArray)genreTypes;
- (NSArray)homeShares;
- (NSDictionary)categoryTypeByFetchRequestIdentifier;
- (NSDictionary)mediaEntitiesByCategoryType;
- (VUIDownloadDataSource)downloadDataSource;
- (VUILibraryFamilyMembersDataSource)familyDataSource;
- (VUIMPMenuDataSource)initWithValidCategories:(id)a3;
- (VUIMediaEntitiesFetchController)mediaEntitiesFetchController;
- (VUIMediaEntitiesFetchController)rentalsUpdateFetchController;
- (VUIMediaLibrary)mediaLibrary;
- (id)_categoryTypesSortComparator;
- (id)_categoryTypesWithMediaEntitiesMap:(id)a3 categoryTypeComparator:(id)a4;
- (id)_categoryTypesWithOptimizedMenuDataMap:(id)a3 categoryTypeComparator:(id)a4;
- (id)_constructCategoryList;
- (id)_deviceMediaLibrary;
- (id)_fetchRequestsWithMediaLibrary:(id)a3 categoryTypeMap:(id *)a4 isInitialFetch:(BOOL)a5;
- (void)_accountsChanged:(id)a3;
- (void)_addAccountChangedNotificationObserver;
- (void)_addMediaLibraryNotificationObservers;
- (void)_addNotificationObserversWithDeviceLibrary:(id)a3;
- (void)_addRentalsUpdateNotificationObserver;
- (void)_homeShareMediaLibrariesDidChange:(id)a3;
- (void)_loadGenres;
- (void)_loadInitialMediaEntityShelves;
- (void)_loadMediaEntityShelvesWithInitialFetch:(BOOL)a3;
- (void)_mediaLibraryContentDidChange:(id)a3;
- (void)_notifyDelegateFetchDidComplete;
- (void)_populateViewModelFromMeidaLibraryCategoryTypes:(id)a3;
- (void)_refetchMediaEntityShelves;
- (void)_removeAccountChangedNotificationObserver;
- (void)_removeMediaLibraryNotificationObservers;
- (void)_removeNotificationObserversWithDeviceLibrary:(id)a3;
- (void)_removeRentalsUpdateNotificationObserver;
- (void)_updateFetchRequest:(id)a3 isInitialFetch:(BOOL)a4;
- (void)_updateRentalShelf;
- (void)controller:(id)a3 fetchRequests:(id)a4 didCompleteWithResult:(id)a5;
- (void)controller:(id)a3 fetchRequests:(id)a4 didFailWithError:(id)a5;
- (void)dataSourceDidFinishFetching:(id)a3;
- (void)dealloc;
- (void)downloadManager:(id)a3 downloadedFetchDidFinishWithEntities:(id)a4;
- (void)downloadManager:(id)a3 downloadsDidChange:(id)a4;
- (void)refetch;
- (void)setCategoryTypeByFetchRequestIdentifier:(id)a3;
- (void)setCategoryTypes:(id)a3;
- (void)setDownloadDataSource:(id)a3;
- (void)setFamilyDataSource:(id)a3;
- (void)setGenreTitles:(id)a3;
- (void)setGenreTypes:(id)a3;
- (void)setHasDownloadDataSourceFetchCompleted:(BOOL)a3;
- (void)setHasMediaEntitiesFetchCompleted:(BOOL)a3;
- (void)setHomeShares:(id)a3;
- (void)setMediaEntitiesByCategoryType:(id)a3;
- (void)setMediaEntitiesFetchController:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setRentalsUpdateFetchController:(id)a3;
- (void)startFetch;
@end

@implementation VUIMPMenuDataSource

- (VUIMPMenuDataSource)initWithValidCategories:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VUIMPMenuDataSource;
  v3 = [(VUILibraryMenuDataSource *)&v10 initWithValidCategories:a3];
  v4 = v3;
  if (v3)
  {
    v3->_hasMediaEntitiesFetchCompleted = 0;
    [(VUIMPMenuDataSource *)v3 _addRentalsUpdateNotificationObserver];
    [(VUIMPMenuDataSource *)v4 _addAccountChangedNotificationObserver];
    v5 = +[VUIMediaLibraryManager defaultManager];
    v6 = [v5 aggregateMediaLibrary];
    v7 = +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:8 withLibrary:v6];
    [(VUIMPMenuDataSource *)v4 setDownloadDataSource:v7];

    v8 = [(VUIMPMenuDataSource *)v4 downloadDataSource];
    [v8 setDownloadDelegate:v4];

    [(VUIMPMenuDataSource *)v4 setHasDownloadDataSourceFetchCompleted:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(VUIMPMenuDataSource *)self mediaEntitiesFetchController];

  if (v3)
  {
    v4 = [(VUIMPMenuDataSource *)self mediaLibrary];
    v5 = +[VUIMediaLibraryFetchControllerQueue defaultQueueWithMediaLibrary:v4];
    v6 = [(VUIMPMenuDataSource *)self mediaEntitiesFetchController];
    [v5 removeFetchController:v6];

    [(VUIMediaEntitiesFetchController *)self->_mediaEntitiesFetchController setDelegate:0];
  }
  v7 = [(VUIMPMenuDataSource *)self rentalsUpdateFetchController];

  if (v7)
  {
    v8 = [(VUIMPMenuDataSource *)self mediaLibrary];
    v9 = +[VUIMediaLibraryFetchControllerQueue defaultQueueWithMediaLibrary:v8];
    objc_super v10 = [(VUIMPMenuDataSource *)self rentalsUpdateFetchController];
    [v9 removeFetchController:v10];

    [(VUIMediaEntitiesFetchController *)self->_rentalsUpdateFetchController setDelegate:0];
  }
  [(VUIMPMenuDataSource *)self _removeMediaLibraryNotificationObservers];
  [(VUIMPMenuDataSource *)self _removeRentalsUpdateNotificationObserver];
  [(VUIMPMenuDataSource *)self _removeAccountChangedNotificationObserver];
  v11 = [(VUIMPMenuDataSource *)self downloadDataSource];
  [v11 setDelegate:0];

  v12.receiver = self;
  v12.super_class = (Class)VUIMPMenuDataSource;
  [(VUIMPMenuDataSource *)&v12 dealloc];
}

- (void)setMediaLibrary:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
  [(VUIMPMenuDataSource *)self _addMediaLibraryNotificationObservers];
  v5 = [(VUILibraryMenuDataSource *)self validCategories];
  if ([v5 containsObject:&unk_1F3F3CAE8])
  {
    v6 = [(VUIMPMenuDataSource *)self mediaLibrary];
    uint64_t v7 = [v6 type];

    if (!v7)
    {
      v8 = +[VUIMediaLibraryManager defaultManager];
      v9 = [v8 homeShareMediaLibraries];
      [(VUIMPMenuDataSource *)self setHomeShares:v9];

      goto LABEL_6;
    }
  }
  else
  {
  }
  [(VUIMPMenuDataSource *)self setHomeShares:MEMORY[0x1E4F1CBF0]];
LABEL_6:
}

- (void)startFetch
{
  if (![(VUILibraryDataSource *)self hasCompletedInitialFetch])
  {
    [(VUIMPMenuDataSource *)self _loadInitialMediaEntityShelves];
    v3 = [(VUIMPMenuDataSource *)self downloadDataSource];
    [v3 loadDownloadData];

    id v7 = [(VUILibraryMenuDataSource *)self validCategories];
    if ([v7 containsObject:&unk_1F3F3CB00])
    {
      BOOL v4 = +[VUIAuthenticationManager userHasActiveAccount];

      if (!v4) {
        return;
      }
      v5 = objc_alloc_init(VUILibraryFamilyMembersDataSource);
      [(VUIMPMenuDataSource *)self setFamilyDataSource:v5];

      v6 = [(VUIMPMenuDataSource *)self familyDataSource];
      [v6 setDelegate:self];

      id v7 = [(VUIMPMenuDataSource *)self familyDataSource];
      [v7 startFetch];
    }
  }
}

- (void)refetch
{
  [(VUIMPMenuDataSource *)self setHasMediaEntitiesFetchCompleted:0];
  [(VUIMPMenuDataSource *)self _refetchMediaEntityShelves];
  v3 = [(VUIMPMenuDataSource *)self downloadDataSource];
  [v3 loadDownloadData];

  id v7 = [(VUILibraryMenuDataSource *)self validCategories];
  if ([v7 containsObject:&unk_1F3F3CB00])
  {
    BOOL v4 = +[VUIAuthenticationManager userHasActiveAccount];

    if (!v4) {
      return;
    }
    v5 = objc_alloc_init(VUILibraryFamilyMembersDataSource);
    [(VUIMPMenuDataSource *)self setFamilyDataSource:v5];

    v6 = [(VUIMPMenuDataSource *)self familyDataSource];
    [v6 setDelegate:self];

    id v7 = [(VUIMPMenuDataSource *)self familyDataSource];
    [v7 startFetch];
  }
}

- (void)downloadManager:(id)a3 downloadedFetchDidFinishWithEntities:(id)a4
{
  if ([(VUIMPMenuDataSource *)self hasMediaEntitiesFetchCompleted])
  {
    [(VUIMPMenuDataSource *)self _addOrRemoveDownloadCategoryIfNeeded];
    [(VUIMPMenuDataSource *)self setHasDownloadDataSourceFetchCompleted:1];
    if ([(VUIMPMenuDataSource *)self _allFetchesHaveCompleted])
    {
      [(VUIMPMenuDataSource *)self _notifyDelegateFetchDidComplete];
    }
  }
  else
  {
    [(VUIMPMenuDataSource *)self setHasDownloadDataSourceFetchCompleted:1];
  }
}

- (void)downloadManager:(id)a3 downloadsDidChange:(id)a4
{
  if ([(VUIMPMenuDataSource *)self hasMediaEntitiesFetchCompleted])
  {
    [(VUIMPMenuDataSource *)self _addOrRemoveDownloadCategoryIfNeeded];
    [(VUIMPMenuDataSource *)self setHasDownloadDataSourceFetchCompleted:1];
    if ([(VUIMPMenuDataSource *)self _allFetchesHaveCompleted])
    {
      [(VUIMPMenuDataSource *)self _notifyDelegateFetchDidComplete];
    }
  }
  else
  {
    [(VUIMPMenuDataSource *)self setHasDownloadDataSourceFetchCompleted:1];
  }
}

- (BOOL)_addOrRemoveDownloadCategoryIfNeeded
{
  if (!self->_hasMediaEntitiesFetchCompleted) {
    return 0;
  }
  BOOL v4 = [(VUIMPMenuDataSource *)self downloadDataSource];
  v5 = [v4 downloadEntities];
  v6 = (void *)[v5 count];

  if (!v6)
  {
    id v10 = [(VUIMPMenuDataSource *)self mediaEntitiesByCategoryType];
    v11 = [v10 objectForKey:&unk_1F3F3CB18];
    if (v11)
    {
      v6 = [(VUIMPMenuDataSource *)self mediaEntitiesByCategoryType];
      v2 = [v6 objectForKey:&unk_1F3F3CB18];
      if ([v2 count])
      {

        BOOL v9 = 0;
LABEL_15:

        return v9;
      }
    }
    v15 = [(VUIMPMenuDataSource *)self categoryTypes];
    int v16 = [v15 containsObject:&unk_1F3F3CB18];

    if (v11)
    {

      if ((v16 & 1) == 0) {
        return 0;
      }
    }
    else
    {

      if (!v16) {
        return 0;
      }
    }
    v17 = (void *)MEMORY[0x1E4F1CA48];
    v18 = [(VUIMPMenuDataSource *)self categoryTypes];
    id v10 = [v17 arrayWithArray:v18];

    [v10 removeObject:&unk_1F3F3CB18];
LABEL_14:
    v19 = (void *)[v10 copy];
    [(VUIMPMenuDataSource *)self setCategoryTypes:v19];

    v11 = [(VUIMPMenuDataSource *)self _constructCategoryList];
    [(VUILibraryMenuDataSource *)self setMenuItems:v11];
    BOOL v9 = 1;
    goto LABEL_15;
  }
  id v7 = [(VUIMPMenuDataSource *)self categoryTypes];
  char v8 = [v7 containsObject:&unk_1F3F3CB18];

  if ((v8 & 1) == 0)
  {
    objc_super v12 = (void *)MEMORY[0x1E4F1CA48];
    v13 = [(VUIMPMenuDataSource *)self categoryTypes];
    id v10 = [v12 arrayWithArray:v13];

    [v10 addObject:&unk_1F3F3CB18];
    v14 = [(VUIMPMenuDataSource *)self _categoryTypesSortComparator];
    [v10 sortUsingComparator:v14];

    goto LABEL_14;
  }
  return 0;
}

- (void)dataSourceDidFinishFetching:(id)a3
{
  if ([(VUIMPMenuDataSource *)self hasMediaEntitiesFetchCompleted])
  {
    [(VUIMPMenuDataSource *)self _addOrRemoveFamilySharingCategoryIfNeeded];
    if ([(VUIMPMenuDataSource *)self _allFetchesHaveCompleted])
    {
      [(VUIMPMenuDataSource *)self _notifyDelegateFetchDidComplete];
    }
  }
}

- (BOOL)_addOrRemoveFamilySharingCategoryIfNeeded
{
  if (self->_hasMediaEntitiesFetchCompleted)
  {
    v3 = [(VUIMPMenuDataSource *)self familyDataSource];
    BOOL v4 = [v3 familyMembers];
    uint64_t v5 = [v4 count];

    v6 = [(VUIMPMenuDataSource *)self categoryTypes];
    int v7 = [v6 containsObject:&unk_1F3F3CB00];

    if (v5)
    {
      if ((v7 & 1) == 0)
      {
        char v8 = (void *)MEMORY[0x1E4F1CA48];
        BOOL v9 = [(VUIMPMenuDataSource *)self categoryTypes];
        id v10 = [v8 arrayWithArray:v9];

        [v10 addObject:&unk_1F3F3CB00];
        v11 = [(VUIMPMenuDataSource *)self _categoryTypesSortComparator];
        [v10 sortUsingComparator:v11];

LABEL_7:
        v14 = (void *)[v10 copy];
        [(VUIMPMenuDataSource *)self setCategoryTypes:v14];

        v15 = [(VUIMPMenuDataSource *)self _constructCategoryList];
        [(VUILibraryMenuDataSource *)self setMenuItems:v15];

        return 1;
      }
    }
    else if (v7)
    {
      objc_super v12 = (void *)MEMORY[0x1E4F1CA48];
      v13 = [(VUIMPMenuDataSource *)self categoryTypes];
      id v10 = [v12 arrayWithArray:v13];

      [v10 removeObject:&unk_1F3F3CB00];
      goto LABEL_7;
    }
  }
  return 0;
}

- (void)controller:(id)a3 fetchRequests:(id)a4 didCompleteWithResult:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  char v8 = (VUIMediaEntitiesFetchController *)a3;
  id v43 = a4;
  id v9 = a5;
  id v10 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_super v12 = [v9 fetchResponses];
  v13 = v12;
  if (self->_rentalsUpdateFetchController == v8)
  {
    if (v12)
    {
      v29 = [v12 firstObject];
      v30 = [v29 mediaEntities];
    }
    else
    {
      v30 = 0;
    }
    v28 = self->_mediaEntitiesByCategoryType;

    if ([v30 count])
    {
      v31 = v28;
      v32 = v30;
    }
    else
    {
      v32 = (void *)MEMORY[0x1E4F1CBF0];
      v31 = v28;
    }
    [(NSDictionary *)v31 setObject:v32 forKey:&unk_1F3F3CB30];
  }
  else
  {
    if (self->_mediaEntitiesFetchController != v8) {
      goto LABEL_29;
    }
    if ([v12 count])
    {
      v39 = v8;
      v40 = v10;
      v42 = v11;
      id v38 = v9;
      char v41 = 0;
      unint64_t v14 = 0;
      do
      {
        v15 = [v43 objectAtIndex:v14];
        int v16 = [v15 options];
        int v17 = objc_msgSend(v16, "vui_BOOLForKey:defaultValue:", @"CheckHasItems", 0);
        v18 = [v13 objectAtIndex:v14];
        v19 = [(VUIMPMenuDataSource *)self categoryTypeByFetchRequestIdentifier];
        v20 = [v15 identifier];
        v21 = [v19 objectForKey:v20];

        if (v21)
        {
          uint64_t v22 = [v18 mediaEntities];
          v23 = (void *)v22;
          if (v17)
          {
            uint64_t v24 = [v18 hasDataForCheckHasItemsOption];
            v25 = [MEMORY[0x1E4F28ED0] numberWithBool:v24];
            [v42 setObject:v25 forKey:v21];

            char v41 = 1;
          }
          else
          {
            if (v22)
            {
              v26 = v40;
              v27 = v23;
            }
            else
            {
              v26 = v40;
              v27 = (void *)MEMORY[0x1E4F1CBF0];
            }
            [(NSDictionary *)v26 setObject:v27 forKey:v21];
          }
        }
        ++v14;
      }
      while (v14 < [v13 count]);
      if (v41)
      {
        v33 = [(VUIMPMenuDataSource *)self _categoryTypesSortComparator];
        id v11 = v42;
        v34 = [(VUIMPMenuDataSource *)self _categoryTypesWithOptimizedMenuDataMap:v42 categoryTypeComparator:v33];
        id v9 = v38;
        char v8 = v39;
        id v10 = v40;
        goto LABEL_24;
      }
      char v8 = v39;
      v28 = v40;
      id v9 = v38;
      id v11 = v42;
    }
    else
    {
      v28 = v10;
    }
  }
  v33 = [(VUIMPMenuDataSource *)self _categoryTypesSortComparator];
  v34 = [(VUIMPMenuDataSource *)self _categoryTypesWithMediaEntitiesMap:v28 categoryTypeComparator:v33];
  id v10 = v28;
LABEL_24:

  [(VUIMPMenuDataSource *)self _populateViewModelFromMeidaLibraryCategoryTypes:v34];
  [(VUIMPMenuDataSource *)self setMediaEntitiesByCategoryType:v10];
  [(VUIMPMenuDataSource *)self setHasMediaEntitiesFetchCompleted:1];
  v35 = VUIDefaultLogObject();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    BOOL hasDownloadDataSourceFetchCompleted = self->_hasDownloadDataSourceFetchCompleted;
    BOOL hasMediaEntitiesFetchCompleted = self->_hasMediaEntitiesFetchCompleted;
    *(_DWORD *)buf = 67109376;
    BOOL v45 = hasDownloadDataSourceFetchCompleted;
    __int16 v46 = 1024;
    BOOL v47 = hasMediaEntitiesFetchCompleted;
    _os_log_impl(&dword_1E2BD7000, v35, OS_LOG_TYPE_DEFAULT, "+++ VUIMPMenuDataSource should notify up _hasMediaEntitiesFetchCompleted %d, %d", buf, 0xEu);
  }

  if (self->_hasDownloadDataSourceFetchCompleted
    && [(VUIMPMenuDataSource *)self _allFetchesHaveCompleted])
  {
    [(VUIMPMenuDataSource *)self _notifyDelegateFetchDidComplete];
  }
LABEL_29:
}

- (void)controller:(id)a3 fetchRequests:(id)a4 didFailWithError:(id)a5
{
  char v8 = (VUIMediaEntitiesFetchController *)a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_mediaEntitiesFetchController == v8 || self->_rentalsUpdateFetchController == v8)
  {
    [(VUIMPMenuDataSource *)self setHasMediaEntitiesFetchCompleted:1];
    objc_initWeak(&location, self);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    unint64_t v14 = __65__VUIMPMenuDataSource_controller_fetchRequests_didFailWithError___block_invoke;
    v15 = &unk_1E6DF4A30;
    objc_copyWeak(&v16, &location);
    id v11 = &v12;
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v12, v13)) {
      v14((uint64_t)v11);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v11);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __65__VUIMPMenuDataSource_controller_fetchRequests_didFailWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v1 dataSourceDidFinishFetching:WeakRetained];
  }
}

- (id)_deviceMediaLibrary
{
  v2 = [(VUIMPMenuDataSource *)self mediaLibrary];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)_addMediaLibraryNotificationObservers
{
  id v3 = [(VUIMPMenuDataSource *)self _deviceMediaLibrary];
  if (v3)
  {
    BOOL v4 = v3;
    [(VUIMPMenuDataSource *)self _addNotificationObserversWithDeviceLibrary:v3];
    id v3 = v4;
  }
}

- (void)_addNotificationObserversWithDeviceLibrary:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 addObserver:self selector:sel__homeShareMediaLibrariesDidChange_ name:@"VUIMediaLibraryManagerHomeSharesDidChangeNotification" object:0];
  BOOL v4 = [(VUIMPMenuDataSource *)self mediaLibrary];
  [v5 addObserver:self selector:sel__mediaLibraryContentDidChange_ name:@"VUIMediaLibraryContentsDidChangeNotification" object:v4];
}

- (void)_removeMediaLibraryNotificationObservers
{
  id v3 = [(VUIMPMenuDataSource *)self _deviceMediaLibrary];
  if (v3)
  {
    BOOL v4 = v3;
    [(VUIMPMenuDataSource *)self _removeNotificationObserversWithDeviceLibrary:v3];
    id v3 = v4;
  }
}

- (void)_removeNotificationObserversWithDeviceLibrary:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 removeObserver:self name:@"VUIMediaLibraryManagerHomeSharesDidChangeNotification" object:0];
}

- (void)_addRentalsUpdateNotificationObserver
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__updateRentalShelf name:@"VUIRentalExpirationMonitorRentalDidExpireNotification" object:0];
}

- (void)_removeRentalsUpdateNotificationObserver
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"VUIRentalExpirationMonitorRentalDidExpireNotification" object:0];
}

- (void)_addAccountChangedNotificationObserver
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__accountsChanged_ name:@"VUIAuthenticationManagerAccountStoreDidChangeNotification" object:0];
}

- (void)_removeAccountChangedNotificationObserver
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FA83B0] object:0];
}

- (void)_homeShareMediaLibrariesDidChange:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"VUIMediaLibraryManagerHomeSharesDidChangeUserInfoKeyMediaLibraries"];
  v6 = [v4 objectForKey:@"VUIMediaLibraryManagerHomeSharesDidChangeUserInfoKeyChangeSet"];
  if ([(VUIMPMenuDataSource *)self hasMediaEntitiesFetchCompleted])
  {
    int v7 = [(VUIMPMenuDataSource *)self homeShares];
    char v8 = objc_msgSend(v7, "vui_arrayByApplyingChangeSet:destinationObjects:", v6, v5);
    if ([v7 count] && !objc_msgSend(v8, "count"))
    {
      v23 = v8;
      uint64_t v24 = v6;
      unint64_t v14 = objc_opt_new();
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v15 = [(VUIMPMenuDataSource *)self categoryTypes];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (objc_msgSend(v20, "intValue", v23, v24) != 9) {
              [v14 addObject:v20];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v17);
      }

      v21 = (void *)[v14 copy];
      [(VUIMPMenuDataSource *)self setCategoryTypes:v21];

      uint64_t v22 = [(VUIMPMenuDataSource *)self _constructCategoryList];
      [(VUILibraryMenuDataSource *)self setMenuItems:v22];

      if ([(VUIMPMenuDataSource *)self _allFetchesHaveCompleted]) {
        [(VUIMPMenuDataSource *)self _notifyDelegateFetchDidComplete];
      }

      char v8 = v23;
      v6 = v24;
    }
    else if (![v7 count] && objc_msgSend(v8, "count"))
    {
      id v9 = (void *)MEMORY[0x1E4F1CA48];
      id v10 = [(VUIMPMenuDataSource *)self categoryTypes];
      id v11 = [v9 arrayWithArray:v10];

      [v11 addObject:&unk_1F3F3CAE8];
      uint64_t v12 = (void *)[v11 copy];
      [(VUIMPMenuDataSource *)self setCategoryTypes:v12];

      uint64_t v13 = [(VUIMPMenuDataSource *)self _constructCategoryList];
      [(VUILibraryMenuDataSource *)self setMenuItems:v13];

      if ([(VUIMPMenuDataSource *)self _allFetchesHaveCompleted]) {
        [(VUIMPMenuDataSource *)self _notifyDelegateFetchDidComplete];
      }
    }
    -[VUIMPMenuDataSource setHomeShares:](self, "setHomeShares:", v8, v23, v24);
  }
  else
  {
    [(VUIMPMenuDataSource *)self setHomeShares:v5];
  }
}

- (void)_mediaLibraryContentDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 object];
  id v5 = [(VUIMPMenuDataSource *)self mediaLibrary];

  if (v4 == v5)
  {
    v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [(VUIMPMenuDataSource *)self mediaLibrary];
      char v8 = [v7 identifier];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIMPMenuDataSource:: mediaLibrary %@ ContentDidChange", (uint8_t *)&v9, 0xCu);
    }
    [(VUIMPMenuDataSource *)self _loadGenres];
  }
}

- (void)_loadInitialMediaEntityShelves
{
}

- (void)_refetchMediaEntityShelves
{
}

- (void)_loadMediaEntityShelvesWithInitialFetch:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(VUIMPMenuDataSource *)self mediaLibrary];
  id v15 = 0;
  v6 = [(VUIMPMenuDataSource *)self _fetchRequestsWithMediaLibrary:v5 categoryTypeMap:&v15 isInitialFetch:v3];
  id v7 = v15;

  [(VUIMPMenuDataSource *)self setCategoryTypeByFetchRequestIdentifier:v7];
  char v8 = [VUIMediaEntitiesFetchController alloc];
  int v9 = [(VUIMPMenuDataSource *)self mediaLibrary];
  id v10 = [(VUIMediaEntitiesFetchController *)v8 initWithMediaLibrary:v9 fetchRequests:v6];
  [(VUIMPMenuDataSource *)self setMediaEntitiesFetchController:v10];

  uint64_t v11 = [(VUIMPMenuDataSource *)self mediaEntitiesFetchController];
  [v11 setDelegate:self];

  [(VUIMPMenuDataSource *)self _loadGenres];
  uint64_t v12 = [(VUIMPMenuDataSource *)self mediaLibrary];
  uint64_t v13 = +[VUIMediaLibraryFetchControllerQueue defaultQueueWithMediaLibrary:v12];
  unint64_t v14 = [(VUIMPMenuDataSource *)self mediaEntitiesFetchController];
  [v13 addFetchController:v14];
}

- (id)_fetchRequestsWithMediaLibrary:(id)a3 categoryTypeMap:(id *)a4 isInitialFetch:(BOOL)a5
{
  BOOL v5 = a5;
  v56[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v11 = [(VUILibraryMenuDataSource *)self validCategories];
  int v12 = [v11 containsObject:&unk_1F3F3CB30];

  if (v12 && ![v8 type])
  {
    uint64_t v13 = +[VUIMediaEntityFetchRequest movieRentalsFetchRequest];
    id v51 = objc_alloc(MEMORY[0x1E4F1C978]);
    v52 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"rentalExpirationDate" ascending:1];
    v53 = objc_msgSend(v51, "initWithObjects:", v52, 0);

    [v13 setSortDescriptors:v53];
    [(VUIMPMenuDataSource *)self _updateFetchRequest:v13 isInitialFetch:v5];
    [v9 addObject:v13];
    v54 = [v13 identifier];
    [v10 setObject:&unk_1F3F3CB30 forKey:v54];
  }
  else
  {
    uint64_t v13 = 0;
  }
  unint64_t v14 = [(VUILibraryMenuDataSource *)self validCategories];
  int v15 = [v14 containsObject:&unk_1F3F3CB48];

  if (v15)
  {
    uint64_t v16 = [VUIMediaEntityFetchRequest alloc];
    uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
    +[VUIMediaEntityType movie];
    v55 = v9;
    id v18 = v10;
    BOOL v19 = v5;
    v20 = a4;
    uint64_t v22 = v21 = v8;
    v23 = +[VUIMediaEntityType show];
    uint64_t v24 = objc_msgSend(v17, "setWithObjects:", v22, v23, 0);
    long long v25 = [(VUIMediaEntityFetchRequest *)v16 initWithMediaEntityTypes:v24];

    id v8 = v21;
    a4 = v20;
    BOOL v5 = v19;
    id v10 = v18;
    id v9 = v55;
    long long v26 = VUIMediaEntityFetchRequestMinimalPropertiesSet();
    [(VUIMediaEntityFetchRequest *)v25 setProperties:v26];

    long long v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:0];
    v56[0] = v27;
    long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    [(VUIMediaEntityFetchRequest *)v25 setSortDescriptors:v28];

    [(VUIMediaEntityFetchRequest *)v25 addRecentlyAddedSortDescriptorWithLimit:25];
    v29 = (void *)MEMORY[0x1E4F28F60];
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v31 = objc_msgSend(v29, "vui_predicateWithSubpredicates:type:", v30, 1);
    [(VUIMediaEntityFetchRequest *)v25 setPredicate:v31];

    [(VUIMPMenuDataSource *)self _updateFetchRequest:v25 isInitialFetch:v5];
    [v55 addObject:v25];
    v32 = [(VUIMediaEntityFetchRequest *)v25 identifier];
    [v10 setObject:&unk_1F3F3CB48 forKey:v32];

    uint64_t v13 = v25;
  }
  v33 = [(VUILibraryMenuDataSource *)self validCategories];
  int v34 = [v33 containsObject:&unk_1F3F3CB60];

  if (v34)
  {
    v35 = +[VUIMediaEntityFetchRequest homeVideosFetchRequest];

    [(VUIMPMenuDataSource *)self _updateFetchRequest:v35 isInitialFetch:v5];
    [v9 addObject:v35];
    v36 = [v35 identifier];
    [v10 setObject:&unk_1F3F3CB60 forKey:v36];

    uint64_t v13 = v35;
  }
  v37 = [(VUILibraryMenuDataSource *)self validCategories];
  int v38 = [v37 containsObject:&unk_1F3F3CB78];

  if (v38)
  {
    v39 = +[VUIMediaEntityFetchRequest showsFetchRequest];

    [(VUIMPMenuDataSource *)self _updateFetchRequest:v39 isInitialFetch:v5];
    [v9 addObject:v39];
    v40 = [v39 identifier];
    [v10 setObject:&unk_1F3F3CB78 forKey:v40];

    uint64_t v13 = v39;
  }
  char v41 = [(VUILibraryMenuDataSource *)self validCategories];
  int v42 = [v41 containsObject:&unk_1F3F3CB90];

  if (v42)
  {
    id v43 = +[VUIMediaEntityFetchRequest moviesFetchRequest];

    [(VUIMPMenuDataSource *)self _updateFetchRequest:v43 isInitialFetch:v5];
    [v9 addObject:v43];
    v44 = [v43 identifier];
    [v10 setObject:&unk_1F3F3CB90 forKey:v44];

    uint64_t v13 = v43;
  }
  BOOL v45 = [(VUILibraryMenuDataSource *)self validCategories];
  int v46 = [v45 containsObject:&unk_1F3F3CBA8];

  if (v46 && SSDeviceIsHDRCapable())
  {
    BOOL v47 = +[VUIMediaEntityFetchRequest moviesFetchRequest];

    [v47 addHDRColorCapabilityOr4KResolutionPredicate];
    [(VUIMPMenuDataSource *)self _updateFetchRequest:v47 isInitialFetch:v5];
    [v9 addObject:v47];
    uint64_t v48 = [v47 identifier];
    [v10 setObject:&unk_1F3F3CBA8 forKey:v48];

    uint64_t v13 = v47;
  }
  if (a4) {
    *a4 = v10;
  }
  v49 = (void *)[v9 copy];

  return v49;
}

- (void)_loadGenres
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIMPMenuDataSource - no MPMediaLibrary", v1, 2u);
}

void __34__VUIMPMenuDataSource__loadGenres__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) collections];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    uint64_t v7 = *MEMORY[0x1E4F312D0];
    uint64_t v8 = *MEMORY[0x1E4F312D8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v11 = [v10 valueForProperty:v7];
        int v12 = v11;
        if (v11 && [v11 length])
        {
          [v20 addObject:v12];
          uint64_t v13 = [v10 valueForProperty:v8];
          unint64_t v14 = v13;
          if (v13) {
            uint64_t v15 = VUILibraryGenreFromGenreID([v13 integerValue]);
          }
          else {
            uint64_t v15 = 0;
          }
          uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithInteger:v15];
          [v2 addObject:v16];
        }
        else
        {
          unint64_t v14 = VUIDefaultLogObject();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            __34__VUIMPMenuDataSource__loadGenres__block_invoke_cold_1(&buf, v26, v14);
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__VUIMPMenuDataSource__loadGenres__block_invoke_55;
  block[3] = &unk_1E6DF3F90;
  objc_copyWeak(&v24, (id *)(a1 + 40));
  id v22 = v20;
  id v23 = v2;
  id v17 = v2;
  id v18 = v20;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v24);
}

void __34__VUIMPMenuDataSource__loadGenres__block_invoke_55(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setGenreTitles:*(void *)(a1 + 32)];
  [WeakRetained setGenreTypes:*(void *)(a1 + 40)];
  if ([WeakRetained _allFetchesHaveCompleted])
  {
    id v2 = [WeakRetained _constructCategoryList];
    [WeakRetained setMenuItems:v2];

    [WeakRetained _notifyDelegateFetchDidComplete];
  }
}

- (id)_constructCategoryList
{
  id v3 = self->_genreTitles;
  uint64_t v4 = self->_genreTypes;
  if (!self->_genreTitles)
  {

    id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  if (!self->_genreTypes)
  {

    uint64_t v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = [VUIMenuDataSource alloc];
  uint64_t v6 = [(VUIMPMenuDataSource *)self categoryTypes];
  uint64_t v7 = (void *)[(NSArray *)v3 copy];
  uint64_t v8 = [(VUIMenuDataSource *)v5 initWithMainMenuItems:v6 genreMenuItems:v7];

  id v9 = (void *)[(NSArray *)v4 copy];
  [(VUIMenuDataSource *)v8 setGenreTypes:v9];

  return v8;
}

- (id)_categoryTypesWithMediaEntitiesMap:(id)a3 categoryTypeComparator:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__VUIMPMenuDataSource__categoryTypesWithMediaEntitiesMap_categoryTypeComparator___block_invoke;
  v12[3] = &unk_1E6DF7C78;
  id v9 = v8;
  id v13 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];

  if (v5) {
    [v9 sortUsingComparator:v5];
  }
  id v10 = (void *)[v9 copy];

  return v10;
}

void __81__VUIMPMenuDataSource__categoryTypesWithMediaEntitiesMap_categoryTypeComparator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 count]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (id)_categoryTypesWithOptimizedMenuDataMap:(id)a3 categoryTypeComparator:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__VUIMPMenuDataSource__categoryTypesWithOptimizedMenuDataMap_categoryTypeComparator___block_invoke;
  v12[3] = &unk_1E6DF7CA0;
  id v9 = v8;
  id v13 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];

  if (v5) {
    [v9 sortUsingComparator:v5];
  }
  id v10 = (void *)[v9 copy];

  return v10;
}

void __85__VUIMPMenuDataSource__categoryTypesWithOptimizedMenuDataMap_categoryTypeComparator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 BOOLValue]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)_updateFetchRequest:(id)a3 isInitialFetch:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v4 && v6 == 1) {
    [v7 addHasItemsOption];
  }
}

- (id)_categoryTypesSortComparator
{
  return &__block_literal_global_63;
}

uint64_t __51__VUIMPMenuDataSource__categoryTypesSortComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_updateRentalShelf
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[VUIMediaEntityFetchRequest movieRentalsFetchRequest];
  id v4 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"rentalExpirationDate" ascending:1];
  uint64_t v6 = objc_msgSend(v4, "initWithObjects:", v5, 0);

  [v3 setSortDescriptors:v6];
  id v7 = (void *)[(NSDictionary *)self->_categoryTypeByFetchRequestIdentifier mutableCopy];
  id v8 = [v3 identifier];
  [v7 setObject:&unk_1F3F3CB30 forKey:v8];

  id v9 = (void *)[v7 copy];
  [(VUIMPMenuDataSource *)self setCategoryTypeByFetchRequestIdentifier:v9];

  id v10 = [VUIMediaEntitiesFetchController alloc];
  uint64_t v11 = [(VUIMPMenuDataSource *)self mediaLibrary];
  v17[0] = v3;
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v13 = [(VUIMediaEntitiesFetchController *)v10 initWithMediaLibrary:v11 fetchRequests:v12];
  rentalsUpdateFetchController = self->_rentalsUpdateFetchController;
  self->_rentalsUpdateFetchController = v13;

  [(VUIMediaEntitiesFetchController *)self->_rentalsUpdateFetchController setDelegate:self];
  uint64_t v15 = [(VUIMPMenuDataSource *)self mediaLibrary];
  uint64_t v16 = +[VUIMediaLibraryFetchControllerQueue defaultQueueWithMediaLibrary:v15];
  [v16 addFetchController:self->_rentalsUpdateFetchController];
}

- (void)_populateViewModelFromMeidaLibraryCategoryTypes:(id)a3
{
  id v13 = [MEMORY[0x1E4F1CA48] arrayWithArray:a3];
  id v4 = [(VUIDownloadDataSource *)self->_downloadDataSource downloadEntities];
  if ([v4 count])
  {
    char v5 = [v13 containsObject:&unk_1F3F3CB18];

    if ((v5 & 1) == 0) {
      [v13 addObject:&unk_1F3F3CB18];
    }
  }
  else
  {
  }
  uint64_t v6 = [(VUIMPMenuDataSource *)self homeShares];
  uint64_t v7 = [v6 count];

  if (v7) {
    [v13 addObject:&unk_1F3F3CAE8];
  }
  id v8 = [(VUIMPMenuDataSource *)self familyDataSource];
  id v9 = [v8 familyMembers];
  if ([v9 count])
  {
    char v10 = [v13 containsObject:&unk_1F3F3CB00];

    if ((v10 & 1) == 0) {
      [v13 addObject:&unk_1F3F3CB00];
    }
  }
  else
  {
  }
  uint64_t v11 = (void *)[v13 copy];
  [(VUIMPMenuDataSource *)self setCategoryTypes:v11];

  int v12 = [(VUIMPMenuDataSource *)self _constructCategoryList];
  [(VUILibraryMenuDataSource *)self setMenuItems:v12];
}

- (BOOL)_allFetchesHaveCompleted
{
  return self->_hasMediaEntitiesFetchCompleted && self->_hasDownloadDataSourceFetchCompleted;
}

- (void)_accountsChanged:(id)a3
{
  uint64_t v4 = MEMORY[0x1E4F1CBF0];
  [(VUIMPMenuDataSource *)self setGenreTitles:MEMORY[0x1E4F1CBF0]];
  [(VUIMPMenuDataSource *)self setGenreTypes:v4];
  [(VUIMPMenuDataSource *)self setCategoryTypes:v4];
  char v5 = [(VUILibraryMenuDataSource *)self validCategories];
  int v6 = [v5 containsObject:&unk_1F3F3CB00];

  if (v6)
  {
    if (+[VUIAuthenticationManager userHasActiveAccount])
    {
      uint64_t v7 = objc_alloc_init(VUILibraryFamilyMembersDataSource);
      [(VUIMPMenuDataSource *)self setFamilyDataSource:v7];

      id v8 = [(VUIMPMenuDataSource *)self familyDataSource];
      [v8 setDelegate:self];

      id v9 = [(VUIMPMenuDataSource *)self familyDataSource];
      [v9 startFetch];
    }
    else
    {
      [(VUIMPMenuDataSource *)self setFamilyDataSource:0];
      [(VUIMPMenuDataSource *)self _addOrRemoveFamilySharingCategoryIfNeeded];
      if ([(VUIMPMenuDataSource *)self _allFetchesHaveCompleted])
      {
        [(VUIMPMenuDataSource *)self _notifyDelegateFetchDidComplete];
      }
    }
  }
}

- (void)_notifyDelegateFetchDidComplete
{
  [(VUILibraryDataSource *)self setHasCompletedInitialFetch:1];
  objc_initWeak(&location, self);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  int v6 = __54__VUIMPMenuDataSource__notifyDelegateFetchDidComplete__block_invoke;
  uint64_t v7 = &unk_1E6DF4A30;
  objc_copyWeak(&v8, &location);
  id v3 = &v4;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v4, v5)) {
    v6((uint64_t)v3);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v3);
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __54__VUIMPMenuDataSource__notifyDelegateFetchDidComplete__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v1 dataSourceDidFinishFetching:WeakRetained];
  }
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (NSArray)homeShares
{
  return self->_homeShares;
}

- (void)setHomeShares:(id)a3
{
}

- (VUIMediaEntitiesFetchController)mediaEntitiesFetchController
{
  return self->_mediaEntitiesFetchController;
}

- (void)setMediaEntitiesFetchController:(id)a3
{
}

- (NSDictionary)categoryTypeByFetchRequestIdentifier
{
  return self->_categoryTypeByFetchRequestIdentifier;
}

- (void)setCategoryTypeByFetchRequestIdentifier:(id)a3
{
}

- (NSArray)categoryTypes
{
  return self->_categoryTypes;
}

- (void)setCategoryTypes:(id)a3
{
}

- (NSDictionary)mediaEntitiesByCategoryType
{
  return self->_mediaEntitiesByCategoryType;
}

- (void)setMediaEntitiesByCategoryType:(id)a3
{
}

- (BOOL)hasMediaEntitiesFetchCompleted
{
  return self->_hasMediaEntitiesFetchCompleted;
}

- (void)setHasMediaEntitiesFetchCompleted:(BOOL)a3
{
  self->_BOOL hasMediaEntitiesFetchCompleted = a3;
}

- (NSArray)genreTitles
{
  return self->_genreTitles;
}

- (void)setGenreTitles:(id)a3
{
}

- (NSArray)genreTypes
{
  return self->_genreTypes;
}

- (void)setGenreTypes:(id)a3
{
}

- (VUIMediaEntitiesFetchController)rentalsUpdateFetchController
{
  return self->_rentalsUpdateFetchController;
}

- (void)setRentalsUpdateFetchController:(id)a3
{
}

- (VUILibraryFamilyMembersDataSource)familyDataSource
{
  return self->_familyDataSource;
}

- (void)setFamilyDataSource:(id)a3
{
}

- (VUIDownloadDataSource)downloadDataSource
{
  return self->_downloadDataSource;
}

- (void)setDownloadDataSource:(id)a3
{
}

- (BOOL)hasDownloadDataSourceFetchCompleted
{
  return self->_hasDownloadDataSourceFetchCompleted;
}

- (void)setHasDownloadDataSourceFetchCompleted:(BOOL)a3
{
  self->_BOOL hasDownloadDataSourceFetchCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadDataSource, 0);
  objc_storeStrong((id *)&self->_familyDataSource, 0);
  objc_storeStrong((id *)&self->_rentalsUpdateFetchController, 0);
  objc_storeStrong((id *)&self->_genreTypes, 0);
  objc_storeStrong((id *)&self->_genreTitles, 0);
  objc_storeStrong((id *)&self->_mediaEntitiesByCategoryType, 0);
  objc_storeStrong((id *)&self->_categoryTypes, 0);
  objc_storeStrong((id *)&self->_categoryTypeByFetchRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaEntitiesFetchController, 0);
  objc_storeStrong((id *)&self->_homeShares, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

void __34__VUIMPMenuDataSource__loadGenres__block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIMPMenuDataSource - missing genre title", buf, 2u);
}

@end