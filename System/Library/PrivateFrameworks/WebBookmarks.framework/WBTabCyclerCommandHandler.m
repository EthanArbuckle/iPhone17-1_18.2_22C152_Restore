@interface WBTabCyclerCommandHandler
- (WBTabCyclerCommandHandler)initWithTabGroupManager:(id)a3;
- (WBTabGroupManager)tabGroupManager;
- (id)_cyclerRepresentationOfProfile:(id)a3;
- (id)_cyclerRepresentationOfTab:(id)a3;
- (id)_cyclerRepresentationOfTabGroup:(id)a3;
- (id)_cyclerRepresentationOfTabGroupFavorite:(id)a3;
- (id)_cyclerRepresentationOfTopScopedBookmarkListForTabGroup:(id)a3;
- (id)_mutableTabBeforeIndex:(unint64_t)a3 inGroup:(id)a4;
- (id)_profileWithIdentifier:(id)a3;
- (id)_tabBeforeIndex:(unint64_t)a3 inGroup:(id)a4;
- (id)_tabGroupBeforeIndex:(unint64_t)a3 inProfileWithIdentifier:(id)a4;
- (id)_tabGroupFavoriteBeforeIndex:(unint64_t)a3 inList:(id)a4;
- (id)_tabGroupWithIdentifier:(id)a3;
- (id)_tabWithIdentifier:(id)a3;
- (id)deviceIdentifier;
- (id)tabGroups;
- (void)_clearLocalProfilesWithCompletionHandler:(id)a3;
- (void)_clearLocalTabGroupsWithCompletionHandler:(id)a3;
- (void)_clearLocalTabGroupsWithCompletionHandler:(id)a3 retryCooldown:(double)a4;
- (void)_clearRemoteProfilesWithCompletionHandler:(id)a3;
- (void)_clearRemoteTabGroupsWithCompletionHandler:(id)a3;
- (void)_deleteProfile:(id)a3 reply:(id)a4;
- (void)_deleteTab:(id)a3 reply:(id)a4;
- (void)_deleteTabGroup:(id)a3 reply:(id)a4;
- (void)_moveTabGroup:(id)a3 toProfileWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6;
- (void)_setSymbolImageName:(id)a3 forProfileWithIdentifier:(id)a4 reply:(id)a5;
- (void)_setTitle:(id)a3 forProfileWithIdentifier:(id)a4 reply:(id)a5;
- (void)_setTitle:(id)a3 forTabGroupWithUUID:(id)a4 reply:(id)a5;
- (void)_setTitle:(id)a3 forTabWithUUID:(id)a4 reply:(id)a5;
- (void)_startMonitoringSyncStatusWithCompletionHandler:(id)a3;
- (void)_startMonitoringTabGroupUpdateExpectingMigration:(BOOL)a3 completionHandler:(id)a4;
- (void)_triggerTabGroupSync;
- (void)clearBookmarksWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (void)createBookmarkListWithTitle:(id)a3 inListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6;
- (void)createBookmarkWithTitle:(id)a3 url:(id)a4 inListWithIdentifier:(id)a5 atIndex:(unint64_t)a6 reply:(id)a7;
- (void)createProfileWithTitle:(id)a3 symbolName:(id)a4 inListWithIdentifier:(id)a5 reply:(id)a6;
- (void)dealloc;
- (void)deleteBookmarkWithIdentifier:(id)a3 reply:(id)a4;
- (void)fetchTopLevelBookmarkList:(id)a3;
- (void)moveBookmarkWithIdentifier:(id)a3 intoListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6;
- (void)setSymbolImageName:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5;
- (void)setTitle:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5;
- (void)setURL:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5;
- (void)syncBookmarksWithCompletionHandler:(id)a3;
@end

@implementation WBTabCyclerCommandHandler

- (WBTabCyclerCommandHandler)initWithTabGroupManager:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WBTabCyclerCommandHandler;
  v6 = [(WBTabCyclerCommandHandler *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tabGroupManager, a3);
    v8 = [WBTabCollection alloc];
    v9 = +[WBCollectionConfiguration safariTabCollectionConfiguration];
    uint64_t v10 = [(WBTabCollection *)v8 initWithConfiguration:v9 openDatabase:1];
    tabCollection = v7->_tabCollection;
    v7->_tabCollection = (WBTabCollection *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x263F66660]) initWithNotificationName:@"com.apple.SafariTabGroupSync.SyncDidFinish"];
    syncAgentNotificationObserver = v7->_syncAgentNotificationObserver;
    v7->_syncAgentNotificationObserver = (WBSDistributedNotificationObserver *)v12;

    v14 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = v7->_tabCollection;
      *(_DWORD *)buf = 138412290;
      v20 = v15;
      _os_log_impl(&dword_21C043000, v14, OS_LOG_TYPE_INFO, "Created Tab Cycler test target with tab collection: %@", buf, 0xCu);
    }
    v16 = v7;
  }

  return v7;
}

