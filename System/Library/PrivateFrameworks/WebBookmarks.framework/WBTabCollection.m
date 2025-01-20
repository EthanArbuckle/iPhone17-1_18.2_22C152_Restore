@interface WBTabCollection
+ (NSString)deviceIdentifier;
+ (id)databasePathForConfiguration:(id)a3;
+ (id)inMemoryChangeSet;
- (BOOL)_deleteItems:(id)a3 leaveTombstones:(BOOL)a4;
- (BOOL)_deleteTabGroup:(id)a3 leaveTombstone:(BOOL)a4;
- (BOOL)_insertBookmark:(id)a3 afterBookmark:(id)a4 inFolderWithID:(int)a5;
- (BOOL)_insertItems:(id)a3 inParentWithID:(unsigned int)a4 afterItem:(id)a5;
- (BOOL)_insertItemsIntoPlace:(id)a3 inParentWithID:(unsigned int)a4;
- (BOOL)_reorderBookmarkIntoPlace:(id)a3;
- (BOOL)_reorderItem:(id)a3 afterItem:(id)a4;
- (BOOL)_reorderItemIntoPlace:(id)a3;
- (BOOL)_saveBrowserState:(id)a3;
- (BOOL)_saveItem:(id)a3;
- (BOOL)_saveItems:(id)a3;
- (BOOL)_saveSettingsIfNeededForItem:(id)a3;
- (BOOL)_setHasSharedTabGroups;
- (BOOL)_updateItems:(id)a3 inParentWithID:(unsigned int)a4;
- (BOOL)_updatePinnedTabs:(id)a3 privatePinnedTabs:(id)a4;
- (BOOL)_updatePinnedTabsByProfileIdentifier:(id)a3;
- (BOOL)closeWindowState:(id)a3;
- (BOOL)copyTabsDatabase:(id)a3 hidingSensitiveData:(BOOL)a4 error:(id *)a5;
- (BOOL)deleteAllLocalSavedState;
- (BOOL)deleteAllWindowStates;
- (BOOL)deleteItems:(id)a3 leaveTombstones:(BOOL)a4;
- (BOOL)deleteTabGroup:(id)a3;
- (BOOL)deleteTabs:(id)a3;
- (BOOL)deleteWindowState:(id)a3;
- (BOOL)deleteWindowStates:(id)a3;
- (BOOL)hasCompletedMigration;
- (BOOL)hasMultipleProfiles;
- (BOOL)insertItems:(id)a3 inParentWithID:(unsigned int)a4 afterItem:(id)a5;
- (BOOL)insertTab:(id)a3 inTabGroup:(id)a4 afterTab:(id)a5;
- (BOOL)insertTabGroup:(id)a3 afterTabGroup:(id)a4;
- (BOOL)insertTabs:(id)a3 inTabGroup:(id)a4 afterTab:(id)a5;
- (BOOL)isLockedSync;
- (BOOL)isPersistent;
- (BOOL)lockSync;
- (BOOL)reorderItem:(id)a3 afterItem:(id)a4;
- (BOOL)saveBrowserState:(id)a3;
- (BOOL)saveItem:(id)a3;
- (BOOL)saveTabGroup:(id)a3;
- (BOOL)saveWindowState:(id)a3;
- (BOOL)shouldUpdatePresence;
- (BOOL)updateItems:(id)a3 inParentWithID:(unsigned int)a4;
- (BOOL)updateTabs:(id)a3 inTabGroup:(id)a4;
- (NSArray)allMutableNamedTabGroupsUnsorted;
- (NSArray)mutableNamedTabGroupsInDefaultProfile;
- (NSArray)mutableProfiles;
- (NSArray)windowStates;
- (NSError)error;
- (NSString)currentDeviceIdentifier;
- (NSString)defaultProfileIdentifier;
- (WBBookmarkDatabaseSyncData)databaseSyncData;
- (WBBrowserState)browserState;
- (WBBrowserState)lastSessionBrowserState;
- (WBCollectionConfiguration)configuration;
- (WBTabCollection)initWithConfiguration:(id)a3 openDatabase:(BOOL)a4;
- (WBTabCollection)initWithConfiguration:(id)a3 openDatabase:(BOOL)a4 checkIntegrity:(BOOL)a5;
- (WBTabCollection)initWithTabCollection:(id)a3;
- (WebBookmarkTabCollection)tabCollection;
- (id)_activeParticipantsFromParticipantData:(id)a3;
- (id)_allMutableTabGroupsUnsorted;
- (id)_bookmarkListWithFolderID:(int)a3 usingFilter:(id)a4 options:(unint64_t)a5;
- (id)_bookmarksForTabs:(id)a3;
- (id)_bookmarksForTabs:(id)a3 syncable:(BOOL)a4;
- (id)_bookmarksFromItems:(id)a3;
- (id)_collection;
- (id)_collectionWithConfiguration:(id)a3 checkIntegrity:(BOOL)a4;
- (id)_descriptionForScopedBookmark:(id)a3;
- (id)_lastSessionBrowserState;
- (id)_participantDataForTab:(id)a3;
- (id)_profiles;
- (id)_profilesQuery;
- (id)_shareRecordForTabGroup:(id)a3;
- (id)_tabGroupsInDefaultProfile;
- (id)activeParticipantsInTab:(id)a3;
- (id)activeParticipantsInTabGroup:(id)a3;
- (id)devicesForProfile:(id)a3;
- (id)itemsInParentWithID:(unsigned int)a3 ofType:(Class)a4;
- (id)mutableProfileWithIdentifier:(id)a3;
- (id)mutableTabGroupWithUUID:(id)a3;
- (id)mutableTabWithUUID:(id)a3;
- (id)mutableTabsForTabGroup:(id)a3;
- (id)namedTabGroupsForProfileWithIdentifier:(id)a3;
- (id)pinnedTabsForProfileWithIdentifier:(id)a3;
- (id)presenceTabUUIDForParticipantIdentifier:(id)a3 inTabGroup:(id)a4;
- (id)profileWithServerID:(id)a3;
- (id)recordIDForTab:(id)a3;
- (id)scopedBookmarkListWithID:(int)a3;
- (id)scopedBookmarkListWithID:(int)a3 filteredUsingString:(id)a4;
- (id)scopedBookmarkWithUUID:(id)a3;
- (id)serverIDForItemWithID:(int)a3;
- (id)shareRecordForTabGroup:(id)a3;
- (id)syncDataForItem:(id)a3;
- (id)syncDataForItemWithID:(int)a3;
- (id)tabCollectionDataSummaryLogHidingSensitiveData:(BOOL)a3;
- (id)tabGroupMatchingShare:(id)a3 inTabGroups:(id)a4;
- (id)tabGroupUUIDForServerID:(id)a3;
- (id)tabGroupWithUUID:(id)a3;
- (id)tabUUIDForServerID:(id)a3;
- (id)tabWithUUID:(id)a3;
- (id)tabsForTabGroup:(id)a3;
- (id)topScopedBookmarkListForTabGroup:(id)a3;
- (id)windowStateWithUUID:(id)a3;
- (int)frequentlyVisitedSitesFolderIDForProfileWithIdentifier:(id)a3;
- (int)pinnedTabsFolderID;
- (int)pinnedTabsFolderIDForProfileWithIdentifier:(id)a3;
- (int)privatePinnedTabsFolderID;
- (unint64_t)maximumTabsPerGroup;
- (unint64_t)numberOfLocalTabsToBeClosed;
- (void)_addProfile:(id)a3 toLog:(id)a4 hidingSensitiveData:(BOOL)a5;
- (void)_addTabGroup:(id)a3 toLog:(id)a4 hidingSensitiveData:(BOOL)a5;
- (void)_createDatabaseQueue;
- (void)_readPropertiesOfBookmark:(id)a3;
- (void)createTopScopedBookmarkListIfNeededForTabGroup:(id)a3;
- (void)deleteItems:(id)a3 leaveTombstones:(BOOL)a4 completionHandler:(id)a5;
- (void)deleteWindowStates:(id)a3 completionHandler:(id)a4;
- (void)disableSuddenTerminationForPendingChanges;
- (void)enumerateDescendantsOfItemWithID:(int)a3 usingBlock:(id)a4;
- (void)flushDeletedTabsInTabGroup:(id)a3 completionHandler:(id)a4;
- (void)frequentlyVisitedSitesForProfileWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getActiveParticipantsInTab:(id)a3 completionHandler:(id)a4;
- (void)insertItems:(id)a3 inParent:(id)a4 afterItem:(id)a5 completionHandler:(id)a6;
- (void)insertItems:(id)a3 inParentWithID:(unsigned int)a4 afterItem:(id)a5 completionHandler:(id)a6;
- (void)insertItemsIntoPlace:(id)a3 inParent:(id)a4 completionHandler:(id)a5;
- (void)insertItemsIntoPlace:(id)a3 inParentWithID:(unsigned int)a4 completionHandler:(id)a5;
- (void)performMaintenance;
- (void)reloadItems:(id)a3;
- (void)reorderItem:(id)a3 afterItem:(id)a4 completionHandler:(id)a5;
- (void)reorderItemIntoPlace:(id)a3 completionHandler:(id)a4;
- (void)saveBrowserState:(id)a3 completionHandler:(id)a4;
- (void)saveItem:(id)a3 completionHandler:(id)a4;
- (void)saveItems:(id)a3 completionHandler:(id)a4;
- (void)saveMinimumAPISyncVersionOfDescendantItemsForMovedItem:(id)a3;
- (void)saveWindowState:(id)a3 completionHandler:(id)a4;
- (void)setCompletedMigration:(BOOL)a3;
- (void)setFrequentlyVisitedSites:(id)a3 forProfileWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setHasSharedTabGroupsWithCompletionHandler:(id)a3;
- (void)setMaximumTabsPerGroup:(unint64_t)a3;
- (void)shareRecordForTabGroup:(id)a3 completionHandler:(id)a4;
- (void)unlockSync;
- (void)updateItems:(id)a3 inParentWithID:(unsigned int)a4 completionHandler:(id)a5;
- (void)updateTabsInTabGroup:(id)a3 completionHandler:(id)a4;
- (void)waitForPendingChanges;
@end

@implementation WBTabCollection

- (NSString)currentDeviceIdentifier
{
  return (NSString *)[(WebBookmarkCollection *)self->_collection currentDeviceIdentifier];
}

uint64_t __48__WBTabCollection__deleteItems_leaveTombstones___block_invoke(uint64_t a1, void *a2)
{
  return [a2 needsSecureDelete];
}

id __39__WBTabCollection__bookmarksFromItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 bookmark];
  if (!v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __39__WBTabCollection__bookmarksFromItems___block_invoke_cold_1((uint64_t)v2, v4);
    }
  }

  return v3;
}

uint64_t __53__WBTabCollection_saveWindowState_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  [v2 saveWindowState:*(void *)(a1 + 40)];

  v3 = *(id **)(a1 + 56);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __68__WBTabCollection_insertItems_inParent_afterItem_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 48) bookmark];
  objc_msgSend(v2, "_insertItems:inParentWithID:afterItem:", v3, objc_msgSend(v4, "identifier"), *(void *)(a1 + 56));

  v5 = *(id **)(a1 + 72);
  if (v5)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v5);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (BOOL)_insertItems:(id)a3 inParentWithID:(unsigned int)a4 afterItem:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(WBTabCollection *)self _collection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__WBTabCollection__insertItems_inParentWithID_afterItem___block_invoke;
  v14[3] = &unk_2643DAFE8;
  v14[4] = self;
  id v11 = v9;
  id v15 = v11;
  id v12 = v8;
  id v16 = v12;
  unsigned int v17 = a4;
  LOBYTE(a4) = [v10 performDatabaseUpdatesWithTransaction:v14 secureDelete:0];

  return a4;
}

- (BOOL)_deleteItems:(id)a3 leaveTombstones:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "safari_containsObjectPassingTest:", &__block_literal_global_42);
  id v8 = [(WBTabCollection *)self _collection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__WBTabCollection__deleteItems_leaveTombstones___block_invoke_2;
  v12[3] = &unk_2643DB148;
  v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  BOOL v14 = a4;
  char v10 = [v8 performDatabaseUpdatesWithTransaction:v12 secureDelete:v7];

  return v10;
}

uint64_t __57__WBTabCollection__insertItems_inParentWithID_afterItem___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _collection];
  uint64_t v3 = [*(id *)(a1 + 40) bookmark];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      uint64_t v7 = 0;
      id v8 = v3;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        uint64_t v3 = objc_msgSend(v9, "bookmark", (void)v12);
        if (([v2 _saveAndMoveBookmark:v3 toFolderID:*(unsigned int *)(a1 + 56)] & 1) == 0
          || ![v2 _reorderBookmark:v3 afterBookmark:v8])
        {

          uint64_t v10 = 0;
          uint64_t v3 = v8;
          goto LABEL_13;
        }
        [*(id *)(a1 + 32) _saveSettingsIfNeededForItem:v9];

        ++v7;
        id v8 = v3;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v10 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }
LABEL_13:

  return v10;
}

uint64_t __48__WBTabCollection__deleteItems_leaveTombstones___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  uint64_t v3 = [*(id *)(a1 + 32) _bookmarksFromItems:*(void *)(a1 + 40)];
  uint64_t v4 = [v2 _deleteBookmarks:v3 leaveTombstone:*(unsigned __int8 *)(a1 + 48)];

  return v4;
}

- (BOOL)_saveSettingsIfNeededForItem:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v4 bookmark];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __48__WBTabCollection__saveSettingsIfNeededForItem___block_invoke;
    v15[3] = &unk_2643DA0D0;
    id v6 = v4;
    id v16 = v6;
    [v5 performWithFieldsWriteLock:v15];

    uint64_t v7 = [(WBTabCollection *)self _collection];
    id v8 = [v6 modifiedSettingsFieldsByName];
    id v9 = [v6 bookmark];
    uint64_t v10 = [v9 identifier];
    id v11 = [v6 bookmark];
    long long v12 = [v11 serverID];
    char v13 = [v7 saveSettings:v8 inParentWithID:v10 parentServerID:v12];
  }
  else
  {
    char v13 = 1;
  }

  return v13;
}

- (id)_bookmarksFromItems:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_47);
  return v3;
}