- (void)fetchTopLevelBookmarkList:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F66640]) initWithTitle:@"tab-group-container-bookmark" uniqueIdentifier:@"tab-group-container-bookmark-uuid"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = [(WBTabGroupManager *)self->_tabGroupManager profiles];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [(WBTabCyclerCommandHandler *)self _cyclerRepresentationOfProfile:*(void *)(*((void *)&v12 + 1) + 8 * v10)];
        [v5 addChild:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  v4[2](v4, v5);
}

- (void)clearBookmarksWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  char v4 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = @"local and remote";
    if ((v4 & 1) == 0) {
      uint64_t v8 = @"local";
    }
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "Clearing %@ profiles and tab groups", (uint8_t *)&v9, 0xCu);
  }
  if (v4) {
    [(WBTabCyclerCommandHandler *)self _clearRemoteProfilesWithCompletionHandler:v6];
  }
  else {
    [(WBTabCyclerCommandHandler *)self _clearLocalProfilesWithCompletionHandler:v6];
  }
}

- (void)_clearLocalTabGroupsWithCompletionHandler:(id)a3
{
}

- (void)_clearLocalTabGroupsWithCompletionHandler:(id)a3 retryCooldown:(double)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 <= 64.0)
  {
    if ([(WBTabCollection *)self->_tabCollection lockSync])
    {
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      objc_super v18 = __85__WBTabCyclerCommandHandler__clearLocalTabGroupsWithCompletionHandler_retryCooldown___block_invoke_2;
      v19 = &unk_2643DBBF8;
      id v20 = v6;
      [(WBTabCyclerCommandHandler *)self _startMonitoringTabGroupUpdateExpectingMigration:0 completionHandler:&v16];
      tabCollection = self->_tabCollection;
      int v9 = [(WBTabCollection *)tabCollection allNamedTabGroupsUnsorted];
      [(WBTabCollection *)tabCollection deleteItems:v9 leaveTombstones:0];

      [(WBTabCollection *)self->_tabCollection unlockSync];
      [(WBTabGroupManager *)self->_tabGroupManager reloadTabGroupsFromDatabaseWithCompletionHandler:0];
      uint64_t v10 = v20;
    }
    else
    {
      uint64_t v11 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v25 = a4;
        _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "Failed to acquire tab collection lock. Retrying after %f seconds.", buf, 0xCu);
      }
      long long v12 = (void *)MEMORY[0x263EFFA20];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __85__WBTabCyclerCommandHandler__clearLocalTabGroupsWithCompletionHandler_retryCooldown___block_invoke;
      v21[3] = &unk_2643DBBD0;
      v21[4] = self;
      id v22 = v6;
      double v23 = a4;
      long long v13 = [v12 timerWithTimeInterval:0 repeats:v21 block:a4];
      clearLocalTabGroupsRetryTimer = self->_clearLocalTabGroupsRetryTimer;
      self->_clearLocalTabGroupsRetryTimer = v13;

      long long v15 = [MEMORY[0x263EFF9F0] mainRunLoop];
      [v15 addTimer:self->_clearLocalTabGroupsRetryTimer forMode:*MEMORY[0x263EFF478]];

      uint64_t v10 = v22;
    }
  }
  else
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v25 = a4 * 0.5;
      _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "Failed to acquire tab collection lock after backing off to a %f second wait. Giving up.", buf, 0xCu);
    }
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

uint64_t __85__WBTabCyclerCommandHandler__clearLocalTabGroupsWithCompletionHandler_retryCooldown___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearLocalTabGroupsWithCompletionHandler:*(void *)(a1 + 40) retryCooldown:*(double *)(a1 + 48) + *(double *)(a1 + 48)];
}

uint64_t __85__WBTabCyclerCommandHandler__clearLocalTabGroupsWithCompletionHandler_retryCooldown___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 1);
}

- (void)dealloc
{
  [(NSTimer *)self->_clearLocalTabGroupsRetryTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WBTabCyclerCommandHandler;
  [(WBTabCyclerCommandHandler *)&v3 dealloc];
}

- (void)_clearRemoteTabGroupsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__WBTabCyclerCommandHandler__clearRemoteTabGroupsWithCompletionHandler___block_invoke;
  v6[3] = &unk_2643D9E38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_sync(MEMORY[0x263EF83A0], v6);
}

void __72__WBTabCyclerCommandHandler__clearRemoteTabGroupsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) tabGroups];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __72__WBTabCyclerCommandHandler__clearRemoteTabGroupsWithCompletionHandler___block_invoke_2;
    v15[3] = &unk_2643DBBF8;
    id v4 = *(void **)(a1 + 32);
    id v16 = *(id *)(a1 + 40);
    [v4 _startMonitoringSyncStatusWithCompletionHandler:v15];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = objc_msgSend(*(id *)(a1 + 32), "tabGroups", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*(void *)(a1 + 32) + 40) removeTabGroup:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v10();
  }
}

uint64_t __72__WBTabCyclerCommandHandler__clearRemoteTabGroupsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 1);
}

- (void)_clearRemoteProfilesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__WBTabCyclerCommandHandler__clearRemoteProfilesWithCompletionHandler___block_invoke;
  v6[3] = &unk_2643D9E38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_sync(MEMORY[0x263EF83A0], v6);
}

void __71__WBTabCyclerCommandHandler__clearRemoteProfilesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 40) namedProfiles];
  if ([v2 count])
  {

LABEL_4:
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __71__WBTabCyclerCommandHandler__clearRemoteProfilesWithCompletionHandler___block_invoke_2;
    v25[3] = &unk_2643DBBF8;
    id v5 = *(void **)(a1 + 32);
    id v26 = *(id *)(a1 + 40);
    [v5 _startMonitoringSyncStatusWithCompletionHandler:v25];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 40) namedProfiles];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*(void *)(a1 + 32) + 40) removeProfile:*(void *)(*((void *)&v21 + 1) + 8 * i) completionHandler:0];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
      }
      while (v8);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v11 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "namedTabGroupsForProfileWithIdentifier:", *MEMORY[0x263F66420], 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*(void *)(a1 + 32) + 40) removeTabGroup:*(void *)(*((void *)&v17 + 1) + 8 * j)];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v27 count:16];
      }
      while (v13);
    }

    return;
  }
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) namedTabGroupsInDefaultProfile];
  uint64_t v4 = [v3 count];

  if (v4) {
    goto LABEL_4;
  }
  id v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  v16();
}

uint64_t __71__WBTabCyclerCommandHandler__clearRemoteProfilesWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 1);
}

- (void)_clearLocalProfilesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__WBTabCyclerCommandHandler__clearLocalProfilesWithCompletionHandler___block_invoke;
  v10[3] = &unk_2643DBBF8;
  id v11 = v4;
  id v5 = v4;
  [(WBTabCyclerCommandHandler *)self _startMonitoringTabGroupUpdateExpectingMigration:0 completionHandler:v10];
  tabCollection = self->_tabCollection;
  uint64_t v7 = [(WBTabGroupManager *)self->_tabGroupManager namedProfiles];
  [(WBTabCollection *)tabCollection deleteItems:v7 leaveTombstones:0];

  uint64_t v8 = self->_tabCollection;
  uint64_t v9 = [(WBTabGroupManager *)self->_tabGroupManager namedTabGroupsInDefaultProfile];
  [(WBTabCollection *)v8 deleteItems:v9 leaveTombstones:0];

  [(WBTabGroupManager *)self->_tabGroupManager reloadTabGroupsFromDatabaseWithCompletionHandler:0];
}

uint64_t __70__WBTabCyclerCommandHandler__clearLocalProfilesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 1);
}

- (void)createBookmarkListWithTitle:(id)a3 inListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6
{
  uint64_t v10 = (void (**)(id, uint64_t))a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [WBMutableTabGroup alloc];
  uint64_t v14 = [(WBTabCyclerCommandHandler *)self deviceIdentifier];
  long long v15 = [(WBTabGroup *)v13 initWithTitle:v12 deviceIdentifier:v14];

  [(WBMutableTabGroup *)v15 setProfileIdentifier:v11];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__WBTabCyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke;
  block[3] = &unk_2643DA680;
  long long v18 = v15;
  unint64_t v19 = a5;
  block[4] = self;
  id v16 = v15;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  v10[2](v10, 1);
}

void __92__WBTabCyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 40) profileIdentifier];
  id v6 = [v2 _tabGroupBeforeIndex:v3 inProfileWithIdentifier:v4];

  id v5 = (id)[*(id *)(*(void *)(a1 + 32) + 40) insertTabGroup:*(void *)(a1 + 40) afterTabGroup:v6];
}

- (void)createBookmarkWithTitle:(id)a3 url:(id)a4 inListWithIdentifier:(id)a5 atIndex:(unint64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  long long v15 = (void (**)(id, uint64_t))a7;
  int v16 = [v14 hasPrefix:@"TopScopedBookmarkList_"];
  tabGroupManager = self->_tabGroupManager;
  if (!v16)
  {
    unint64_t v19 = [(WBTabGroupManager *)self->_tabGroupManager tabGroupWithUUID:v14];
    if (v19)
    {
      v32 = [WBMutableTab alloc];
      v33 = [(WBTabCyclerCommandHandler *)self deviceIdentifier];
      v34 = [(WBTab *)v32 initWithTitle:v12 url:v13 deviceIdentifier:v33];

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __92__WBTabCyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke;
      block[3] = &unk_2643DBC48;
      block[4] = self;
      id v39 = v19;
      v40 = v34;
      unint64_t v41 = a6;
      v35 = v34;
      dispatch_sync(MEMORY[0x263EF83A0], block);
      v15[2](v15, 1);

      goto LABEL_7;
    }
LABEL_6:
    v15[2](v15, 0);
    goto LABEL_7;
  }
  unint64_t v37 = a6;
  long long v18 = [v14 substringFromIndex:objc_msgSend(@"TopScopedBookmarkList_", "length")];
  unint64_t v19 = [(WBTabGroupManager *)tabGroupManager tabGroupWithUUID:v18];

  if (!v19) {
    goto LABEL_6;
  }
  long long v20 = [(WBTabGroupManager *)self->_tabGroupManager topScopedBookmarkListForTabGroup:v19];
  id v21 = v12;
  long long v22 = [WebBookmark alloc];
  [v13 absoluteString];
  long long v23 = v36 = v13;
  uint64_t v24 = [v20 folderID];
  double v25 = [(WBTabGroupManager *)self->_tabGroupManager deviceIdentifier];
  id v26 = [(WebBookmark *)v22 initWithTitle:v21 address:v23 parentID:v24 subtype:1 deviceIdentifier:v25 collectionType:1];

  v27 = [(WBTabCyclerCommandHandler *)self _tabGroupFavoriteBeforeIndex:v37 inList:v20];
  v28 = self->_tabGroupManager;
  uint64_t v29 = [v20 folderID];
  v30 = [v27 UUID];
  uint64_t v31 = v29;
  id v12 = v21;
  [(WBTabGroupManager *)v28 insertScopedBookmark:v26 inScopedBookmarkFolderWithID:v31 afterBookmarkWithUUID:v30 notify:1];

  id v13 = v36;
  v15[2](v15, 1);

LABEL_7:
}