void __84__WBTabCollection_frequentlyVisitedSitesForProfileWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = [*(id *)(a1 + 32) _collection];
  id v4 = [*(id *)(a1 + 32) _collection];
  uint64_t v5 = [v4 frequentlyVisitedSitesFolderIDForProfileWithIdentifier:*(void *)(a1 + 40)];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__WBTabCollection_frequentlyVisitedSitesForProfileWithIdentifier_completionHandler___block_invoke_2;
  v7[3] = &unk_2643DAB20;
  id v6 = v2;
  id v8 = v6;
  [v3 enumerateDescendantsOfBookmarkID:v5 usingBlock:v7];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_collection
{
  collection = self->_collection;
  if (!collection)
  {
    id v4 = [(WBTabCollection *)self _collectionWithConfiguration:self->_configuration checkIntegrity:0];
    uint64_t v5 = self->_collection;
    self->_collection = v4;

    collection = self->_collection;
  }
  return collection;
}

uint64_t __30__WBTabCollection__saveItems___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "_collection", (void)v12);
        id v8 = [v6 bookmark];
        char v9 = [v7 _saveBookmark:v8 withSpecialID:0 updateGenerationIfNeeded:1];

        if ((v9 & 1) == 0 || ![*(id *)(a1 + 40) _saveSettingsIfNeededForItem:v6])
        {
          uint64_t v10 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v10 = 1;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }
LABEL_13:

  return v10;
}

uint64_t __34__WBTabCollection_mutableProfiles__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _profiles];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)_profiles
{
  uint64_t v3 = [[WebBookmarkListQuery alloc] initWithBookmarksWhere:@"parent = 0 AND syncable = 1 AND type = 1 AND subtype = 2 AND special_id = 0" folderID:0 orderBy:@"order_index ASC" usingFilter:0];
  uint64_t v4 = [WebBookmarkList alloc];
  uint64_t v5 = [(WBTabCollection *)self _collection];
  id v6 = [(WebBookmarkList *)v4 initWithQuery:v3 skipOffset:0 collection:v5];

  uint64_t v7 = [(WebBookmarkList *)v6 bookmarkArray];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __28__WBTabCollection__profiles__block_invoke;
  v13[3] = &unk_2643DB648;
  v13[4] = self;
  uint64_t v8 = objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", v13);
  char v9 = (void *)v8;
  uint64_t v10 = (void *)MEMORY[0x263EFFA68];
  if (v8) {
    uint64_t v10 = (void *)v8;
  }
  id v11 = v10;

  return v11;
}

id __28__WBTabCollection__profiles__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _collection];
  uint64_t v5 = [v4 profileForBookmark:v3];

  return v5;
}

- (void)saveItems:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  operator new();
}

void __58__WBTabCollection_updateTabsInTabGroup_completionHandler___block_invoke(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (*(unsigned __int8 *)(a1 + 56) == [v5 isSyncable])
  {
    if (a3)
    {
      a3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:(char *)&a3[-1].isa + 7];
    }
    if ([v5 wasAdded])
    {
      id v6 = *(void **)(a1 + 48);
      if (*(unsigned char *)(a1 + 56))
      {
        id v12 = v5;
        uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
        [v6 insertItemsIntoPlace:v7 inParent:*(void *)(a1 + 32) completionHandler:0];
      }
      else
      {
        id v11 = v5;
        uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
        [v6 insertItems:v7 inParent:*(void *)(a1 + 32) afterItem:a3 completionHandler:0];
      }
    }
    else
    {
      if ([v5 wasMoved])
      {
        uint64_t v10 = *(void **)(a1 + 48);
        if (*(unsigned char *)(a1 + 56)) {
          [v10 reorderItemIntoPlace:v5 completionHandler:0];
        }
        else {
          [v10 reorderItem:v5 afterItem:a3 completionHandler:0];
        }
      }
      if ([v5 wasModified]) {
        [*(id *)(a1 + 48) saveItem:v5 completionHandler:0];
      }
    }
    [v5 markClean];
  }
  else
  {
    a3 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_FAULT))
    {
      uint64_t v8 = [v5 privacyPreservingDescription];
      char v9 = [*(id *)(a1 + 32) privacyPreservingDescription];
      __58__WBTabCollection_updateTabsInTabGroup_completionHandler___block_invoke_cold_1(v8, v9, buf, a3);
    }
  }
}

- (void)insertItems:(id)a3 inParent:(id)a4 afterItem:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  operator new();
}

- (WBTabCollection)initWithConfiguration:(id)a3 openDatabase:(BOOL)a4
{
  return [(WBTabCollection *)self initWithConfiguration:a3 openDatabase:a4 checkIntegrity:0];
}

void __31__WBTabCollection_browserState__block_invoke(uint64_t a1)
{
  uint64_t v2 = [WBBrowserState alloc];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 16) pinnedTabs];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) privatePinnedTabs];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) windowStates];
  uint64_t v5 = [(WBBrowserState *)v2 initWithPinnedTabs:v8 privatePinnedTabs:v3 windowStates:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __47__WBTabCollection_saveItems_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _saveItems:*(void *)(a1 + 40)];
  uint64_t v2 = *(id **)(a1 + 56);
  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (BOOL)_saveItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WBTabCollection *)self _collection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __30__WBTabCollection__saveItems___block_invoke;
  v8[3] = &unk_2643DA270;
  id v6 = v4;
  id v9 = v6;
  id v10 = self;
  LOBYTE(self) = [v5 performDatabaseUpdatesWithTransaction:v8 secureDelete:0];

  return (char)self;
}

- (WBBrowserState)browserState
{
  MEMORY[0x21D4A0CC0](v13, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__4;
  id v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__WBTabCollection_browserState__block_invoke;
  block[3] = &unk_2643DA920;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
  return (WBBrowserState *)v4;
}

- (BOOL)hasCompletedMigration
{
  MEMORY[0x21D4A0CC0](v10, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__WBTabCollection_hasCompletedMigration__block_invoke;
  block[3] = &unk_2643DA920;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(databaseQueue, block);
  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v10);
  return (char)self;
}

- (WBTabCollection)initWithConfiguration:(id)a3 openDatabase:(BOOL)a4 checkIntegrity:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if ([v8 collectionType] != 1)
  {
    long long v13 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[WBTabCollection initWithConfiguration:openDatabase:checkIntegrity:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
    id v9 = 0;
    goto LABEL_8;
  }
  v22.receiver = self;
  v22.super_class = (Class)WBTabCollection;
  id v9 = [(WBTabCollection *)&v22 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id v11 = (void *)*((void *)v9 + 3);
    *((void *)v9 + 3) = v10;

    *((void *)v9 + 4) = [v8 maximumTabsPerTabGroup];
    [v9 _createDatabaseQueue];
    if (v6)
    {
      uint64_t v12 = [v9 _collectionWithConfiguration:v8 checkIntegrity:v5];
      self = (WBTabCollection *)*((void *)v9 + 2);
      *((void *)v9 + 2) = v12;
LABEL_8:
    }
  }

  return (WBTabCollection *)v9;
}

- (void)_createDatabaseQueue
{
  objc_msgSend(NSString, "stringWithFormat:", @"com.apple.WebBookmarks.WBTabCollection.databaseQueue.%p", self);
  id v7 = objc_claimAutoreleasedReturnValue();
  id v3 = (const char *)[v7 UTF8String];
  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  BOOL v5 = (OS_dispatch_queue *)dispatch_queue_create(v3, v4);
  databaseQueue = self->_databaseQueue;
  self->_databaseQueue = v5;
}

uint64_t __65__WBTabCollection_deleteItems_leaveTombstones_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _deleteItems:*(void *)(a1 + 40) leaveTombstones:*(unsigned __int8 *)(a1 + 64)];
  uint64_t v2 = *(id **)(a1 + 56);
  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (NSArray)mutableProfiles
{
  MEMORY[0x21D4A0CC0](v13, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__4;
  id v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__WBTabCollection_mutableProfiles__block_invoke;
  block[3] = &unk_2643DA920;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
  return (NSArray *)v4;
}

- (WBCollectionConfiguration)configuration
{
  return self->_configuration;
}

- (id)_collectionWithConfiguration:(id)a3 checkIntegrity:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ((unint64_t)[v5 storeOwner] >= 3) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = (objc_class *)objc_opt_class();
  }
  MEMORY[0x21D4A0CC0](v26, @"com.apple.WebBookmarks.WBTabCollection");
  char v7 = [v5 isReadonly];
  if (v7 & 1) != 0 || ([(objc_class *)v6 lockSync])
  {
    id v8 = (void *)[[v6 alloc] initWithConfiguration:v5 checkIntegrity:v4];
    if ((v7 & 1) == 0) {
      [(objc_class *)v6 unlockSync];
    }
    if (!v8)
    {
      uint64_t v9 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[WBTabCollection _collectionWithConfiguration:checkIntegrity:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  else
  {
    uint64_t v17 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[WBTabCollection _collectionWithConfiguration:checkIntegrity:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
    id v8 = 0;
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v26);

  return v8;
}

- (void)updateTabsInTabGroup:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(WBTabCollection *)self flushDeletedTabsInTabGroup:v6 completionHandler:0];
  char v8 = [v6 isSyncable];
  uint64_t v9 = [v6 allTabs];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__WBTabCollection_updateTabsInTabGroup_completionHandler___block_invoke;
  v16[3] = &unk_2643DB468;
  char v20 = v8;
  id v10 = v6;
  id v17 = v10;
  id v18 = v9;
  uint64_t v19 = self;
  id v11 = v9;
  [v11 enumerateObjectsUsingBlock:v16];
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__WBTabCollection_updateTabsInTabGroup_completionHandler___block_invoke_89;
  block[3] = &unk_2643DB490;
  id v15 = v7;
  id v13 = v7;
  dispatch_async(databaseQueue, block);
}

- (void)flushDeletedTabsInTabGroup:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 deletedTabs];
  uint64_t v9 = (void *)[v8 copy];

  [v6 clearDeletedTabs];
  uint64_t v10 = [v6 isSyncable];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__WBTabCollection_flushDeletedTabsInTabGroup_completionHandler___block_invoke;
  v14[3] = &unk_2643DB4B8;
  id v11 = v6;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  id v13 = v7;
  id v17 = self;
  id v18 = v13;
  [(WBTabCollection *)self deleteItems:v12 leaveTombstones:v10 completionHandler:v14];
}

- (void)deleteItems:(id)a3 leaveTombstones:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  operator new();
}

void __64__WBTabCollection_flushDeletedTabsInTabGroup_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) setDeletedTabs:*(void *)(a1 + 40)];
  }
  id v3 = *(void **)(a1 + 56);
  if (v3)
  {
    BOOL v4 = *(NSObject **)(*(void *)(a1 + 48) + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__WBTabCollection_flushDeletedTabsInTabGroup_completionHandler___block_invoke_2;
    block[3] = &unk_2643DB490;
    id v6 = v3;
    dispatch_async(v4, block);
  }
}

void __40__WBTabCollection_hasCompletedMigration__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [v3 syncStringForKey:@"hasMigrated"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (void)saveWindowState:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  operator new();
}

- (void)frequentlyVisitedSitesForProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__WBTabCollection_frequentlyVisitedSitesForProfileWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_2643DB338;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);
}

+ (id)inMemoryChangeSet
{
  return +[WebBookmarkTabCollection inMemoryChangeSet];
}

+ (NSString)deviceIdentifier
{
  uint64_t v2 = +[WebBookmarkCollection deviceIdentifierForCloudKitWithCollectionType:1 generateIfNeeded:1];
  id v3 = [v2 UUID];
  BOOL v4 = [v3 UUIDString];

  return (NSString *)v4;
}

+ (id)databasePathForConfiguration:(id)a3
{
  id v3 = +[WebBookmarkCollection databasePathForConfiguration:a3];
  return v3;
}

- (WBTabCollection)initWithTabCollection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBTabCollection;
  id v6 = [(WBTabCollection *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    [(WBTabCollection *)v6 _createDatabaseQueue];
    objc_storeStrong((id *)&v7->_collection, a3);
    char v8 = v7;
  }

  return v7;
}

- (void)setCompletedMigration:(BOOL)a3
{
  MEMORY[0x21D4A0CC0](v8, @"com.apple.WebBookmarks.WBTabCollection");
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__WBTabCollection_setCompletedMigration___block_invoke;
  block[3] = &unk_2643DA810;
  void block[4] = self;
  BOOL v7 = a3;
  dispatch_sync(databaseQueue, block);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v8);
}

void __41__WBTabCollection_setCompletedMigration___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  if (*(unsigned char *)(a1 + 40)) {
    id v3 = @"1";
  }
  else {
    id v3 = 0;
  }
  id v4 = v2;
  [v2 syncSetString:v3 forKey:@"hasMigrated"];
}

- (NSError)error
{
  MEMORY[0x21D4A0CC0](v13, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__4;
  id v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__WBTabCollection_error__block_invoke;
  block[3] = &unk_2643DA920;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
  return (NSError *)v4;
}

void __24__WBTabCollection_error__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [v5 _errorForMostRecentSQLiteError];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)isPersistent
{
  return ![(WBCollectionConfiguration *)self->_configuration isInMemoryDatabase];
}

- (void)disableSuddenTerminationForPendingChanges
{
}

id *__60__WBTabCollection_disableSuddenTerminationForPendingChanges__block_invoke(uint64_t a1)
{
  uint64_t result = *(id **)(a1 + 32);
  if (result)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(result);
    JUMPOUT(0x21D4A0CE0);
  }
  return result;
}

- (void)waitForPendingChanges
{
}

- (WBBrowserState)lastSessionBrowserState
{
  MEMORY[0x21D4A0CC0](v13, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__4;
  id v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__WBTabCollection_lastSessionBrowserState__block_invoke;
  block[3] = &unk_2643DA920;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
  return (WBBrowserState *)v4;
}

uint64_t __42__WBTabCollection_lastSessionBrowserState__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _lastSessionBrowserState];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)_lastSessionBrowserState
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [WBBrowserState alloc];
  uint64_t v4 = [(WebBookmarkTabCollection *)self->_collection pinnedTabs];
  id v5 = [(WebBookmarkTabCollection *)self->_collection privatePinnedTabs];
  id v6 = [(WebBookmarkTabCollection *)self->_collection lastSessionWindowStates];
  uint64_t v7 = [(WBBrowserState *)v3 initWithPinnedTabs:v4 privatePinnedTabs:v5 windowStates:v6];

  char v8 = [MEMORY[0x263EFF9A0] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [(WBTabCollection *)self _profiles];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v13 kind])
        {
          collection = self->_collection;
          id v15 = [v13 identifier];
          id v16 = [(WebBookmarkTabCollection *)collection pinnedTabsForProfileWithIdentifier:v15];
          id v17 = [v13 identifier];
          [v8 setObject:v16 forKeyedSubscript:v17];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  [(WBBrowserState *)v7 setPinnedTabsByProfileIdentifier:v8];
  return v7;
}