void __92__WBTabCyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [*(id *)(a1 + 40) uuid];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __92__WBTabCyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_2;
  v6[3] = &unk_2643DBC20;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  uint64_t v9 = *(void *)(a1 + 56);
  [v2 updateTabsInTabGroupWithUUID:v3 persist:1 usingBlock:v6];
}

void __92__WBTabCyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  uint64_t v5 = [v3 arrayWithObjects:&v7 count:1];
  id v6 = objc_msgSend(*(id *)(a1 + 40), "_mutableTabBeforeIndex:inGroup:", *(void *)(a1 + 48), v4, v7, v8);
  [v4 insertTabs:v5 afterTab:v6];
}

- (void)createProfileWithTitle:(id)a3 symbolName:(id)a4 inListWithIdentifier:(id)a5 reply:(id)a6
{
  uint64_t v9 = (void (**)(id, uint64_t, void *))a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = [WBProfile alloc];
  id v13 = [(WBTabCyclerCommandHandler *)self deviceIdentifier];
  id v14 = [(WBProfile *)v12 initWithTitle:v11 symbolImageName:v10 favoritesFolderServerID:@"Favorites Bar" deviceIdentifier:v13];

  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  unint64_t v19 = __90__WBTabCyclerCommandHandler_createProfileWithTitle_symbolName_inListWithIdentifier_reply___block_invoke;
  long long v20 = &unk_2643D9CF8;
  id v21 = self;
  long long v22 = v14;
  long long v15 = v14;
  dispatch_sync(MEMORY[0x263EF83A0], &v17);
  int v16 = [(WBProfile *)v15 identifier];
  v9[2](v9, 1, v16);
}

uint64_t __90__WBTabCyclerCommandHandler_createProfileWithTitle_symbolName_inListWithIdentifier_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) appendProfile:*(void *)(a1 + 40) completionHandler:0];
}

- (void)deleteBookmarkWithIdentifier:(id)a3 reply:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void))a4;
  uint64_t v7 = [(WBTabCyclerCommandHandler *)self _profileWithIdentifier:v10];
  if (v7)
  {
    [(WBTabCyclerCommandHandler *)self _deleteProfile:v7 reply:v6];
  }
  else
  {
    uint64_t v8 = [(WBTabCyclerCommandHandler *)self _tabGroupWithIdentifier:v10];
    if (v8)
    {
      [(WBTabCyclerCommandHandler *)self _deleteTabGroup:v8 reply:v6];
    }
    else
    {
      uint64_t v9 = [(WBTabCyclerCommandHandler *)self _tabWithIdentifier:v10];
      if (v9) {
        [(WBTabCyclerCommandHandler *)self _deleteTab:v9 reply:v6];
      }
      else {
        v6[2](v6, 0);
      }
    }
  }
}

- (void)_deleteProfile:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__WBTabCyclerCommandHandler__deleteProfile_reply___block_invoke;
  v9[3] = &unk_2643D9CF8;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  uint64_t v8 = (void (**)(id, uint64_t))a4;
  dispatch_sync(MEMORY[0x263EF83A0], v9);
  v8[2](v8, 1);
}

uint64_t __50__WBTabCyclerCommandHandler__deleteProfile_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeProfile:*(void *)(a1 + 40) completionHandler:0];
}

- (void)_deleteTabGroup:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__WBTabCyclerCommandHandler__deleteTabGroup_reply___block_invoke;
  v9[3] = &unk_2643D9CF8;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  uint64_t v8 = (void (**)(id, uint64_t))a4;
  dispatch_sync(MEMORY[0x263EF83A0], v9);
  v8[2](v8, 1);
}

uint64_t __51__WBTabCyclerCommandHandler__deleteTabGroup_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeTabGroup:*(void *)(a1 + 40)];
}

- (void)_deleteTab:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__WBTabCyclerCommandHandler__deleteTab_reply___block_invoke;
  block[3] = &unk_2643DBC70;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

void __46__WBTabCyclerCommandHandler__deleteTab_reply___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [*(id *)(a1 + 40) tabGroupUUID];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__WBTabCyclerCommandHandler__deleteTab_reply___block_invoke_2;
  v4[3] = &unk_2643D9B10;
  id v5 = *(id *)(a1 + 40);
  [v2 updateTabsInTabGroupWithUUID:v3 persist:1 usingBlock:v4];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __46__WBTabCyclerCommandHandler__deleteTab_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = a2;
  id v4 = [v2 arrayWithObjects:&v5 count:1];
  objc_msgSend(v3, "deleteTabs:", v4, v5, v6);
}

- (void)moveBookmarkWithIdentifier:(id)a3 intoListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(WBTabCyclerCommandHandler *)self _tabGroupWithIdentifier:v10];
  if (v13)
  {
    [(WBTabCyclerCommandHandler *)self _moveTabGroup:v13 toProfileWithIdentifier:v11 atIndex:a5 reply:v12];
  }
  else
  {
    id v14 = [(WBTabCyclerCommandHandler *)self _tabWithIdentifier:v10];
    long long v15 = [(WBTabCyclerCommandHandler *)self _tabGroupWithIdentifier:v11];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __93__WBTabCyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke;
    block[3] = &unk_2643DBC98;
    block[4] = self;
    id v19 = v14;
    id v20 = v15;
    unint64_t v22 = a5;
    id v21 = v12;
    id v16 = v15;
    id v17 = v14;
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __93__WBTabCyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v7[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 32) _tabBeforeIndex:*(void *)(a1 + 64) inGroup:v4];
  [v2 moveTabs:v3 toTabGroup:v4 afterTab:v5 withoutPersistingTabGroupsWithUUIDStrings:0];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_moveTabGroup:(id)a3 toProfileWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void))a6;
  id v13 = [(WBTabCyclerCommandHandler *)self _profileWithIdentifier:v11];
  id v14 = [v13 identifier];

  if (!v14) {
    v12[2](v12, 0);
  }
  long long v15 = [(WBTabGroupManager *)self->_tabGroupManager namedTabGroupsForProfileWithIdentifier:v11];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __81__WBTabCyclerCommandHandler__moveTabGroup_toProfileWithIdentifier_atIndex_reply___block_invoke;
  v27[3] = &unk_2643DBCC0;
  id v16 = v10;
  id v28 = v16;
  if ([v15 indexOfObjectPassingTest:v27] >= a5) {
    unint64_t v17 = a5;
  }
  else {
    unint64_t v17 = a5 + 1;
  }
  uint64_t v18 = [(WBTabCyclerCommandHandler *)self _tabGroupBeforeIndex:v17 inProfileWithIdentifier:v14];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__WBTabCyclerCommandHandler__moveTabGroup_toProfileWithIdentifier_atIndex_reply___block_invoke_2;
  block[3] = &unk_2643DA550;
  id v23 = v16;
  id v24 = v14;
  double v25 = self;
  id v26 = v18;
  id v19 = v18;
  id v20 = v14;
  id v21 = v16;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  v12[2](v12, 1);
}

uint64_t __81__WBTabCyclerCommandHandler__moveTabGroup_toProfileWithIdentifier_atIndex_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = [*(id *)(a1 + 32) uuid];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __81__WBTabCyclerCommandHandler__moveTabGroup_toProfileWithIdentifier_atIndex_reply___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) profileIdentifier];
  int v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

  uint64_t v4 = *(void **)(*(void *)(a1 + 48) + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v6 = *(void *)(a1 + 56);
    return [v4 moveTabGroup:v5 afterTabGroup:v6];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 56);
    return [v4 moveTabGroup:v5 toProfileWithIdentifier:v8 afterTabGroup:v9];
  }
}

- (void)setTitle:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void))a5;
  id v10 = [(WBTabCyclerCommandHandler *)self _profileWithIdentifier:v8];
  if (v10)
  {
    [(WBTabCyclerCommandHandler *)self _setTitle:v13 forProfileWithIdentifier:v8 reply:v9];
  }
  else
  {
    id v11 = [(WBTabCyclerCommandHandler *)self _tabGroupWithIdentifier:v8];
    if (v11)
    {
      [(WBTabCyclerCommandHandler *)self _setTitle:v13 forTabGroupWithUUID:v8 reply:v9];
    }
    else
    {
      id v12 = [(WBTabCyclerCommandHandler *)self _tabWithIdentifier:v8];
      if (v12) {
        [(WBTabCyclerCommandHandler *)self _setTitle:v13 forTabWithUUID:v8 reply:v9];
      }
      else {
        v9[2](v9, 0);
      }
    }
  }
}

- (void)_setTitle:(id)a3 forTabGroupWithUUID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__WBTabCyclerCommandHandler__setTitle_forTabGroupWithUUID_reply___block_invoke;
  block[3] = &unk_2643DA608;
  void block[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v10 = v8;
  id v11 = v9;
  id v12 = (void (**)(id, uint64_t))a5;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  v12[2](v12, 1);
}

void __65__WBTabCyclerCommandHandler__setTitle_forTabGroupWithUUID_reply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__WBTabCyclerCommandHandler__setTitle_forTabGroupWithUUID_reply___block_invoke_2;
  v3[3] = &unk_2643D9B10;
  id v4 = *(id *)(a1 + 48);
  [v2 updateTabGroupWithUUID:v1 persist:1 usingBlock:v3];
}