- (BOOL)saveBrowserState:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v15, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__WBTabCollection_saveBrowserState___block_invoke;
  id v8[3] = &unk_2643DAF78;
  id v9 = v4;
  uint64_t v10 = &v11;
  void v8[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (char)self;
}

uint64_t __36__WBTabCollection_saveBrowserState___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _saveBrowserState:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_saveBrowserState:(id)a3
{
  id v4 = a3;
  id v5 = [(WBTabCollection *)self _collection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__WBTabCollection__saveBrowserState___block_invoke;
  id v8[3] = &unk_2643DA270;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = self;
  LOBYTE(self) = [v5 performDatabaseUpdatesWithTransaction:v8 secureDelete:1];

  return (char)self;
}

uint64_t __37__WBTabCollection__saveBrowserState___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) pinnedTabs];
  uint64_t v3 = objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_34);

  id v4 = [*(id *)(a1 + 32) privatePinnedTabs];
  id v5 = objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_36);

  if (([*(id *)(a1 + 40) _updatePinnedTabs:v3 privatePinnedTabs:v5] & 1) != 0
    && (id v6 = *(void **)(a1 + 40),
        [*(id *)(a1 + 32) pinnedTabsByProfileIdentifier],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v6) = [v6 _updatePinnedTabsByProfileIdentifier:v7],
        v7,
        (v6 & 1) != 0))
  {
    char v8 = [*(id *)(a1 + 40) _collection];
    [*(id *)(a1 + 32) windowStates];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          if ((objc_msgSend(v8, "_saveWindowState:", *(void *)(*((void *)&v15 + 1) + 8 * v12), (void)v15) & 1) == 0)
          {

            goto LABEL_15;
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    if ([v8 _markWindowStatesAsLastSession:v9]) {
      uint64_t v13 = [v8 _deleteWindowsNotInLastSession];
    }
    else {
LABEL_15:
    }
      uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

id __37__WBTabCollection__saveBrowserState___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)[a2 mutableCopy];
  return v2;
}

id __37__WBTabCollection__saveBrowserState___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)[a2 mutableCopy];
  return v2;
}

- (void)saveBrowserState:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  operator new();
}

uint64_t __54__WBTabCollection_saveBrowserState_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _saveBrowserState:*(void *)(a1 + 40)];
  uint64_t v2 = *(id **)(a1 + 56);
  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (BOOL)deleteAllLocalSavedState
{
  MEMORY[0x21D4A0CC0](v10, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__WBTabCollection_deleteAllLocalSavedState__block_invoke;
  block[3] = &unk_2643DA920;
  void block[4] = self;
  void block[5] = &v6;
  dispatch_sync(databaseQueue, block);
  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v10);
  return (char)self;
}

void __43__WBTabCollection_deleteAllLocalSavedState__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__WBTabCollection_deleteAllLocalSavedState__block_invoke_2;
  v3[3] = &unk_2643DA0F8;
  v3[4] = *(void *)(a1 + 32);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 performDatabaseUpdatesWithTransaction:v3 secureDelete:1];
}

uint64_t __43__WBTabCollection_deleteAllLocalSavedState__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  char v3 = [v2 _deleteAllWindowStates];

  if ((v3 & 1) == 0) {
    return 0;
  }
  id v4 = [*(id *)(a1 + 32) _collection];
  uint64_t v5 = [v4 _deleteAllLocalTabsAndGroups];

  return v5;
}

- (unint64_t)numberOfLocalTabsToBeClosed
{
  MEMORY[0x21D4A0CC0](v11, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__WBTabCollection_numberOfLocalTabsToBeClosed__block_invoke;
  block[3] = &unk_2643DA920;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v11);
  return v4;
}

void __46__WBTabCollection_numberOfLocalTabsToBeClosed__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 _countOfAllLocalTabsToBeDeleted];
}

- (BOOL)insertItems:(id)a3 inParentWithID:(unsigned int)a4 afterItem:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  MEMORY[0x21D4A0CC0](v23, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  databaseQueue = self->_databaseQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__WBTabCollection_insertItems_inParentWithID_afterItem___block_invoke;
  v14[3] = &unk_2643DB010;
  void v14[4] = self;
  id v15 = v8;
  unsigned int v18 = a4;
  id v16 = v9;
  long long v17 = &v19;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(databaseQueue, v14);
  LOBYTE(v9) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v23);
  return (char)v9;
}

uint64_t __56__WBTabCollection_insertItems_inParentWithID_afterItem___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _insertItems:*(void *)(a1 + 40) inParentWithID:*(unsigned int *)(a1 + 64) afterItem:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)insertItems:(id)a3 inParentWithID:(unsigned int)a4 afterItem:(id)a5 completionHandler:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  operator new();
}

uint64_t __74__WBTabCollection_insertItems_inParentWithID_afterItem_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _insertItems:*(void *)(a1 + 40) inParentWithID:*(unsigned int *)(a1 + 72) afterItem:*(void *)(a1 + 48)];
  id v2 = *(id **)(a1 + 64);
  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    unint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (BOOL)_insertItemsIntoPlace:(id)a3 inParentWithID:(unsigned int)a4
{
  id v6 = a3;
  uint64_t v7 = [(WBTabCollection *)self _collection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__WBTabCollection__insertItemsIntoPlace_inParentWithID___block_invoke;
  id v10[3] = &unk_2643DA880;
  v10[4] = self;
  id v8 = v6;
  id v11 = v8;
  unsigned int v12 = a4;
  LOBYTE(a4) = [v7 performDatabaseUpdatesWithTransaction:v10 secureDelete:0];

  return a4;
}

uint64_t __56__WBTabCollection__insertItemsIntoPlace_inParentWithID___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _collection];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "bookmark", (void)v13);
        if ([v8 isSyncable])
        {
          id v9 = [v8 syncPosition];
          uint64_t v10 = objc_msgSend(v2, "orderIndexOfBookmark:withSyncPosition:inFolderWithID:", v8, v9, objc_msgSend(v8, "parentID"));
        }
        else
        {
          uint64_t v10 = [v8 orderIndex];
        }
        if (([v2 _saveAndMoveBookmark:v8 toFolderID:*(unsigned int *)(a1 + 48) orderIndex:v10] & 1) == 0)
        {

          uint64_t v11 = 0;
          goto LABEL_14;
        }
        [*(id *)(a1 + 32) _saveSettingsIfNeededForItem:v7];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 1;
LABEL_14:

  return v11;
}

- (void)insertItemsIntoPlace:(id)a3 inParentWithID:(unsigned int)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  operator new();
}

uint64_t __73__WBTabCollection_insertItemsIntoPlace_inParentWithID_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _insertItemsIntoPlace:*(void *)(a1 + 40) inParentWithID:*(unsigned int *)(a1 + 64)];
  id v2 = *(id **)(a1 + 56);
  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)insertItemsIntoPlace:(id)a3 inParent:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  operator new();
}

uint64_t __67__WBTabCollection_insertItemsIntoPlace_inParent_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) bookmark];
  objc_msgSend(v2, "_insertItemsIntoPlace:inParentWithID:", v3, objc_msgSend(v4, "identifier"));

  uint64_t v5 = *(id **)(a1 + 64);
  if (v5)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v5);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (BOOL)_saveItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WBTabCollection *)self _collection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __29__WBTabCollection__saveItem___block_invoke;
  v9[3] = &unk_2643DA270;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  char v7 = [v5 performDatabaseUpdatesWithTransaction:v9 secureDelete:0];

  return v7;
}

uint64_t __29__WBTabCollection__saveItem___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  uint64_t v3 = [*(id *)(a1 + 40) bookmark];
  char v4 = [v2 _saveBookmark:v3 withSpecialID:0 updateGenerationIfNeeded:1];

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  return [v5 _saveSettingsIfNeededForItem:v6];
}

void __48__WBTabCollection__saveSettingsIfNeededForItem___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modifiedSettingsFieldsByName];
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v5 = v2;
    char v4 = [v2 allValues];
    [v3 resumeIncrementingFields:v4];

    id v2 = v5;
  }
}

- (BOOL)saveItem:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v15, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v11 = 0;
  unsigned int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28__WBTabCollection_saveItem___block_invoke;
  id v8[3] = &unk_2643DAF78;
  id v9 = v4;
  id v10 = &v11;
  void v8[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (char)self;
}

uint64_t __28__WBTabCollection_saveItem___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _saveItem:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)saveItem:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  operator new();
}

uint64_t __46__WBTabCollection_saveItem_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _saveItem:*(void *)(a1 + 40)];
  id v2 = *(id **)(a1 + 56);
  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (BOOL)_reorderItem:(id)a3 afterItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBTabCollection *)self _collection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __42__WBTabCollection__reorderItem_afterItem___block_invoke;
  id v13[3] = &unk_2643DB0D8;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  char v11 = [v8 performDatabaseUpdatesWithTransaction:v13 secureDelete:0];

  return v11;
}

uint64_t __42__WBTabCollection__reorderItem_afterItem___block_invoke(id *a1)
{
  id v2 = [a1[4] _collection];
  uint64_t v3 = [a1[5] bookmark];
  id v4 = [a1[6] bookmark];
  uint64_t v5 = [v2 _reorderBookmark:v3 afterBookmark:v4];

  return v5;
}

- (BOOL)reorderItem:(id)a3 afterItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  MEMORY[0x21D4A0CC0](v20, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__WBTabCollection_reorderItem_afterItem___block_invoke;
  block[3] = &unk_2643DB100;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(databaseQueue, block);
  LOBYTE(v7) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v20);
  return (char)v7;
}

uint64_t __41__WBTabCollection_reorderItem_afterItem___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _reorderItem:*(void *)(a1 + 40) afterItem:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)reorderItem:(id)a3 afterItem:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  operator new();
}

uint64_t __59__WBTabCollection_reorderItem_afterItem_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _reorderItem:*(void *)(a1 + 40) afterItem:*(void *)(a1 + 48)];
  id v2 = *(id **)(a1 + 64);
  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (BOOL)_reorderItemIntoPlace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WBTabCollection *)self _collection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__WBTabCollection__reorderItemIntoPlace___block_invoke;
  v9[3] = &unk_2643DA270;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  char v7 = [v5 performDatabaseUpdatesWithTransaction:v9 secureDelete:0];

  return v7;
}

uint64_t __41__WBTabCollection__reorderItemIntoPlace___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) bookmark];
  uint64_t v3 = [v1 _reorderBookmarkIntoPlace:v2];

  return v3;
}

- (void)reorderItemIntoPlace:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  operator new();
}

uint64_t __58__WBTabCollection_reorderItemIntoPlace_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _reorderItemIntoPlace:*(void *)(a1 + 40)];
  id v2 = *(id **)(a1 + 56);
  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (BOOL)deleteItems:(id)a3 leaveTombstones:(BOOL)a4
{
  id v6 = a3;
  MEMORY[0x21D4A0CC0](v19, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__WBTabCollection_deleteItems_leaveTombstones___block_invoke;
  block[3] = &unk_2643DB170;
  id v12 = v6;
  id v13 = &v15;
  void block[4] = self;
  BOOL v14 = a4;
  id v8 = v6;
  dispatch_sync(databaseQueue, block);
  char v9 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v19);
  return v9;
}

uint64_t __47__WBTabCollection_deleteItems_leaveTombstones___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _deleteItems:*(void *)(a1 + 40) leaveTombstones:*(unsigned __int8 *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_updateItems:(id)a3 inParentWithID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "safari_containsObjectPassingTest:", &__block_literal_global_44);
  id v8 = [(WBTabCollection *)self _collection];
  char v9 = [(WBTabCollection *)self _bookmarksFromItems:v6];
  LOBYTE(v4) = [v8 updateBookmarks:v9 inFolderWithID:v4 secureDelete:v7];

  return v4;
}

uint64_t __47__WBTabCollection__updateItems_inParentWithID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 needsSecureDelete];
}

- (BOOL)updateItems:(id)a3 inParentWithID:(unsigned int)a4
{
  id v6 = a3;
  MEMORY[0x21D4A0CC0](v18, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__WBTabCollection_updateItems_inParentWithID___block_invoke;
  block[3] = &unk_2643DB1E0;
  id v11 = v6;
  id v12 = &v14;
  void block[4] = self;
  unsigned int v13 = a4;
  id v8 = v6;
  dispatch_sync(databaseQueue, block);
  LOBYTE(a4) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return a4;
}

uint64_t __46__WBTabCollection_updateItems_inParentWithID___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _updateItems:*(void *)(a1 + 40) inParentWithID:*(unsigned int *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)updateItems:(id)a3 inParentWithID:(unsigned int)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  operator new();
}

uint64_t __64__WBTabCollection_updateItems_inParentWithID_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateItems:*(void *)(a1 + 40) inParentWithID:*(unsigned int *)(a1 + 64)];
  id v2 = *(id **)(a1 + 56);
  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (id)itemsInParentWithID:(unsigned int)a3 ofType:(Class)a4
{
  MEMORY[0x21D4A0CC0](v18, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v12 = 0;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__4;
  uint64_t v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__WBTabCollection_itemsInParentWithID_ofType___block_invoke;
  block[3] = &unk_2643DB250;
  void block[4] = self;
  void block[5] = &v12;
  unsigned int v11 = a3;
  void block[6] = a4;
  dispatch_sync(databaseQueue, block);
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v8;
}

void __46__WBTabCollection_itemsInParentWithID_ofType___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__WBTabCollection_itemsInParentWithID_ofType___block_invoke_2;
  v7[3] = &unk_2643DB228;
  uint64_t v2 = *(void *)(a1 + 32);
  int v8 = *(_DWORD *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 48);
  void v7[4] = v2;
  v7[5] = v3;
  uint64_t v4 = __46__WBTabCollection_itemsInParentWithID_ofType___block_invoke_2((uint64_t)v7);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

id __46__WBTabCollection_itemsInParentWithID_ofType___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  uint64_t v3 = [v2 listWithID:*(unsigned int *)(a1 + 48)];

  uint64_t v4 = [v3 bookmarkArray];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__WBTabCollection_itemsInParentWithID_ofType___block_invoke_3;
  v7[3] = &__block_descriptor_40_e48____WBBookmarkRepresentable__16__0__WebBookmark_8lu32l8;
  void v7[4] = *(void *)(a1 + 40);
  uint64_t v5 = objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", v7);

  return v5;
}

id __46__WBTabCollection_itemsInParentWithID_ofType___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)[objc_alloc(*(Class *)(a1 + 32)) initWithBookmark:v3];

  return v4;
}

- (void)reloadItems:(id)a3
{
  id v3 = a3;
  operator new();
}

id *__31__WBTabCollection_reloadItems___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v11 + 1) + 8 * v5);
        id v7 = objc_msgSend(*(id *)(a1 + 40), "_collection", (void)v11);
        int v8 = [v6 bookmark];
        char v9 = objc_msgSend(v7, "bookmarkWithID:", objc_msgSend(v8, "identifier"));
        [v6 setBookmark:v9];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }

  uint64_t result = *(id **)(a1 + 48);
  if (result)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(result);
    return (id *)MEMORY[0x21D4A0CE0]();
  }
  return result;
}

- (void)saveMinimumAPISyncVersionOfDescendantItemsForMovedItem:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(WBTabCollection *)self _collection];
  uint64_t v5 = [(WBTabCollection *)self _collection];
  id v6 = [v8 bookmark];
  id v7 = objc_msgSend(v5, "bookmarkWithID:", objc_msgSend(v6, "identifier"));
  [v4 saveMinimumAPISyncVersionOfDescendantItemsForItem:v7 includingAncestorItem:0];
}

- (void)enumerateDescendantsOfItemWithID:(int)a3 usingBlock:(id)a4
{
  id v6 = a4;
  MEMORY[0x21D4A0CC0](v12, @"com.apple.WebBookmarks.WBTabCollection");
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__WBTabCollection_enumerateDescendantsOfItemWithID_usingBlock___block_invoke;
  v9[3] = &unk_2643DB2A0;
  int v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(databaseQueue, v9);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v12);
}

void __63__WBTabCollection_enumerateDescendantsOfItemWithID_usingBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__WBTabCollection_enumerateDescendantsOfItemWithID_usingBlock___block_invoke_2;
  v4[3] = &unk_2643DAC58;
  id v5 = *(id *)(a1 + 40);
  [v2 enumerateDescendantsOfBookmarkID:v3 usingBlock:v4];
}

uint64_t __63__WBTabCollection_enumerateDescendantsOfItemWithID_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_updatePinnedTabs:(id)a3 privatePinnedTabs:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v27 = [v6 count];
    __int16 v28 = 2048;
    uint64_t v29 = [v7 count];
    _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Update %zu pinned tabs and %zu private pinned tabs", buf, 0x16u);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  char v9 = objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v13 setSyncable:0];
        long long v14 = [v13 bookmark];
        [(WBTabCollection *)self _readPropertiesOfBookmark:v14];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  uint64_t v15 = [(WBTabCollection *)self _collection];
  uint64_t v16 = [v6 valueForKey:@"bookmark"];
  char v17 = objc_msgSend(v15, "_updateBookmarks:inFolderWithID:", v16, objc_msgSend(v15, "pinnedTabsFolderID"));

  if (v17)
  {
    char v18 = [v7 valueForKey:@"bookmark"];
    char v19 = objc_msgSend(v15, "_updateBookmarks:inFolderWithID:", v18, objc_msgSend(v15, "privatePinnedTabsFolderID"));
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (BOOL)_updatePinnedTabsByProfileIdentifier:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v22 = a3;
  if ([v22 count])
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __56__WBTabCollection__updatePinnedTabsByProfileIdentifier___block_invoke;
    v38[3] = &unk_2643DB2C8;
    id v5 = v4;
    id v39 = v5;
    long long v21 = v5;
    [v22 enumerateKeysAndObjectsUsingBlock:v38];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = [v5 objectEnumerator];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v40 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v31;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v31 != v13) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8 * j);
                [v15 setSyncable:0];
                uint64_t v16 = [v15 bookmark];
                [(WBTabCollection *)self _readPropertiesOfBookmark:v16];
              }
              uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v40 count:16];
            }
            while (v12);
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v7);
    }

    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    char v17 = [(WBTabCollection *)self _collection];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __56__WBTabCollection__updatePinnedTabsByProfileIdentifier___block_invoke_3;
    id v23[3] = &unk_2643DB310;
    id v24 = v17;
    v25 = &v26;
    id v18 = v17;
    [v21 enumerateKeysAndObjectsUsingBlock:v23];
    BOOL v19 = *((unsigned char *)v27 + 24) == 0;

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    BOOL v19 = 1;
  }

  return v19;
}

void __56__WBTabCollection__updatePinnedTabsByProfileIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_58);
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

id __56__WBTabCollection__updatePinnedTabsByProfileIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 mutableCopy];
  return v2;
}

void __56__WBTabCollection__updatePinnedTabsByProfileIdentifier___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  uint64_t v8 = [*(id *)(a1 + 32) pinnedTabsFolderIDForProfileWithIdentifier:v11];
  char v9 = *(void **)(a1 + 32);
  uint64_t v10 = objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_62);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 _updateBookmarks:v10 inFolderWithID:v8] ^ 1;

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

id __56__WBTabCollection__updatePinnedTabsByProfileIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 bookmark];
  return v2;
}

- (int)pinnedTabsFolderID
{
  MEMORY[0x21D4A0CC0](v10, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__WBTabCollection_pinnedTabsFolderID__block_invoke;
  block[3] = &unk_2643DA920;
  void block[4] = self;
  void block[5] = &v6;
  dispatch_sync(databaseQueue, block);
  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v10);
  return (int)self;
}

void __37__WBTabCollection_pinnedTabsFolderID__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 pinnedTabsFolderID];
}

- (int)privatePinnedTabsFolderID
{
  MEMORY[0x21D4A0CC0](v10, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__WBTabCollection_privatePinnedTabsFolderID__block_invoke;
  block[3] = &unk_2643DA920;
  void block[4] = self;
  void block[5] = &v6;
  dispatch_sync(databaseQueue, block);
  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v10);
  return (int)self;
}

void __44__WBTabCollection_privatePinnedTabsFolderID__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 privatePinnedTabsFolderID];
}

- (int)pinnedTabsFolderIDForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v15, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__WBTabCollection_pinnedTabsFolderIDForProfileWithIdentifier___block_invoke;
  id v8[3] = &unk_2643DAF78;
  id v9 = v4;
  uint64_t v10 = &v11;
  void v8[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LODWORD(self) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (int)self;
}

void __62__WBTabCollection_pinnedTabsFolderIDForProfileWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 pinnedTabsFolderIDForProfileWithIdentifier:*(void *)(a1 + 40)];
}

- (id)pinnedTabsForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v18, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__4;
  uint64_t v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__WBTabCollection_pinnedTabsForProfileWithIdentifier___block_invoke;
  v9[3] = &unk_2643DAF78;
  id v10 = v4;
  uint64_t v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __54__WBTabCollection_pinnedTabsForProfileWithIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [v5 pinnedTabsForProfileWithIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __84__WBTabCollection_frequentlyVisitedSitesForProfileWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)setFrequentlyVisitedSites:(id)a3 forProfileWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 copy];

  operator new();
}

uint64_t __88__WBTabCollection_setFrequentlyVisitedSites_forProfileWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) _collection];
  objc_msgSend(v2, "updateBookmarks:inFolderWithID:secureDelete:", v3, objc_msgSend(v4, "frequentlyVisitedSitesFolderIDForProfileWithIdentifier:", *(void *)(a1 + 48)), 0);

  id v5 = *(id **)(a1 + 64);
  if (v5)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v5);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (int)frequentlyVisitedSitesFolderIDForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v15, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__WBTabCollection_frequentlyVisitedSitesFolderIDForProfileWithIdentifier___block_invoke;
  id v8[3] = &unk_2643DAF78;
  id v9 = v4;
  id v10 = &v11;
  void v8[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LODWORD(self) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (int)self;
}

void __74__WBTabCollection_frequentlyVisitedSitesFolderIDForProfileWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 frequentlyVisitedSitesFolderIDForProfileWithIdentifier:*(void *)(a1 + 40)];
}

- (id)_tabGroupsInDefaultProfile
{
  uint64_t v3 = [[WebBookmarkListQuery alloc] initWithBookmarksWhere:@"parent = 0 AND syncable = 1 AND type = 1 AND subtype = 0 AND hidden = 0 AND special_id = 0" folderID:0 orderBy:@"order_index ASC" usingFilter:0];
  id v4 = [WebBookmarkList alloc];
  id v5 = [(WBTabCollection *)self _collection];
  id v6 = [(WebBookmarkList *)v4 initWithQuery:v3 skipOffset:0 collection:v5];

  id v7 = [(WebBookmarkList *)v6 bookmarkArray];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__WBTabCollection__tabGroupsInDefaultProfile__block_invoke;
  id v12[3] = &unk_2643DA220;
  v12[4] = self;
  id v8 = objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", v12);
  id v9 = v8;
  if (!v8) {
    id v8 = (void *)MEMORY[0x263EFFA68];
  }
  id v10 = v8;

  return v10;
}

id __45__WBTabCollection__tabGroupsInDefaultProfile__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _collection];
  id v5 = [v4 tabGroupForBookmark:v3];

  if (*(void *)(*(void *)(a1 + 32) + 32)) {
    objc_msgSend(v5, "truncateToNumberOfTabs:");
  }

  return v5;
}

- (NSArray)mutableNamedTabGroupsInDefaultProfile
{
  MEMORY[0x21D4A0CC0](v13, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__4;
  uint64_t v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__WBTabCollection_mutableNamedTabGroupsInDefaultProfile__block_invoke;
  block[3] = &unk_2643DA920;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
  return (NSArray *)v4;
}

uint64_t __56__WBTabCollection_mutableNamedTabGroupsInDefaultProfile__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _tabGroupsInDefaultProfile];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (NSArray)allMutableNamedTabGroupsUnsorted
{
  MEMORY[0x21D4A0CC0](v13, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__4;
  uint64_t v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__WBTabCollection_allMutableNamedTabGroupsUnsorted__block_invoke;
  block[3] = &unk_2643DA920;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
  return (NSArray *)v4;
}

uint64_t __51__WBTabCollection_allMutableNamedTabGroupsUnsorted__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _allMutableTabGroupsUnsorted];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)_allMutableTabGroupsUnsorted
{
  uint64_t v2 = [(WBTabCollection *)self _profiles];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = objc_msgSend(v2, "safari_reduceObjectsWithInitialValue:usingBlock:", v3, &__block_literal_global_75);

  return v4;
}

id __47__WBTabCollection__allMutableTabGroupsUnsorted__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 tabGroups];
  [v4 addObjectsFromArray:v5];

  return v4;
}

- (id)namedTabGroupsForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ![v4 isEqualToString:*MEMORY[0x263F66420]])
  {
    uint64_t v7 = [(WBTabCollection *)self profiles];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__WBTabCollection_namedTabGroupsForProfileWithIdentifier___block_invoke;
    id v13[3] = &unk_2643DB380;
    id v14 = v5;
    id v8 = objc_msgSend(v7, "safari_firstObjectPassingTest:", v13);

    uint64_t v9 = [v8 tabGroups];
    id v10 = (void *)v9;
    uint64_t v11 = (void *)MEMORY[0x263EFFA68];
    if (v9) {
      uint64_t v11 = (void *)v9;
    }
    id v6 = v11;
  }
  else
  {
    id v6 = [(WBTabCollection *)self namedTabGroupsInDefaultProfile];
  }

  return v6;
}

uint64_t __58__WBTabCollection_namedTabGroupsForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)mutableTabGroupWithUUID:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v18, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__4;
  uint64_t v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__WBTabCollection_mutableTabGroupWithUUID___block_invoke;
  v9[3] = &unk_2643DAF78;
  id v10 = v4;
  uint64_t v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __43__WBTabCollection_mutableTabGroupWithUUID___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  uint64_t v3 = [v2 bookmarkWithUUID:*(void *)(a1 + 40)];
  uint64_t v4 = [v7 tabGroupForBookmark:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)tabGroupWithUUID:(id)a3
{
  uint64_t v3 = [(WBTabCollection *)self mutableTabGroupWithUUID:a3];
  return v3;
}

- (id)tabGroupUUIDForServerID:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v18, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__4;
  uint64_t v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__WBTabCollection_tabGroupUUIDForServerID___block_invoke;
  v9[3] = &unk_2643DAF78;
  id v10 = v4;
  uint64_t v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __43__WBTabCollection_tabGroupUUIDForServerID___block_invoke(void *a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__WBTabCollection_tabGroupUUIDForServerID___block_invoke_2;
  v6[3] = &unk_2643DB3A8;
  uint64_t v2 = (void *)a1[5];
  v6[4] = a1[4];
  id v7 = v2;
  uint64_t v3 = __43__WBTabCollection_tabGroupUUIDForServerID___block_invoke_2((uint64_t)v6);
  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __43__WBTabCollection_tabGroupUUIDForServerID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  uint64_t v3 = [v2 bookmarkWithServerID:*(void *)(a1 + 40) excludeDeletedBookmarks:1];

  if (v3 && ([v3 isFolder] & 1) != 0 && !objc_msgSend(v3, "subtype"))
  {
    uint64_t v4 = [v3 UUID];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)deleteTabGroup:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v15, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__WBTabCollection_deleteTabGroup___block_invoke;
  id v8[3] = &unk_2643DAF78;
  id v9 = v4;
  id v10 = &v11;
  void v8[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (char)self;
}

uint64_t __34__WBTabCollection_deleteTabGroup___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _deleteTabGroup:*(void *)(a1 + 40) leaveTombstone:1];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_deleteTabGroup:(id)a3 leaveTombstone:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(WBTabCollection *)self _collection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__WBTabCollection__deleteTabGroup_leaveTombstone___block_invoke;
  id v11[3] = &unk_2643DB148;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  BOOL v13 = a4;
  char v9 = objc_msgSend(v7, "performDatabaseUpdatesWithTransaction:secureDelete:", v11, objc_msgSend(v8, "isPrivateBrowsing"));

  return v9;
}