uint64_t __65__WBTabCyclerCommandHandler__setTitle_forTabGroupWithUUID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setTitle:*(void *)(a1 + 32)];
}

- (void)_setTitle:(id)a3 forTabWithUUID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__WBTabCyclerCommandHandler__setTitle_forTabWithUUID_reply___block_invoke;
  block[3] = &unk_2643DA608;
  void block[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v10 = v8;
  id v11 = v9;
  id v12 = (void (**)(id, uint64_t))a5;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  v12[2](v12, 1);
}

void __60__WBTabCyclerCommandHandler__setTitle_forTabWithUUID_reply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__WBTabCyclerCommandHandler__setTitle_forTabWithUUID_reply___block_invoke_2;
  v3[3] = &unk_2643DBCE8;
  id v4 = *(id *)(a1 + 48);
  [v2 updateTabWithUUID:v1 persist:1 notify:1 usingBlock:v3];
}

uint64_t __60__WBTabCyclerCommandHandler__setTitle_forTabWithUUID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setTitle:*(void *)(a1 + 32)];
}

- (void)_setTitle:(id)a3 forProfileWithIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__WBTabCyclerCommandHandler__setTitle_forProfileWithIdentifier_reply___block_invoke;
  block[3] = &unk_2643DA608;
  void block[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v10 = v8;
  id v11 = v9;
  id v12 = (void (**)(id, uint64_t))a5;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  v12[2](v12, 1);
}

void __70__WBTabCyclerCommandHandler__setTitle_forProfileWithIdentifier_reply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__WBTabCyclerCommandHandler__setTitle_forProfileWithIdentifier_reply___block_invoke_2;
  v4[3] = &unk_2643DBD10;
  id v5 = *(id *)(a1 + 48);
  id v3 = (id)[v2 updateProfileWithIdentifier:v1 persist:1 usingBlock:v4 completionHandler:0];
}

uint64_t __70__WBTabCyclerCommandHandler__setTitle_forProfileWithIdentifier_reply___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setTitle:*(void *)(a1 + 32)];
}

- (void)setURL:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__WBTabCyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke;
  block[3] = &unk_2643DA608;
  void block[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v10 = v8;
  id v11 = v9;
  id v12 = (void (**)(id, uint64_t))a5;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  v12[2](v12, 1);
}

void __68__WBTabCyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __68__WBTabCyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke_2;
  v3[3] = &unk_2643DBCE8;
  id v4 = *(id *)(a1 + 48);
  [v2 updateTabWithUUID:v1 persist:1 notify:1 usingBlock:v3];
}

uint64_t __68__WBTabCyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setUrl:*(void *)(a1 + 32)];
}

- (void)setSymbolImageName:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  id v10 = [(WBTabCyclerCommandHandler *)self _profileWithIdentifier:v8];
  if (v10) {
    [(WBTabCyclerCommandHandler *)self _setSymbolImageName:v11 forProfileWithIdentifier:v8 reply:v9];
  }
  else {
    v9[2](v9, 0);
  }
}

- (void)_setSymbolImageName:(id)a3 forProfileWithIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__WBTabCyclerCommandHandler__setSymbolImageName_forProfileWithIdentifier_reply___block_invoke;
  block[3] = &unk_2643DA608;
  void block[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v10 = v8;
  id v11 = v9;
  id v12 = (void (**)(id, uint64_t))a5;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  v12[2](v12, 1);
}

void __80__WBTabCyclerCommandHandler__setSymbolImageName_forProfileWithIdentifier_reply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__WBTabCyclerCommandHandler__setSymbolImageName_forProfileWithIdentifier_reply___block_invoke_2;
  v4[3] = &unk_2643DBD10;
  id v5 = *(id *)(a1 + 48);
  id v3 = (id)[v2 updateProfileWithIdentifier:v1 persist:1 usingBlock:v4 completionHandler:0];
}

uint64_t __80__WBTabCyclerCommandHandler__setSymbolImageName_forProfileWithIdentifier_reply___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSymbolImageName:*(void *)(a1 + 32)];
}

- (void)syncBookmarksWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__WBTabCyclerCommandHandler_syncBookmarksWithCompletionHandler___block_invoke;
  v6[3] = &unk_2643D9E38;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __64__WBTabCyclerCommandHandler_syncBookmarksWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tabGroups];
  uint64_t v3 = [v2 count];

  id v4 = *(id **)(a1 + 32);
  if (v3)
  {
    [v4 _startMonitoringSyncStatusWithCompletionHandler:*(void *)(a1 + 40)];
    id v5 = *(void **)(a1 + 32);
    [v5 _triggerTabGroupSync];
  }
  else
  {
    [v4[1] lockSync];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) tabCollection];
    [v6 setSyncData:0 forKey:@"BASyncData"];

    [*(id *)(*(void *)(a1 + 32) + 8) unlockSync];
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __64__WBTabCyclerCommandHandler_syncBookmarksWithCompletionHandler___block_invoke_2;
    id v11 = &unk_2643DBD38;
    id v12 = v7;
    id v13 = *(id *)(a1 + 40);
    [v7 _startMonitoringSyncStatusWithCompletionHandler:&v8];
    objc_msgSend(*(id *)(a1 + 32), "_triggerTabGroupSync", v8, v9, v10, v11, v12);
  }
}

uint64_t __64__WBTabCyclerCommandHandler_syncBookmarksWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _startMonitoringTabGroupUpdateExpectingMigration:1 completionHandler:*(void *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  return [v2 reloadTabGroupsFromDatabaseWithCompletionHandler:0];
}

- (id)deviceIdentifier
{
  return [(WBTabCollection *)self->_tabCollection currentDeviceIdentifier];
}

- (id)tabGroups
{
  return [(WBTabGroupManager *)self->_tabGroupManager allNamedTabGroupsUnsorted];
}

- (void)_triggerTabGroupSync
{
  v2 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21C043000, v2, OS_LOG_TYPE_INFO, "Triggering tab group sync", v4, 2u);
  }
  uint64_t v3 = +[WBTabGroupSyncAgentProxy sharedProxy];
  [v3 scheduleSyncIfNeeded];
}

- (void)_startMonitoringSyncStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__WBTabCyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke;
  v12[3] = &unk_2643DBD60;
  objc_copyWeak(&v14, &location);
  id v5 = v4;
  id v13 = v5;
  [(WBSDistributedNotificationObserver *)self->_syncAgentNotificationObserver setNotificationHandler:v12];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __77__WBTabCyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke_40;
  id v10 = &unk_2643D9D80;
  id v6 = v5;
  id v11 = v6;
  [(WBSDistributedNotificationObserver *)self->_syncAgentNotificationObserver setTimeoutHandler:&v7];
  -[WBSDistributedNotificationObserver waitWithTimeout:](self->_syncAgentNotificationObserver, "waitWithTimeout:", 900.0, v7, v8, v9, v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

BOOL __77__WBTabCyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"syncResult"];

  uint64_t v5 = [v4 integerValue];
  if (v5 == 1)
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_INFO, "Sync finished but local migration has not completed. Waiting for migration to complete.", v14, 2u);
    }
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v6 = v5;
    if (v5 == 5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      BOOL v8 = WeakRetained == 0;
      if (WeakRetained)
      {
        uint64_t v9 = WBS_LOG_CHANNEL_PREFIXCycler();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Sync agent reset sync data. Triggering another sync.", buf, 2u);
        }
        [WeakRetained _triggerTabGroupSync];
      }
    }
    else
    {
      id v11 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "Sync agent finished syncing", v13, 2u);
      }
      (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6 == 0);
      BOOL v8 = 1;
    }
  }

  return v8;
}

uint64_t __77__WBTabCyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke_40(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21C043000, v2, OS_LOG_TYPE_INFO, "Timed out waiting for sync agent to finish syncing", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_startMonitoringTabGroupUpdateExpectingMigration:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  tabGroupManager = self->_tabGroupManager;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __96__WBTabCyclerCommandHandler__startMonitoringTabGroupUpdateExpectingMigration_completionHandler___block_invoke;
  v11[3] = &unk_2643DBD88;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v12 = v8;
  uint64_t v9 = +[_WBTabCyclerTabGroupUpdateObserver observeTabGroupManager:tabGroupManager waitForTabGroups:v4 handler:v11];
  tabGroupUpdateObserver = self->_tabGroupUpdateObserver;
  self->_tabGroupUpdateObserver = v9;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __96__WBTabCyclerCommandHandler__startMonitoringTabGroupUpdateExpectingMigration_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    BOOL v4 = WeakRetained;

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v4;
  }
}

- (id)_tabGroupBeforeIndex:(unint64_t)a3 inProfileWithIdentifier:(id)a4
{
  uint64_t v5 = [(WBTabGroupManager *)self->_tabGroupManager namedTabGroupsForProfileWithIdentifier:a4];
  id v6 = v5;
  if (a3)
  {
    if ([v5 count] >= a3)
    {
      a3 = [v6 objectAtIndexedSubscript:a3 - 1];
    }
    else
    {
      a3 = 0;
    }
  }

  return (id)a3;
}

- (id)_tabBeforeIndex:(unint64_t)a3 inGroup:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    uint64_t v7 = [v5 tabs];
    unint64_t v8 = [v7 count];

    if (v8 >= a3)
    {
      uint64_t v9 = [v6 tabs];
      a3 = [v9 objectAtIndexedSubscript:a3 - 1];
    }
    else
    {
      a3 = 0;
    }
  }

  return (id)a3;
}

- (id)_mutableTabBeforeIndex:(unint64_t)a3 inGroup:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    uint64_t v7 = [v5 tabs];
    unint64_t v8 = [v7 count];

    if (v8 >= a3)
    {
      uint64_t v9 = [v6 tabs];
      a3 = [v9 objectAtIndexedSubscript:a3 - 1];
    }
    else
    {
      a3 = 0;
    }
  }

  return (id)a3;
}