uint64_t __50__WBTabCollection__deleteTabGroup_leaveTombstone___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  uint64_t v3 = [*(id *)(a1 + 40) bookmark];
  uint64_t v4 = [v2 deleteBookmark:v3 leaveTombstone:*(unsigned __int8 *)(a1 + 48)];

  return v4;
}

- (BOOL)insertTabGroup:(id)a3 afterTabGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  MEMORY[0x21D4A0CC0](v20, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__WBTabCollection_insertTabGroup_afterTabGroup___block_invoke;
  block[3] = &unk_2643DB100;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  uint64_t v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(databaseQueue, block);
  LOBYTE(v7) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v20);
  return (char)v7;
}

void __48__WBTabCollection_insertTabGroup_afterTabGroup___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__WBTabCollection_insertTabGroup_afterTabGroup___block_invoke_2;
  v5[3] = &unk_2643DB0D8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 performDatabaseUpdatesWithTransaction:v5 secureDelete:0];
}

uint64_t __48__WBTabCollection_insertTabGroup_afterTabGroup___block_invoke_2(id *a1)
{
  uint64_t v2 = [a1[4] bookmark];
  id v3 = [a1[5] _collection];
  uint64_t v4 = [a1[4] lastSelectedTabUUID];
  uint64_t v5 = [v3 bookmarkWithUUID:v4];
  objc_msgSend(v2, "setLastSelectedChildID:", objc_msgSend(v5, "identifier"));

  id v6 = [a1[5] _collection];
  LOBYTE(v4) = [v6 _saveBookmark:v2 withSpecialID:0 updateGenerationIfNeeded:1];

  if (v4)
  {
    [a1[5] createTopScopedBookmarkListIfNeededForTabGroup:a1[4]];
    uint64_t v7 = [a1[5] _collection];
    id v8 = [a1[4] uuid];
    uint64_t v9 = [v7 bookmarkWithUUID:v8];

    id v10 = [a1[5] _collection];
    uint64_t v11 = [a1[6] uuid];
    id v12 = [v10 bookmarkWithUUID:v11];

    id v13 = [a1[5] _collection];
    uint64_t v14 = [v13 _reorderBookmark:v9 afterBookmark:v12];

    uint64_t v2 = (void *)v9;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)saveTabGroup:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v15, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __32__WBTabCollection_saveTabGroup___block_invoke;
  id v8[3] = &unk_2643DAF78;
  id v9 = v4;
  id v10 = &v11;
  void v8[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (char)self;
}

void __32__WBTabCollection_saveTabGroup___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__WBTabCollection_saveTabGroup___block_invoke_2;
  v5[3] = &unk_2643DA270;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 performDatabaseUpdatesWithTransaction:v5 secureDelete:0];
}

uint64_t __32__WBTabCollection_saveTabGroup___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) bookmark];
  id v3 = [*(id *)(a1 + 40) _collection];
  uint64_t v4 = [*(id *)(a1 + 32) lastSelectedTabUUID];
  uint64_t v5 = [v3 bookmarkWithUUID:v4];
  objc_msgSend(v2, "setLastSelectedChildID:", objc_msgSend(v5, "identifier"));

  id v6 = [*(id *)(a1 + 40) _collection];
  uint64_t v7 = [v6 _saveBookmark:v2 withSpecialID:0 updateGenerationIfNeeded:1];

  return v7;
}

- (id)mutableTabsForTabGroup:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v18, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__4;
  uint64_t v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__WBTabCollection_mutableTabsForTabGroup___block_invoke;
  v9[3] = &unk_2643DAF78;
  id v10 = v4;
  uint64_t v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __42__WBTabCollection_mutableTabsForTabGroup___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [*(id *)(a1 + 40) bookmark];
  uint64_t v3 = [v6 tabsForTabGroupBookmark:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)tabsForTabGroup:(id)a3
{
  uint64_t v3 = [(WBTabCollection *)self mutableTabsForTabGroup:a3];
  return v3;
}

- (id)mutableTabWithUUID:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v18, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__4;
  uint64_t v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__WBTabCollection_mutableTabWithUUID___block_invoke;
  v9[3] = &unk_2643DAF78;
  id v10 = v4;
  uint64_t v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __38__WBTabCollection_mutableTabWithUUID___block_invoke(void *a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__WBTabCollection_mutableTabWithUUID___block_invoke_2;
  v6[3] = &unk_2643DB3D0;
  uint64_t v2 = (void *)a1[5];
  v6[4] = a1[4];
  id v7 = v2;
  uint64_t v3 = __38__WBTabCollection_mutableTabWithUUID___block_invoke_2((uint64_t)v6);
  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

WBMutableTab *__38__WBTabCollection_mutableTabWithUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  uint64_t v3 = [v2 bookmarkWithUUID:*(void *)(a1 + 40)];

  if (v3) {
    uint64_t v4 = [(WBTab *)[WBMutableTab alloc] initWithBookmark:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)tabWithUUID:(id)a3
{
  uint64_t v3 = [(WBTabCollection *)self mutableTabWithUUID:a3];
  return v3;
}

- (BOOL)deleteTabs:(id)a3
{
  id v4 = a3;
  char v5 = objc_msgSend(v4, "safari_containsObjectPassingTest:", &__block_literal_global_82);
  MEMORY[0x21D4A0CC0](v17, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__WBTabCollection_deleteTabs___block_invoke_2;
  block[3] = &unk_2643DB170;
  id v10 = v4;
  uint64_t v11 = &v13;
  void block[4] = self;
  char v12 = v5;
  id v7 = v4;
  dispatch_sync(databaseQueue, block);
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v17);
  return (char)self;
}

uint64_t __30__WBTabCollection_deleteTabs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPrivateBrowsing];
}

void __30__WBTabCollection_deleteTabs___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__WBTabCollection_deleteTabs___block_invoke_3;
  v4[3] = &unk_2643DA270;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 performDatabaseUpdatesWithTransaction:v4 secureDelete:*(unsigned __int8 *)(a1 + 56)];
}

uint64_t __30__WBTabCollection_deleteTabs___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _bookmarksForTabs:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 32) _collection];
  uint64_t v4 = [v3 _deleteBookmarks:v2 leaveTombstone:1];

  return v4;
}

- (BOOL)insertTab:(id)a3 inTabGroup:(id)a4 afterTab:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  MEMORY[0x21D4A0CC0](v25, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  databaseQueue = self->_databaseQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __49__WBTabCollection_insertTab_inTabGroup_afterTab___block_invoke;
  v16[3] = &unk_2643DB440;
  id v19 = v9;
  uint64_t v20 = &v21;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_sync(databaseQueue, v16);
  LOBYTE(v10) = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v25);
  return (char)v10;
}

void __49__WBTabCollection_insertTab_inTabGroup_afterTab___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__WBTabCollection_insertTab_inTabGroup_afterTab___block_invoke_2;
  v5[3] = &unk_2643DB418;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v2 performDatabaseUpdatesWithTransaction:v5 secureDelete:0];
}

uint64_t __49__WBTabCollection_insertTab_inTabGroup_afterTab___block_invoke_2(id *a1)
{
  uint64_t v2 = [a1[4] bookmark];
  id v3 = [a1[5] _collection];
  uint64_t v4 = [a1[6] uuid];
  id v5 = [v3 bookmarkWithUUID:v4];

  objc_msgSend(v2, "_setSyncable:", objc_msgSend(a1[7], "isSyncable"));
  uint64_t v6 = objc_msgSend(a1[5], "_insertBookmark:afterBookmark:inFolderWithID:", v2, v5, objc_msgSend(a1[7], "identifier"));

  return v6;
}

- (id)tabUUIDForServerID:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v18, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__4;
  char v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__WBTabCollection_tabUUIDForServerID___block_invoke;
  v9[3] = &unk_2643DAF78;
  id v10 = v4;
  uint64_t v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __38__WBTabCollection_tabUUIDForServerID___block_invoke(void *a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__WBTabCollection_tabUUIDForServerID___block_invoke_2;
  v6[3] = &unk_2643DB3A8;
  uint64_t v2 = (void *)a1[5];
  v6[4] = a1[4];
  id v7 = v2;
  uint64_t v3 = __38__WBTabCollection_tabUUIDForServerID___block_invoke_2((uint64_t)v6);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __38__WBTabCollection_tabUUIDForServerID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  uint64_t v3 = [v2 bookmarkWithServerID:*(void *)(a1 + 40) excludeDeletedBookmarks:1];

  if (!v3 || ([v3 isFolder] & 1) != 0 || objc_msgSend(v3, "subtype"))
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [v3 UUID];
  }

  return v4;
}

- (BOOL)insertTabs:(id)a3 inTabGroup:(id)a4 afterTab:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  MEMORY[0x21D4A0CC0](v25, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  databaseQueue = self->_databaseQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __50__WBTabCollection_insertTabs_inTabGroup_afterTab___block_invoke;
  v16[3] = &unk_2643DB440;
  id v19 = v8;
  uint64_t v20 = &v21;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_sync(databaseQueue, v16);
  LOBYTE(self) = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v25);
  return (char)self;
}

void __50__WBTabCollection_insertTabs_inTabGroup_afterTab___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__WBTabCollection_insertTabs_inTabGroup_afterTab___block_invoke_2;
  v4[3] = &unk_2643DB418;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v2 performDatabaseUpdatesWithTransaction:v4 secureDelete:0];
}

uint64_t __50__WBTabCollection_insertTabs_inTabGroup_afterTab___block_invoke_2(id *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1[4] _collection];
  uint64_t v3 = [a1[5] uuid];
  uint64_t v4 = [v2 bookmarkWithUUID:v3];

  uint64_t v5 = [a1[6] identifier];
  objc_msgSend(a1[7], "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_84);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      uint64_t v9 = 0;
      id v10 = v4;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        objc_msgSend(v11, "setSyncable:", objc_msgSend(a1[6], "isSyncable", (void)v14));
        uint64_t v4 = [v11 bookmark];
        if (([a1[4] _insertBookmark:v4 afterBookmark:v10 inFolderWithID:v5] & 1) == 0)
        {

          uint64_t v12 = 0;
          goto LABEL_11;
        }

        ++v9;
        id v10 = v4;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  [v6 makeObjectsPerformSelector:sel_markClean];
  uint64_t v12 = 1;
  id v10 = v4;
LABEL_11:

  return v12;
}

id __50__WBTabCollection_insertTabs_inTabGroup_afterTab___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)[a2 mutableCopy];
  return v2;
}

- (BOOL)updateTabs:(id)a3 inTabGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[WBTabCollection _bookmarksForTabs:syncable:](self, "_bookmarksForTabs:syncable:", v6, [v7 isSyncable]);
  MEMORY[0x21D4A0CC0](v21, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__WBTabCollection_updateTabs_inTabGroup___block_invoke;
  block[3] = &unk_2643DB100;
  void block[4] = self;
  id v14 = v8;
  id v15 = v7;
  long long v16 = &v17;
  id v10 = v7;
  id v11 = v8;
  dispatch_sync(databaseQueue, block);
  LOBYTE(v8) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v21);

  return (char)v8;
}

void __41__WBTabCollection_updateTabs_inTabGroup___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(v2, "updateBookmarks:inFolderWithID:secureDelete:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "identifier"), objc_msgSend(*(id *)(a1 + 48), "isPrivateBrowsing"));
}

uint64_t __58__WBTabCollection_updateTabsInTabGroup_completionHandler___block_invoke_89(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __64__WBTabCollection_flushDeletedTabsInTabGroup_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)topScopedBookmarkListForTabGroup:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__4;
  long long v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__WBTabCollection_topScopedBookmarkListForTabGroup___block_invoke;
  block[3] = &unk_2643DAF78;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __52__WBTabCollection_topScopedBookmarkListForTabGroup___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [v5 topScopedBookmarkListForTabGroup:*(void *)(a1 + 40) onQueue:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)createTopScopedBookmarkListIfNeededForTabGroup:(id)a3
{
  id v5 = a3;
  id v4 = [(WBTabCollection *)self _collection];
  if ([v4 allowsScopedBookmarksInTabGroup:v5]) {
    [v4 createTopScopedBookmarkListForTabGroup:v5];
  }
}

- (id)scopedBookmarkListWithID:(int)a3
{
  MEMORY[0x21D4A0CC0](v16, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__4;
  uint64_t v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__WBTabCollection_scopedBookmarkListWithID___block_invoke;
  id v8[3] = &unk_2643DB508;
  void v8[4] = self;
  void v8[5] = &v10;
  int v9 = a3;
  dispatch_sync(databaseQueue, v8);
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v16);
  return v6;
}

void __44__WBTabCollection_scopedBookmarkListWithID___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__WBTabCollection_scopedBookmarkListWithID___block_invoke_2;
  v5[3] = &unk_2643DB4E0;
  void v5[4] = *(void *)(a1 + 32);
  int v6 = *(_DWORD *)(a1 + 48);
  uint64_t v2 = __44__WBTabCollection_scopedBookmarkListWithID___block_invoke_2((uint64_t)v5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __44__WBTabCollection_scopedBookmarkListWithID___block_invoke_2(uint64_t a1)
{
  v9[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  uint64_t v3 = [v2 bookmarkWithID:*(unsigned int *)(a1 + 40)];

  if ([v3 subtype] == 1 && (objc_msgSend(v3, "isFolder") & 1) != 0)
  {
    id v4 = [*(id *)(a1 + 32) _bookmarkListWithFolderID:*(unsigned int *)(a1 + 40) usingFilter:0 options:8];
  }
  else
  {
    id v5 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = *(_DWORD *)(a1 + 40);
      id v7 = [*(id *)(a1 + 32) _descriptionForScopedBookmark:v3];
      __44__WBTabCollection_scopedBookmarkListWithID___block_invoke_2_cold_1(v7, (uint64_t)v9, v6);
    }

    id v4 = 0;
  }

  return v4;
}

- (id)scopedBookmarkListWithID:(int)a3 filteredUsingString:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = v6;
  if (v4 && ![v6 length])
  {
    id v9 = [(WBTabCollection *)self scopedBookmarkListWithID:v4];
  }
  else
  {
    MEMORY[0x21D4A0CC0](v21, @"com.apple.WebBookmarks.WBTabCollection");
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__4;
    uint64_t v19 = __Block_byref_object_dispose__4;
    id v20 = 0;
    databaseQueue = self->_databaseQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__WBTabCollection_scopedBookmarkListWithID_filteredUsingString___block_invoke;
    block[3] = &unk_2643DB1E0;
    id v13 = &v15;
    void block[4] = self;
    int v14 = v4;
    id v12 = v7;
    dispatch_sync(databaseQueue, block);
    id v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v21);
  }

  return v9;
}

void __64__WBTabCollection_scopedBookmarkListWithID_filteredUsingString___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__WBTabCollection_scopedBookmarkListWithID_filteredUsingString___block_invoke_2;
  v6[3] = &unk_2643DB530;
  uint64_t v2 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  int v8 = *(_DWORD *)(a1 + 56);
  id v7 = v2;
  uint64_t v3 = __64__WBTabCollection_scopedBookmarkListWithID_filteredUsingString___block_invoke_2((uint64_t)v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __64__WBTabCollection_scopedBookmarkListWithID_filteredUsingString___block_invoke_2(uint64_t a1)
{
  id v10[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  uint64_t v3 = [v2 bookmarkWithID:*(unsigned int *)(a1 + 48)];

  if (!*(_DWORD *)(a1 + 48) || [v3 subtype] == 1 && objc_msgSend(v3, "isFolder"))
  {
    if ([*(id *)(a1 + 40) length]) {
      uint64_t v4 = 24;
    }
    else {
      uint64_t v4 = 8;
    }
    id v5 = [*(id *)(a1 + 32) _bookmarkListWithFolderID:*(unsigned int *)(a1 + 48) usingFilter:*(void *)(a1 + 40) options:v4];
  }
  else
  {
    id v6 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = *(_DWORD *)(a1 + 48);
      int v8 = [*(id *)(a1 + 32) _descriptionForScopedBookmark:v3];
      __64__WBTabCollection_scopedBookmarkListWithID_filteredUsingString___block_invoke_2_cold_1(v8, (uint64_t)v10, v7);
    }

    id v5 = 0;
  }

  return v5;
}

- (id)scopedBookmarkWithUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    MEMORY[0x21D4A0CC0](v17, @"com.apple.WebBookmarks.WBTabCollection");
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    int v14 = __Block_byref_object_copy__4;
    uint64_t v15 = __Block_byref_object_dispose__4;
    id v16 = 0;
    databaseQueue = self->_databaseQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __42__WBTabCollection_scopedBookmarkWithUUID___block_invoke;
    id v8[3] = &unk_2643DAF78;
    uint64_t v10 = &v11;
    void v8[4] = self;
    id v9 = v4;
    dispatch_sync(databaseQueue, v8);
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v17);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __42__WBTabCollection_scopedBookmarkWithUUID___block_invoke(void *a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__WBTabCollection_scopedBookmarkWithUUID___block_invoke_2;
  v6[3] = &unk_2643DB558;
  uint64_t v2 = (void *)a1[5];
  v6[4] = a1[4];
  id v7 = v2;
  uint64_t v3 = __42__WBTabCollection_scopedBookmarkWithUUID___block_invoke_2((uint64_t)v6);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __42__WBTabCollection_scopedBookmarkWithUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  uint64_t v3 = [v2 bookmarkWithUUID:*(void *)(a1 + 40)];

  if (v3 && ([v3 subtype] != 1 || objc_msgSend(v3, "isFolder")))
  {
    uint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = [*(id *)(a1 + 32) _descriptionForScopedBookmark:v3];
      __42__WBTabCollection_scopedBookmarkWithUUID___block_invoke_2_cold_1(v5, v6, v8, v4);
    }

    uint64_t v3 = 0;
  }
  return v3;
}

- (id)_descriptionForScopedBookmark:(id)a3
{
  id v3 = a3;
  uint64_t v4 = NSString;
  uint64_t v5 = [v3 subtype];
  int v6 = [v3 isFolder];
  id v7 = @"non-scoped";
  if (v5 == 1) {
    id v7 = @"scoped";
  }
  int v8 = @"bookmark";
  if (v6) {
    int v8 = @"folder";
  }
  uint64_t v9 = [v4 stringWithFormat:@"%@ %@", v7, v8];

  return v9;
}

- (id)syncDataForItem:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v18, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__WBTabCollection_syncDataForItem___block_invoke;
  v9[3] = &unk_2643DAF78;
  id v10 = v4;
  uint64_t v11 = &v12;
  void v9[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __35__WBTabCollection_syncDataForItem___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [*(id *)(a1 + 40) bookmark];
  uint64_t v3 = [v6 syncDataForBookmark:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)syncDataForItemWithID:(int)a3
{
  MEMORY[0x21D4A0CC0](v16, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  uint64_t v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__WBTabCollection_syncDataForItemWithID___block_invoke;
  id v8[3] = &unk_2643DB508;
  void v8[4] = self;
  void v8[5] = &v10;
  int v9 = a3;
  dispatch_sync(databaseQueue, v8);
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v16);
  return v6;
}

void __41__WBTabCollection_syncDataForItemWithID___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [v5 syncDataForBookmarkID:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (WBBookmarkDatabaseSyncData)databaseSyncData
{
  MEMORY[0x21D4A0CC0](v13, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__4;
  uint64_t v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__WBTabCollection_databaseSyncData__block_invoke;
  block[3] = &unk_2643DA920;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
  return (WBBookmarkDatabaseSyncData *)v4;
}

void __35__WBTabCollection_databaseSyncData__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [v5 databaseSyncData];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)serverIDForItemWithID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  id v5 = [(WBTabCollection *)self _collection];
  id v6 = [v5 serverIDForBookmarkID:v3];

  return v6;
}

- (id)recordIDForTab:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v18, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34__WBTabCollection_recordIDForTab___block_invoke;
  v9[3] = &unk_2643DAF78;
  id v10 = v4;
  uint64_t v11 = &v12;
  void v9[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __34__WBTabCollection_recordIDForTab___block_invoke(void *a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__WBTabCollection_recordIDForTab___block_invoke_2;
  v6[3] = &unk_2643DB580;
  uint64_t v2 = (void *)a1[5];
  v6[4] = a1[4];
  id v7 = v2;
  uint64_t v3 = __34__WBTabCollection_recordIDForTab___block_invoke_2((uint64_t)v6);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __34__WBTabCollection_recordIDForTab___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  uint64_t v3 = [*(id *)(a1 + 40) bookmark];
  uint64_t v4 = [v2 syncDataForBookmark:v3];
  id v5 = [v4 record];
  id v6 = [v5 recordID];

  if (!v6)
  {
    id v7 = [*(id *)(a1 + 40) bookmark];
    int v8 = [v7 serverID];

    if ([v8 length])
    {
      uint64_t v9 = [*(id *)(a1 + 40) bookmark];
      id v10 = objc_msgSend(v2, "syncDataForBookmarkID:", objc_msgSend(v9, "parentID"));

      uint64_t v11 = [v10 record];
      uint64_t v12 = [v11 recordID];
      uint64_t v13 = [v12 zoneID];

      id v6 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v8 zoneID:v13];
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

- (id)_shareRecordForTabGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(WBTabCollection *)self _collection];
  id v6 = [v4 bookmark];
  id v7 = [v5 syncDataForBookmark:v6];
  int v8 = [v7 shareRecord];

  return v8;
}

- (id)shareRecordForTabGroup:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v18, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__WBTabCollection_shareRecordForTabGroup___block_invoke;
  v9[3] = &unk_2643DAF78;
  id v10 = v4;
  uint64_t v11 = &v12;
  void v9[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

uint64_t __42__WBTabCollection_shareRecordForTabGroup___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _shareRecordForTabGroup:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)shareRecordForTabGroup:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  operator new();
}

void __60__WBTabCollection_shareRecordForTabGroup_completionHandler___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _shareRecordForTabGroup:*(void *)(a1 + 40)];
  uint64_t v2 = *(id **)(a1 + 56);
  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)setHasSharedTabGroupsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  operator new();
}

uint64_t __62__WBTabCollection_setHasSharedTabGroupsWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setHasSharedTabGroups];
  uint64_t v2 = *(id **)(a1 + 48);
  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (BOOL)_setHasSharedTabGroups
{
  return [(WebBookmarkCollection *)self->_collection setHasSharedTabGroups];
}

- (id)activeParticipantsInTabGroup:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x3032000000;
  long long v35 = __Block_byref_object_copy__4;
  long long v36 = __Block_byref_object_dispose__4;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  char v29 = __Block_byref_object_copy__4;
  long long v30 = __Block_byref_object_dispose__4;
  id v31 = 0;
  MEMORY[0x21D4A0CC0](v25, @"com.apple.WebBookmarks.WBTabCollection");
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__WBTabCollection_activeParticipantsInTabGroup___block_invoke;
  block[3] = &unk_2643DB5D0;
  void block[4] = self;
  id v6 = v4;
  id v22 = v6;
  uint64_t v23 = &v32;
  char v24 = &v26;
  dispatch_sync(databaseQueue, block);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v25);
  if (v33[5])
  {
    id v7 = [MEMORY[0x263EFF980] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = (id)v33[5];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isCurrentUser", (void)v17) & 1) == 0 && objc_msgSend(v12, "acceptanceStatus") == 2)
          {
            uint64_t v13 = (void *)v27[5];
            uint64_t v14 = objc_msgSend(v12, "safari_shareParticipantIdentifier");
            LODWORD(v13) = [v13 containsObject:v14];

            if (v13) {
              [v7 addObject:v12];
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v38 count:16];
      }
      while (v9);
    }

    id v15 = (void *)[v7 copy];
  }
  else
  {
    id v15 = 0;
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v15;
}

void __48__WBTabCollection_activeParticipantsInTabGroup___block_invoke(uint64_t a1)
{
  id v13 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [*(id *)(a1 + 40) bookmark];
  id v3 = [v13 syncDataForBookmark:v2];
  id v4 = [v3 shareRecord];

  if (v4)
  {
    uint64_t v5 = [v4 participants];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = [*(id *)(a1 + 40) bookmark];
    uint64_t v9 = [v8 serverID];
    uint64_t v10 = [v13 activeParticipantsInTabGroupWithServerID:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)activeParticipantsInTab:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__4;
  uint64_t v21 = __Block_byref_object_dispose__4;
  id v22 = 0;
  MEMORY[0x21D4A0CC0](v16, @"com.apple.WebBookmarks.WBTabCollection");
  databaseQueue = self->_databaseQueue;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __43__WBTabCollection_activeParticipantsInTab___block_invoke;
  uint64_t v12 = &unk_2643DAF78;
  id v15 = &v17;
  id v13 = self;
  id v6 = v4;
  id v14 = v6;
  dispatch_sync(databaseQueue, &v9);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v16);
  id v7 = -[WBTabCollection _activeParticipantsFromParticipantData:](self, "_activeParticipantsFromParticipantData:", v18[5], v9, v10, v11, v12, v13);
  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __43__WBTabCollection_activeParticipantsInTab___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _participantDataForTab:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)getActiveParticipantsInTab:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  operator new();
}

void __64__WBTabCollection_getActiveParticipantsInTab_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _participantDataForTab:*(void *)(a1 + 40)];
  uint64_t v3 = *(id **)(a1 + 56);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __64__WBTabCollection_getActiveParticipantsInTab_completionHandler___block_invoke_2;
  uint64_t v11 = &unk_2643DB5F8;
  id v4 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__WBTabCollection_getActiveParticipantsInTab_completionHandler___block_invoke_3;
  v6[3] = &unk_2643DB5F8;
  id v5 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  __64__WBTabCollection_getActiveParticipantsInTab_completionHandler___block_invoke_3((uint64_t)v6, (uint64_t)v2);
}

void __64__WBTabCollection_getActiveParticipantsInTab_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) _activeParticipantsFromParticipantData:a2];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

void __64__WBTabCollection_getActiveParticipantsInTab_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) _activeParticipantsFromParticipantData:a2];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (id)_participantDataForTab:(id)a3
{
  id v4 = a3;
  id v5 = [(WBTabCollection *)self _collection];
  id v6 = [v4 bookmark];
  id v7 = objc_msgSend(v5, "syncDataForBookmarkID:", objc_msgSend(v6, "parentID"));
  uint64_t v8 = [v7 shareRecord];

  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = [v8 participants];
    [v9 setParticipants:v10];

    uint64_t v11 = [v4 bookmark];
    uint64_t v12 = [v11 serverID];
    id v13 = [v5 activeParticipantsInTabWithServerID:v12];
    [v9 setActiveParticipantIDs:v13];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_activeParticipantsFromParticipantData:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v3 = [v17 participants];

  if (v3)
  {
    id v16 = [MEMORY[0x263EFF9C0] set];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = [v17 participants];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (([v8 isCurrentUser] & 1) == 0 && objc_msgSend(v8, "acceptanceStatus") == 2)
          {
            uint64_t v9 = [v8 userIdentity];
            uint64_t v10 = [v17 activeParticipantIDs];
            uint64_t v11 = [v9 userRecordID];
            uint64_t v12 = [v11 recordName];
            int v13 = [v10 containsObject:v12];

            if (v13) {
              [v16 addObject:v8];
            }
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v5);
    }

    id v14 = (void *)[v16 copy];
  }
  else
  {
    id v14 = [MEMORY[0x263EFFA08] set];
  }

  return v14;
}

- (id)presenceTabUUIDForParticipantIdentifier:(id)a3 inTabGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  MEMORY[0x21D4A0CC0](v23, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__4;
  long long v21 = __Block_byref_object_dispose__4;
  id v22 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__WBTabCollection_presenceTabUUIDForParticipantIdentifier_inTabGroup___block_invoke;
  block[3] = &unk_2643DB100;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(databaseQueue, block);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v23);
  return v11;
}