- (id)_tabGroupFavoriteBeforeIndex:(unint64_t)a3 inList:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    if ([v5 bookmarkCount] >= a3)
    {
      uint64_t v7 = [v6 bookmarkArray];
      a3 = [v7 objectAtIndexedSubscript:a3 - 1];
    }
    else
    {
      a3 = 0;
    }
  }

  return (id)a3;
}

- (id)_profileWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WBTabGroupManager *)self->_tabGroupManager profiles];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__WBTabCyclerCommandHandler__profileWithIdentifier___block_invoke;
  v11[3] = &unk_2643DBDB0;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v11];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = [(WBTabGroupManager *)self->_tabGroupManager profiles];
    unint64_t v8 = [v9 objectAtIndexedSubscript:v7];
  }
  return v8;
}

uint64_t __52__WBTabCyclerCommandHandler__profileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_tabGroupWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WBTabCyclerCommandHandler *)self tabGroups];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__WBTabCyclerCommandHandler__tabGroupWithIdentifier___block_invoke;
  v11[3] = &unk_2643DBCC0;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v11];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = [(WBTabCyclerCommandHandler *)self tabGroups];
    unint64_t v8 = [v9 objectAtIndexedSubscript:v7];
  }
  return v8;
}

uint64_t __53__WBTabCyclerCommandHandler__tabGroupWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_tabWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  id v5 = [(WBTabCyclerCommandHandler *)self tabGroups];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__WBTabCyclerCommandHandler__tabWithIdentifier___block_invoke;
  v9[3] = &unk_2643DBE00;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __48__WBTabCyclerCommandHandler__tabWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 tabs];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__WBTabCyclerCommandHandler__tabWithIdentifier___block_invoke_2;
  v13[3] = &unk_2643DBDD8;
  id v14 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 indexOfObjectPassingTest:v13];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [v6 tabs];
    uint64_t v10 = [v9 objectAtIndexedSubscript:v8];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

uint64_t __48__WBTabCyclerCommandHandler__tabWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_cyclerRepresentationOfProfile:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F66648]);
  id v6 = [v4 title];
  id v7 = [v4 symbolImageName];
  uint64_t v8 = [v4 identifier];
  uint64_t v9 = (void *)[v5 initWithTitle:v6 symbolImageName:v7 uniqueIdentifier:v8];

  tabGroupManager = self->_tabGroupManager;
  uint64_t v11 = [v4 identifier];
  uint64_t v12 = [(WBTabGroupManager *)tabGroupManager namedTabGroupsForProfileWithIdentifier:v11];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = -[WBTabCyclerCommandHandler _cyclerRepresentationOfTabGroup:](self, "_cyclerRepresentationOfTabGroup:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
        [v9 addChild:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v9;
}

- (id)_cyclerRepresentationOfTabGroup:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F66650]);
  id v6 = [v4 title];
  id v7 = [v4 uuid];
  uint64_t v8 = (void *)[v5 initWithTitle:v6 uniqueIdentifier:v7];

  uint64_t v9 = [(WBTabCyclerCommandHandler *)self _cyclerRepresentationOfTopScopedBookmarkListForTabGroup:v4];
  [v8 addChild:v9];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = objc_msgSend(v4, "tabs", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [(WBTabCyclerCommandHandler *)self _cyclerRepresentationOfTab:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        [v8 addChild:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v8;
}

- (id)_cyclerRepresentationOfTab:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F66630];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 url];
  id v7 = [v4 title];
  uint64_t v8 = [v4 uuid];

  uint64_t v9 = (void *)[v5 initWithURL:v6 title:v7 uniqueIdentifier:v8];
  return v9;
}

- (id)_cyclerRepresentationOfTopScopedBookmarkListForTabGroup:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WBTabGroupManager *)self->_tabGroupManager topScopedBookmarkListForTabGroup:v4];
  id v6 = objc_alloc(MEMORY[0x263F66658]);
  id v7 = NSString;
  uint64_t v8 = [v4 uuid];
  uint64_t v9 = [v7 stringWithFormat:@"%@%@", @"TopScopedBookmarkList_", v8];
  uint64_t v10 = (void *)[v6 initWithTitle:&stru_26CC2ED50 uniqueIdentifier:v9];

  uint64_t v11 = [v5 bookmarkArray];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [(WBTabCyclerCommandHandler *)self _cyclerRepresentationOfTabGroupFavorite:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        [v10 addChild:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v10;
}

- (id)_cyclerRepresentationOfTabGroupFavorite:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F66630];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = NSURL;
  id v7 = [v4 address];
  uint64_t v8 = [v6 URLWithString:v7];
  uint64_t v9 = [v4 title];
  uint64_t v10 = [v4 UUID];

  uint64_t v11 = (void *)[v5 initWithURL:v8 title:v9 uniqueIdentifier:v10];
  return v11;
}

- (WBTabGroupManager)tabGroupManager
{
  return self->_tabGroupManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong((id *)&self->_clearLocalTabGroupsRetryTimer, 0);
  objc_storeStrong((id *)&self->_syncAgentNotificationObserver, 0);
  objc_storeStrong((id *)&self->_tabGroupUpdateObserver, 0);
  objc_storeStrong((id *)&self->_tabCollection, 0);
}

@end