void __70__WBTabCollection_presenceTabUUIDForParticipantIdentifier_inTabGroup___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) bookmark];
  id v4 = [v3 serverID];
  uint64_t v5 = [v8 presenceTabUUIDForParticipant:v2 inTabGroupWithServerID:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)tabGroupMatchingShare:(id)a3 inTabGroups:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 recordID];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__WBTabCollection_tabGroupMatchingShare_inTabGroups___block_invoke;
  id v12[3] = &unk_2643DB620;
  id v13 = v8;
  id v14 = self;
  id v9 = v8;
  id v10 = objc_msgSend(v7, "safari_firstObjectPassingTest:", v12);

  return v10;
}

uint64_t __53__WBTabCollection_tabGroupMatchingShare_inTabGroups___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) shareRecordForTabGroup:a2];
  id v4 = [v3 recordID];
  uint64_t v5 = [v2 isEqual:v4];

  return v5;
}

- (BOOL)shouldUpdatePresence
{
  return [(WebBookmarkTabCollection *)self->_collection containsCKShareRecord];
}

- (id)_profilesQuery
{
  uint64_t v2 = [[WebBookmarkListQuery alloc] initWithBookmarksWhere:@"parent = 0 AND syncable = 1 AND type = 1 AND subtype = 2 AND special_id = 0" folderID:0 orderBy:@"order_index ASC" usingFilter:0];
  return v2;
}

- (id)mutableProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v18, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__WBTabCollection_mutableProfileWithIdentifier___block_invoke;
  v9[3] = &unk_2643DAF78;
  id v10 = v4;
  id v11 = &v12;
  void v9[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __48__WBTabCollection_mutableProfileWithIdentifier___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  id v3 = [v2 bookmarkWithUUID:*(void *)(a1 + 40)];
  uint64_t v4 = [v7 profileForBookmark:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)devicesForProfile:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v18, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__WBTabCollection_devicesForProfile___block_invoke;
  v9[3] = &unk_2643DAF78;
  id v10 = v4;
  id v11 = &v12;
  void v9[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __37__WBTabCollection_devicesForProfile___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [v5 devicesForProfile:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)defaultProfileIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F66420];
}

- (id)profileWithServerID:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v18, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__WBTabCollection_profileWithServerID___block_invoke;
  v9[3] = &unk_2643DAF78;
  id v10 = v4;
  id v11 = &v12;
  void v9[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __39__WBTabCollection_profileWithServerID___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  uint64_t v3 = [v2 bookmarkWithServerID:*(void *)(a1 + 40) excludeDeletedBookmarks:1];
  uint64_t v4 = [v7 profileForBookmark:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)hasMultipleProfiles
{
  MEMORY[0x21D4A0CC0](v10, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__WBTabCollection_hasMultipleProfiles__block_invoke;
  block[3] = &unk_2643DA920;
  void block[4] = self;
  void block[5] = &v6;
  dispatch_sync(databaseQueue, block);
  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v10);
  return (char)self;
}

void __38__WBTabCollection_hasMultipleProfiles__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _profilesQuery];
  uint64_t v2 = [*(id *)(a1 + 32) _collection];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (int)[v3 countInCollection:v2] > 1;
}

- (id)windowStateWithUUID:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v18, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__WBTabCollection_windowStateWithUUID___block_invoke;
  v9[3] = &unk_2643DAF78;
  id v10 = v4;
  id v11 = &v12;
  void v9[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __39__WBTabCollection_windowStateWithUUID___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [v5 windowStateWithUUID:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)windowStates
{
  MEMORY[0x21D4A0CC0](v13, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__4;
  id v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__WBTabCollection_windowStates__block_invoke;
  block[3] = &unk_2643DA920;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
  return (NSArray *)v4;
}

uint64_t __31__WBTabCollection_windowStates__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) windowStates];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (BOOL)closeWindowState:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v15, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__WBTabCollection_closeWindowState___block_invoke;
  id v8[3] = &unk_2643DAF78;
  id v9 = v4;
  id v10 = &v11;
  void v8[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (char)self;
}

void __36__WBTabCollection_closeWindowState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 closeWindowState:*(void *)(a1 + 40)];
}

- (BOOL)deleteWindowState:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v15, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__WBTabCollection_deleteWindowState___block_invoke;
  id v8[3] = &unk_2643DAF78;
  id v9 = v4;
  id v10 = &v11;
  void v8[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (char)self;
}

void __37__WBTabCollection_deleteWindowState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 deleteWindowState:*(void *)(a1 + 40)];
}

- (BOOL)deleteWindowStates:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v15, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__WBTabCollection_deleteWindowStates___block_invoke;
  id v8[3] = &unk_2643DAF78;
  id v9 = v4;
  id v10 = &v11;
  void v8[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (char)self;
}

void __38__WBTabCollection_deleteWindowStates___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 deleteWindowStates:*(void *)(a1 + 40)];
}

- (void)deleteWindowStates:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  operator new();
}

uint64_t __56__WBTabCollection_deleteWindowStates_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  [v2 deleteWindowStates:*(void *)(a1 + 40)];

  uint64_t v3 = *(id **)(a1 + 56);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x21D4A0CE0]();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (BOOL)deleteAllWindowStates
{
  MEMORY[0x21D4A0CC0](v10, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__WBTabCollection_deleteAllWindowStates__block_invoke;
  block[3] = &unk_2643DA920;
  void block[4] = self;
  void block[5] = &v6;
  dispatch_sync(databaseQueue, block);
  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v10);
  return (char)self;
}

void __40__WBTabCollection_deleteAllWindowStates__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 deleteAllWindowStates];
}

- (BOOL)saveWindowState:(id)a3
{
  id v4 = a3;
  MEMORY[0x21D4A0CC0](v15, @"com.apple.WebBookmarks.WBTabCollection");
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__WBTabCollection_saveWindowState___block_invoke;
  id v8[3] = &unk_2643DAF78;
  id v9 = v4;
  id v10 = &v11;
  void v8[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (char)self;
}

void __35__WBTabCollection_saveWindowState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 saveWindowState:*(void *)(a1 + 40)];
}

- (id)_bookmarksForTabs:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_122);
  return v3;
}

id __37__WBTabCollection__bookmarksForTabs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 bookmark];
  return v2;
}

- (id)_bookmarksForTabs:(id)a3 syncable:(BOOL)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__WBTabCollection__bookmarksForTabs_syncable___block_invoke;
  v6[3] = &__block_descriptor_33_e28___WebBookmark_16__0__WBTab_8l;
  BOOL v7 = a4;
  id v4 = objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v6);
  return v4;
}

id __46__WBTabCollection__bookmarksForTabs_syncable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 bookmark];
  if (([v3 isInserted] & 1) == 0) {
    [v3 _setSyncable:*(unsigned __int8 *)(a1 + 32)];
  }
  return v3;
}

- (id)_bookmarkListWithFolderID:(int)a3 usingFilter:(id)a4 options:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = [[WebBookmarkListQuery alloc] initWithFolderID:v6 inCollection:self->_collection usingFilter:v8 options:a5];
  id v10 = [[WebBookmarkList alloc] initWithQuery:v9 skipOffset:0 collection:self->_collection queue:self->_databaseQueue];

  return v10;
}

- (BOOL)_insertBookmark:(id)a3 afterBookmark:(id)a4 inFolderWithID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(WBTabCollection *)self _collection];
  if ([v10 _saveAndMoveBookmark:v8 toFolderID:v5])
  {
    uint64_t v11 = objc_msgSend(v10, "bookmarkWithID:", objc_msgSend(v9, "identifier"));
    char v12 = [v10 _reorderBookmark:v8 afterBookmark:v11];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)_readPropertiesOfBookmark:(id)a3
{
  id v7 = a3;
  id v4 = [(WBTabCollection *)self _collection];
  uint64_t v5 = [v7 UUID];
  uint64_t v6 = [v4 identifierOfBookmarkWithUUID:v5];

  [v7 _setID:v6];
  [v7 _setInserted:v6 != 0x7FFFFFFF];
  objc_msgSend(v7, "_setOrderIndex:", objc_msgSend(v4, "orderIndexOfBookmark:", v7));
  objc_msgSend(v7, "_setParentID:", objc_msgSend(v4, "parentIdentifierOfBookmarkWithID:", objc_msgSend(v7, "identifier")));
  objc_msgSend(v7, "setModifiedAttributes:", objc_msgSend(v7, "modifiedAttributes") | objc_msgSend(v4, "modifiedAttributesOfBookmark:", v7));
}

- (BOOL)_reorderBookmarkIntoPlace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WBTabCollection *)self _collection];
  if ([v4 isSyncable])
  {
    uint64_t v6 = [v4 syncPosition];
    uint64_t v7 = objc_msgSend(v5, "orderIndexOfBookmark:withSyncPosition:inFolderWithID:", v4, v6, objc_msgSend(v4, "parentID"));
  }
  else
  {
    uint64_t v7 = [v4 orderIndex];
  }
  char v8 = [v5 _reorderBookmark:v4 toIndex:v7 generateSyncPositionIfNeeded:0];

  return v8;
}

- (BOOL)lockSync
{
  id v2 = [(WBTabCollection *)self _collection];
  char v3 = [(id)objc_opt_class() lockSync];

  return v3;
}

- (void)unlockSync
{
  id v2 = [(WBTabCollection *)self _collection];
  [(id)objc_opt_class() unlockSync];
}

- (BOOL)isLockedSync
{
  id v2 = [(WBTabCollection *)self _collection];
  char v3 = [(id)objc_opt_class() isLockedSync];

  return v3;
}

- (void)performMaintenance
{
  MEMORY[0x21D4A0CC0](v5, @"com.apple.WebBookmarks.WBTabCollection");
  databaseQueue = self->_databaseQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__WBTabCollection_performMaintenance__block_invoke;
  v4[3] = &unk_2643DA0D0;
  void v4[4] = self;
  dispatch_sync(databaseQueue, v4);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v5);
}

void __37__WBTabCollection_performMaintenance__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _collection];
  [v1 performMaintenance];
}

- (id)tabCollectionDataSummaryLogHidingSensitiveData:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v17 = [(WBTabCollection *)self profiles];
  objc_msgSend(v5, "appendFormat:", @"Number of Profiles: %lu\n", objc_msgSend(v17, "count"));
  uint64_t v6 = [(WBTabCollection *)self allNamedTabGroupsUnsorted];
  objc_msgSend(v5, "appendFormat:", @"Number of Tab Groups: %lu\n", objc_msgSend(v6, "count"));

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v17;
  uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [(WBTabCollection *)self _addProfile:v10 toLog:v5 hidingSensitiveData:v3];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v11 = [v10 identifier];
        char v12 = [(WBTabCollection *)self namedTabGroupsForProfileWithIdentifier:v11];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v12);
              }
              [(WBTabCollection *)self _addTabGroup:*(void *)(*((void *)&v19 + 1) + 8 * j) toLog:v5 hidingSensitiveData:v3];
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  [v5 appendString:@"\n"];
  return v5;
}

- (BOOL)copyTabsDatabase:(id)a3 hidingSensitiveData:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = +[WBCollectionConfiguration safariTabCollectionConfiguration];
  long long v36 = self;
  id v10 = +[WBTabCollection databasePathForConfiguration:v9];

  uint64_t v11 = [NSURL fileURLWithPath:v10];
  char v12 = NSURL;
  uint64_t v13 = [v10 stringByAppendingString:@"-shm"];
  BOOL v35 = a4;
  uint64_t v14 = [v12 fileURLWithPath:v13];

  id v15 = NSURL;
  id v16 = [v10 stringByAppendingString:@"-wal"];
  id v17 = [v15 fileURLWithPath:v16];

  long long v18 = [MEMORY[0x263F08850] defaultManager];
  if ((objc_msgSend(v18, "safari_removeFileAtURL:error:", v8, a5) & 1) != 0
    && [v18 copyItemAtURL:v11 toURL:v8 error:a5])
  {
    uint64_t v34 = v11;
    long long v19 = NSURL;
    long long v20 = [v8 path];
    long long v21 = [v20 stringByAppendingString:@"-shm"];
    uint64_t v22 = [v19 fileURLWithPath:v21];

    long long v33 = (void *)v22;
    if ([v18 copyItemAtURL:v14 toURL:v22 error:a5])
    {
      long long v23 = NSURL;
      long long v24 = [v8 path];
      long long v25 = [v24 stringByAppendingString:@"-wal"];
      long long v26 = [v23 fileURLWithPath:v25];

      uint64_t v11 = v34;
      if ([v18 copyItemAtURL:v17 toURL:v26 error:a5])
      {
        uint64_t v27 = (void *)[objc_alloc(MEMORY[0x263F66368]) initWithURL:v8 queue:v36->_databaseQueue];
        uint64_t v48 = 0;
        v49 = &v48;
        uint64_t v50 = 0x3032000000;
        v51 = __Block_byref_object_copy__4;
        v52 = __Block_byref_object_dispose__4;
        id v53 = 0;
        uint64_t v44 = 0;
        v45 = &v44;
        uint64_t v46 = 0x2020000000;
        char v47 = 1;
        databaseQueue = v36->_databaseQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __62__WBTabCollection_copyTabsDatabase_hidingSensitiveData_error___block_invoke;
        block[3] = &unk_2643DB6D8;
        v41 = &v44;
        uint64_t v42 = &v48;
        id v29 = v27;
        id v38 = v29;
        uint64_t v39 = v36;
        BOOL v43 = v35;
        id v40 = &unk_26CC40138;
        dispatch_sync(databaseQueue, block);
        long long v30 = (void *)v49[5];
        if (v30 || !*((unsigned char *)v45 + 24))
        {
          uint64_t v11 = v34;
          if (a5) {
            *a5 = v30;
          }
          objc_msgSend(v18, "safari_removeFileAtURL:error:", v8, 0);
          BOOL v31 = 0;
        }
        else
        {
          BOOL v31 = 1;
          uint64_t v11 = v34;
        }

        _Block_object_dispose(&v44, 8);
        _Block_object_dispose(&v48, 8);
      }
      else
      {
        BOOL v31 = 0;
      }
    }
    else
    {
      BOOL v31 = 0;
      uint64_t v11 = v34;
    }
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

void __62__WBTabCollection_copyTabsDatabase_hidingSensitiveData_error___block_invoke(uint64_t a1)
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  v113[0] = MEMORY[0x263EF8330];
  v113[1] = 3221225472;
  v113[2] = __62__WBTabCollection_copyTabsDatabase_hidingSensitiveData_error___block_invoke_2;
  v113[3] = &unk_2643DB6B0;
  uint64_t v2 = a1 + 32;
  id v1 = *(void **)(a1 + 32);
  long long v115 = *(_OWORD *)(a1 + 56);
  id v114 = v1;
  v78 = (uint64_t (**)(void))MEMORY[0x21D4A1230](v113);
  BOOL v3 = *(void **)v2;
  uint64_t v4 = *(void *)(*(void *)(v2 + 32) + 8);
  obuint64_t j = *(id *)(v4 + 40);
  LOBYTE(v2) = [v3 openWithAccessType:2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v2)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v111 = *(id *)(v6 + 40);
    char v7 = [v5 executeQuery:@"BEGIN IMMEDIATE" error:&v111];
    objc_storeStrong((id *)(v6 + 40), v111);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7;
    if (v78[2]())
    {
      id v8 = @"BEGIN IMMEDIATE";
    }
    else
    {
      id v9 = (id)[*(id *)(a1 + 32) fetchQuery:@"PRAGMA secure_delete = ON"];
      [*(id *)(*(void *)(a1 + 40) + 16) windowStates];
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      id v74 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v74 countByEnumeratingWithState:&v107 objects:v121 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v108;
        id v8 = @"BEGIN IMMEDIATE";
        while (2)
        {
          uint64_t v12 = 0;
          uint64_t v13 = v8;
          do
          {
            if (*(void *)v108 != v11) {
              objc_enumerationMutation(v74);
            }
            uint64_t v14 = [*(id *)(*((void *)&v107 + 1) + 8 * v12) privateTabGroup];
            uint64_t v15 = [v14 identifier];

            objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM bookmarks WHERE parent IN (SELECT folder_id FROM folder_ancestors WHERE ancestor_id = %d) OR parent = %d OR id = %d", v15, v15, v15);
            id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

            id v16 = *(void **)(a1 + 32);
            uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
            id v106 = *(id *)(v17 + 40);
            char v18 = [v16 executeQuery:v8 error:&v106];
            objc_storeStrong((id *)(v17 + 40), v106);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v18;
            if (v78[2]())
            {

              goto LABEL_14;
            }
            ++v12;
            uint64_t v13 = v8;
          }
          while (v10 != v12);
          uint64_t v10 = [v74 countByEnumeratingWithState:&v107 objects:v121 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v8 = @"BEGIN IMMEDIATE";
      }

      if (*(unsigned char *)(a1 + 72))
      {
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        id v69 = [*(id *)(a1 + 48) keyEnumerator];
        uint64_t v19 = [v69 countByEnumeratingWithState:&v102 objects:v120 count:16];
        if (v19)
        {
          v79 = 0;
          uint64_t v71 = *(void *)v103;
          while (2)
          {
            uint64_t v20 = 0;
            uint64_t v70 = v19;
            do
            {
              if (*(void *)v103 != v71) {
                objc_enumerationMutation(v69);
              }
              uint64_t v72 = v20;
              uint64_t v21 = *(void *)(*((void *)&v102 + 1) + 8 * v20);
              uint64_t v22 = (void *)MEMORY[0x263EFFA08];
              uint64_t v75 = v21;
              long long v23 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:");
              long long v24 = [v22 setWithArray:v23];

              long long v25 = *(void **)(a1 + 32);
              long long v26 = [NSString stringWithFormat:@"select name from PRAGMA_TABLE_INFO('%@')", v75];
              v73 = [v25 fetchQuery:v26];

              v76 = [MEMORY[0x263EFF980] array];
              long long v100 = 0u;
              long long v101 = 0u;
              long long v98 = 0u;
              long long v99 = 0u;
              id v27 = v73;
              uint64_t v28 = [v27 countByEnumeratingWithState:&v98 objects:v119 count:16];
              if (v28)
              {
                uint64_t v29 = *(void *)v99;
                while (2)
                {
                  for (uint64_t i = 0; i != v28; ++i)
                  {
                    if (*(void *)v99 != v29) {
                      objc_enumerationMutation(v27);
                    }
                    BOOL v31 = [*(id *)(*((void *)&v98 + 1) + 8 * i) stringAtIndex:0];
                    if (!v31)
                    {
                      int v41 = 0;
                      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
                      id v33 = v27;
                      goto LABEL_46;
                    }
                    if (([v24 containsObject:v31] & 1) == 0)
                    {
                      [v76 addObject:v31];
                      ++v79;
                    }
                  }
                  uint64_t v28 = [v27 countByEnumeratingWithState:&v98 objects:v119 count:16];
                  if (v28) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v32 = [v27 statement];
              [v32 invalidate];

              long long v96 = 0u;
              long long v97 = 0u;
              long long v94 = 0u;
              long long v95 = 0u;
              id v33 = v76;
              uint64_t v34 = [v33 countByEnumeratingWithState:&v94 objects:v118 count:16];
              if (v34)
              {
                uint64_t v35 = *(void *)v95;
                while (2)
                {
                  uint64_t v36 = 0;
                  id v37 = v8;
                  do
                  {
                    if (*(void *)v95 != v35) {
                      objc_enumerationMutation(v33);
                    }
                    [NSString stringWithFormat:@"UPDATE %@ SET %@ = 'redacted'", v75, *(void *)(*((void *)&v94 + 1) + 8 * v36)];
                    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

                    id v38 = *(void **)(a1 + 32);
                    uint64_t v39 = *(void *)(*(void *)(a1 + 64) + 8);
                    id v93 = *(id *)(v39 + 40);
                    char v40 = [v38 executeQuery:v8 error:&v93];
                    objc_storeStrong((id *)(v39 + 40), v93);
                    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v40;
                    if (v78[2]())
                    {
                      int v41 = 0;
                      goto LABEL_46;
                    }
                    ++v36;
                    id v37 = v8;
                  }
                  while (v34 != v36);
                  uint64_t v34 = [v33 countByEnumeratingWithState:&v94 objects:v118 count:16];
                  int v41 = 1;
                  if (v34) {
                    continue;
                  }
                  break;
                }
              }
              else
              {
                int v41 = 1;
              }
LABEL_46:

              if (!v41)
              {

                goto LABEL_14;
              }
              uint64_t v20 = v72 + 1;
            }
            while (v72 + 1 != v70);
            uint64_t v19 = [v69 countByEnumeratingWithState:&v102 objects:v120 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }
        else
        {
          v79 = 0;
        }

        uint64_t v42 = [*(id *)(a1 + 48) allValues];
        BOOL v43 = (unint64_t)v79 < [v42 count];

        if (v43)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        }
        else
        {
          v77 = [*(id *)(a1 + 32) fetchQuery:@"SELECT name FROM sqlite_master where type='table'"];
          uint64_t v44 = [MEMORY[0x263EFF980] array];
          long long v92 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v89 = 0u;
          id v80 = v77;
          uint64_t v45 = [v80 countByEnumeratingWithState:&v89 objects:v117 count:16];
          if (v45)
          {
            uint64_t v46 = *(void *)v90;
            while (2)
            {
              for (uint64_t j = 0; j != v45; ++j)
              {
                if (*(void *)v90 != v46) {
                  objc_enumerationMutation(v80);
                }
                uint64_t v48 = [*(id *)(*((void *)&v89 + 1) + 8 * j) stringAtIndex:0];
                if (!v48)
                {
                  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;

                  goto LABEL_79;
                }
                [v44 addObject:v48];
              }
              uint64_t v45 = [v80 countByEnumeratingWithState:&v89 objects:v117 count:16];
              if (v45) {
                continue;
              }
              break;
            }
          }

          v49 = [v80 statement];
          [v49 invalidate];

          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          id v50 = v44;
          uint64_t v51 = [v50 countByEnumeratingWithState:&v85 objects:v116 count:16];
          if (v51)
          {
            uint64_t v52 = *(void *)v86;
            while (2)
            {
              for (uint64_t k = 0; k != v51; ++k)
              {
                if (*(void *)v86 != v52) {
                  objc_enumerationMutation(v50);
                }
                v54 = *(void **)(*((void *)&v85 + 1) + 8 * k);
                v55 = [*(id *)(a1 + 48) objectForKeyedSubscript:v54];
                if (v55)
                {
                }
                else if (([v54 isEqualToString:@"sqlite_sequence"] & 1) == 0)
                {
                  v56 = [NSString stringWithFormat:@"DROP TABLE IF EXISTS %@", v54];

                  v57 = *(void **)(a1 + 32);
                  uint64_t v58 = *(void *)(*(void *)(a1 + 64) + 8);
                  id v84 = *(id *)(v58 + 40);
                  char v59 = [v57 executeQuery:v56 error:&v84];
                  objc_storeStrong((id *)(v58 + 40), v84);
                  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v59;
                  if (v78[2]())
                  {

                    goto LABEL_81;
                  }
                  id v8 = v56;
                }
              }
              uint64_t v51 = [v50 countByEnumeratingWithState:&v85 objects:v116 count:16];
              if (v51) {
                continue;
              }
              break;
            }
          }

          unint64_t v60 = [v50 count];
          if (v60 <= [*(id *)(a1 + 48) count])
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_79:
            v56 = v8;
          }
          else
          {

            v61 = *(void **)(a1 + 32);
            uint64_t v62 = *(void *)(*(void *)(a1 + 64) + 8);
            id v83 = *(id *)(v62 + 40);
            char v63 = [v61 executeQuery:@"COMMIT" error:&v83];
            objc_storeStrong((id *)(v62 + 40), v83);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v63;
            if (v78[2]())
            {
              v56 = @"COMMIT";
            }
            else
            {
              v64 = *(void **)(a1 + 32);
              uint64_t v65 = *(void *)(*(void *)(a1 + 64) + 8);
              id v82 = *(id *)(v65 + 40);
              char v66 = [v64 executeQuery:@"VACUUM" error:&v82];
              objc_storeStrong((id *)(v65 + 40), v82);
              *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v66;
              if (v78[2]())
              {
                v56 = @"VACUUM";
              }
              else
              {
                v67 = [*(id *)(a1 + 32) fetchQuery:@"PRAGMA wal_checkpoint(TRUNCATE)"];
                v68 = [v67 nextObject];
                *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v68 intAtIndex:0] == 0;
                [*(id *)(a1 + 32) close];

                v56 = @"PRAGMA wal_checkpoint(TRUNCATE)";
              }
            }
          }
LABEL_81:

          id v8 = v56;
        }
      }
      else
      {
        [*(id *)(a1 + 32) close];
      }
LABEL_14:
    }
  }
}

uint64_t __62__WBTabCollection_copyTabsDatabase_hidingSensitiveData_error___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    return 0;
  }
  [*(id *)(a1 + 32) close];
  return 1;
}

- (void)_addProfile:(id)a3 toLog:(id)a4 hidingSensitiveData:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v7 = a4;
  if (v5) {
    [v9 privacyPreservingDescription];
  }
  else {
  id v8 = [v9 description];
  }
  [v7 appendFormat:@"%@\n\n", v8];
}

- (void)_addTabGroup:(id)a3 toLog:(id)a4 hidingSensitiveData:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v23 = a4;
  uint64_t v21 = v7;
  if (v5) {
    [v7 privacyPreservingDescription];
  }
  else {
  id v8 = [v7 description];
  }
  [v23 appendFormat:@"%@\n", v8];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [v7 tabs];
  uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v13 = NSString;
        if (v5)
        {
          uint64_t v14 = [*(id *)(*((void *)&v24 + 1) + 8 * i) url];
          uint64_t v15 = [v14 absoluteString];
          id v16 = objc_msgSend(v15, "safari_urlHashesOfComponents");
          uint64_t v17 = [v13 stringWithFormat:@"hashed url: %@, ", v16];
        }
        else
        {
          uint64_t v14 = [*(id *)(*((void *)&v24 + 1) + 8 * i) title];
          uint64_t v15 = [v12 url];
          uint64_t v17 = [v13 stringWithFormat:@"title: %@, url: %@, ", v14, v15];
        }

        char v18 = [v12 uuid];
        uint64_t v19 = [v12 bookmark];
        uint64_t v20 = [v19 serverID];
        [v23 appendFormat:@"Tab, %@identifier: %@, server_id: %@\n", v17, v18, v20];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  [v23 appendString:@"\n\n"];
}

- (WebBookmarkTabCollection)tabCollection
{
  return self->_collection;
}

- (unint64_t)maximumTabsPerGroup
{
  return self->_maximumTabsPerGroup;
}

- (void)setMaximumTabsPerGroup:(unint64_t)a3
{
  self->_maximumTabsPerGroup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
}

- (void)initWithConfiguration:(uint64_t)a3 openDatabase:(uint64_t)a4 checkIntegrity:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_collectionWithConfiguration:(uint64_t)a3 checkIntegrity:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_collectionWithConfiguration:(uint64_t)a3 checkIntegrity:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__WBTabCollection__bookmarksFromItems___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21C043000, a2, OS_LOG_TYPE_FAULT, "Skipping item %{private}@ because underlying bookmark is nil", (uint8_t *)&v2, 0xCu);
}

void __58__WBTabCollection_updateTabsInTabGroup_completionHandler___block_invoke_cold_1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_21C043000, log, OS_LOG_TYPE_FAULT, "Not updating tab %{public}@ in tab group %{public}@ because they are different types", buf, 0x16u);
}

void __44__WBTabCollection_scopedBookmarkListWithID___block_invoke_2_cold_1(void *a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_0_3((uint64_t)a1, a2, a3, 1.5047e-36);
  _os_log_error_impl(&dword_21C043000, v5, OS_LOG_TYPE_ERROR, "Could not load a scoped bookmark folder with the id(%d) of a %@.", v4, 0x12u);
}

void __64__WBTabCollection_scopedBookmarkListWithID_filteredUsingString___block_invoke_2_cold_1(void *a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_0_3((uint64_t)a1, a2, a3, 1.5047e-36);
  _os_log_error_impl(&dword_21C043000, v5, OS_LOG_TYPE_ERROR, "Could not filter scoped bookmark folder with the id(%d) of a %@.", v4, 0x12u);
}

void __42__WBTabCollection_scopedBookmarkWithUUID___block_invoke_2_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_21C043000, log, OS_LOG_TYPE_ERROR, "Could not load a scoped bookmark with uuid(%{public}@) of a %@.", buf, 0x16u);
}

@end