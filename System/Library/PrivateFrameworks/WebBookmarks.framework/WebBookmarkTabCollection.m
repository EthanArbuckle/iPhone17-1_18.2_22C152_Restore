@interface WebBookmarkTabCollection
+ (BOOL)isLockedSync;
+ (BOOL)lockSync;
+ (id)_syncLockFileName;
+ (id)collectionWithConfiguration:(id)a3;
+ (id)inMemoryChangeSet;
+ (id)inMemoryChangesFileURL;
- (BOOL)_clearAllSyncData;
- (BOOL)_clearAllSyncKeys;
- (BOOL)_clearUnnamedTabGroupsInWindowWithID:(int)a3;
- (BOOL)_deleteAllLocalTabsAndGroups;
- (BOOL)_deleteAllWindowStates;
- (BOOL)_deleteDefaultProfileIfSavedAsTabGroup;
- (BOOL)_deleteDuplicatePersonalProfilesWithInvalidUUID;
- (BOOL)_deleteMatchingWindows:(id)a3 logAsError:(BOOL)a4;
- (BOOL)_deleteWindowState:(id)a3;
- (BOOL)_deleteWindowState:(id)a3 forApplyingInMemoryChanges:(BOOL)a4;
- (BOOL)_deleteWindowsNotInLastSession;
- (BOOL)_fixLocalBookmarksInSyncableFolders;
- (BOOL)_generateServerIdIfNeededForTabGroup:(id)a3;
- (BOOL)_generateServerIdIfNeededForTabGroupBookmark:(id)a3;
- (BOOL)_markTabsClosed:(id)a3;
- (BOOL)_markWindowStatesAsLastSession:(id)a3;
- (BOOL)_performOSVersionUpgradesFromPreviousVersion:(id)a3;
- (BOOL)_performSafariVersionUpgradesFromPreviousVersion:(id)a3;
- (BOOL)_performSafariVersionUpgradesOutsideSafariProcessFromPreviousVersion:(id)a3;
- (BOOL)_reEncodeSessionStateDataIfNeeded;
- (BOOL)_regenerateSyncPositionsIfNeeded;
- (BOOL)_removeClosedLocallyCreatedUnnamedTabGroups;
- (BOOL)_removePlaceholderTabGroupRecordsOnUpgrade;
- (BOOL)_resetCurrentUserOwnedSharedTabGroupZoneServerChangeTokens;
- (BOOL)_resetSettingsSyncData;
- (BOOL)_restoreMissingSpecialBookmarksWithChangeNotification:(BOOL)a3;
- (BOOL)_saveActiveTabGroupID:(int)a3 inProfileWithID:(int)a4 windowID:(int)a5;
- (BOOL)_saveActiveTabID:(int)a3 inTabGroupWithID:(int)a4 windowID:(int)a5;
- (BOOL)_saveTabGroupRecordsWithMissingCKShareRecord;
- (BOOL)_saveUnnamedTabGroupID:(int)a3 inWindowWithID:(int)a4;
- (BOOL)_saveWindowState:(id)a3;
- (BOOL)_saveWindowState:(id)a3 activeTabGroupID:(int)a4 localTabGroupID:(int)a5 privateTabGroupID:(int)a6;
- (BOOL)_saveWindowState:(id)a3 forApplyingInMemoryChanges:(BOOL)a4;
- (BOOL)_shouldGenerateNewServerIDWhenClearingSyncDataForBookmark:(id)a3;
- (BOOL)allowsScopedBookmarksInTabGroup:(id)a3;
- (BOOL)bookmarkRequiresParent:(id)a3 specialID:(int)a4;
- (BOOL)closeWindowState:(id)a3;
- (BOOL)containsCKShareRecord;
- (BOOL)createTopScopedBookmarkListForTabGroup:(id)a3;
- (BOOL)deleteAllWindowStates;
- (BOOL)deleteSettingWithIdentifier:(int64_t)a3;
- (BOOL)deleteSettingsRecordWithServerID:(id)a3;
- (BOOL)deleteWindowState:(id)a3;
- (BOOL)deleteWindowStates:(id)a3;
- (BOOL)maintainsSyncMetadata;
- (BOOL)resetModifiedStateForSetting:(id)a3 withRecord:(id)a4 value:(id)a5 forBookmarkWithID:(int)a6;
- (BOOL)saveSettings:(id)a3 inParentWithID:(int)a4 parentServerID:(id)a5;
- (BOOL)saveWindowState:(id)a3;
- (BOOL)updateContainsCKShareRecord;
- (NSArray)lastSessionWindowStates;
- (NSArray)pinnedTabs;
- (NSArray)privatePinnedTabs;
- (NSArray)recentlyClosedTabs;
- (NSArray)recentlyClosedWindowStates;
- (NSArray)windowStates;
- (WBWindowState)lastClosedWindowState;
- (WebBookmarkList)recentlyClosedTabList;
- (WebBookmarkTabCollection)initWithConfiguration:(id)a3 checkIntegrity:(BOOL)a4;
- (id)_allUnnamedTabGroupUUIDsFromCurrentWindowStates;
- (id)_generateNewServerIDForBookmark:(id)a3;
- (id)_listOfScopedBookmarkFoldersInTabGroup:(id)a3;
- (id)_specialTabFolderUUIDs;
- (id)_specialTabFolderUUIDsForQueries;
- (id)_specialTabsWithUUID:(id)a3 privateBrowsing:(BOOL)a4;
- (id)_tabGroupForBookmark:(id)a3 kind:(int64_t)a4;
- (id)_tabGroupWithID:(int)a3 kind:(int64_t)a4;
- (id)_topScopedBookmarkListServerIdForTabGroup:(id)a3;
- (id)_uuidForQueries:(id)a3;
- (id)_windowStatesWithFilter:(id)a3;
- (id)allSettingsChangesForParentWithID:(int)a3;
- (id)allSettingsChangesWithWhereClause:(id)a3;
- (id)deviceForBookmark:(id)a3 inProfileWithIdentifier:(id)a4;
- (id)devicesForProfile:(id)a3;
- (id)generatePositionBeforeFirstRecordInParentWithServerID:(id)a3;
- (id)pinnedTabsForProfileWithIdentifier:(id)a3;
- (id)profileForBookmark:(id)a3;
- (id)remoteDevicesForProfileBookmark:(id)a3;
- (id)settingChangeWithName:(id)a3 parentID:(int)a4;
- (id)settingsChangesForAllDeletedSettings;
- (id)settingsForBookmarkWithID:(int)a3;
- (id)tabGroupForBookmark:(id)a3;
- (id)tabGroupsChildrenForBookmark:(id)a3;
- (id)tabsForTabGroupBookmark:(id)a3;
- (id)topScopedBookmarkListForTabGroup:(id)a3 onQueue:(id)a4;
- (id)windowStateWithUUID:(id)a3;
- (int)_cachedPinnedTabsFolderIDForProfileWithIdentifier:(id)a3;
- (int)_windowIDForUUID:(id)a3;
- (int)createLegacyPlaceholderTabGroupBookmarksForSharedTabGroup:(id)a3;
- (int)frequentlyVisitedSitesFolderIDForProfileWithIdentifier:(id)a3;
- (int)pinnedTabsFolderID;
- (int)pinnedTabsFolderIDForProfileWithIdentifier:(id)a3;
- (int)privatePinnedTabsFolderID;
- (unint64_t)_countOfAllLocalTabsToBeDeleted;
- (void)_addActiveTabGroupsToWindowState:(id)a3;
- (void)_addActiveTabsToWindowState:(id)a3;
- (void)_addUnnamedTabGroupsToWindowState:(id)a3;
- (void)_cachePinnedTabsFolderID:(int)a3 forProfileWithIdentifier:(id)a4;
- (void)_createFrequentlyVisitedSitesFolderWithUUIDIfNeeded:(id)a3 withParentID:(int)a4;
- (void)_createParticipantPresenceTable;
- (void)_createSchema;
- (void)_createSpecialFolderWithIDIfNeeded:(int)a3;
- (void)_createSpecialTabsFolderWithUUIDIfNeeded:(id)a3;
- (void)_createSpecialTabsFolderWithUUIDIfNeeded:(id)a3 withParentID:(int)a4;
- (void)_deleteDefaultProfileIfSavedAsTabGroup;
- (void)_deleteDuplicatePersonalProfilesWithInvalidUUID;
- (void)_fixLocalBookmarksInSyncableFolders;
- (void)_logErrorWithMessage:(id)a3 result:(int)a4;
- (void)_migrateSchemaVersion43ToVersion44;
- (void)_migrateSchemaVersion44ToVersion45;
- (void)_migrateSchemaVersion51ToVersion52;
- (void)_migrateSchemaVersion52ToVersion53;
- (void)_migrateSchemaVersion53ToVersion54;
- (void)_migrateSchemaVersion54ToVersion55;
- (void)_migrateWindowBookmark:(id)a3;
- (void)_regenerateSyncPositionsIfNeeded;
- (void)_setupInMemoryChangeSet;
- (void)_slowDownFetchingForTabsCycler;
- (void)createSettingsTable;
- (void)createWindowsProfilesTable;
- (void)createWindowsTabGroupsTable;
- (void)createWindowsTable;
- (void)createWindowsUnnamedTabGroupsTable;
- (void)performMaintenance;
- (void)setContainsCKShareRecord:(BOOL)a3;
@end

@implementation WebBookmarkTabCollection

+ (id)inMemoryChangeSet
{
  return (id)inMemoryTabChangeSet;
}

- (BOOL)maintainsSyncMetadata
{
  return 1;
}

- (BOOL)bookmarkRequiresParent:(id)a3 specialID:(int)a4
{
  id v4 = a3;
  if ([v4 isSyncable]) {
    LOBYTE(v5) = 1;
  }
  else {
    int v5 = [v4 isFolder] ^ 1;
  }

  return v5;
}

BOOL __54__WebBookmarkTabCollection__tabGroupForBookmark_kind___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 bookmark];
  int v4 = [v3 identifier];
  BOOL v5 = v4 == [*(id *)(a1 + 32) lastSelectedChildID];

  return v5;
}

- (BOOL)saveWindowState:(id)a3
{
  return [(WebBookmarkTabCollection *)self _saveWindowState:a3 forApplyingInMemoryChanges:0];
}

- (BOOL)_saveWindowState:(id)a3 forApplyingInMemoryChanges:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __72__WebBookmarkTabCollection__saveWindowState_forApplyingInMemoryChanges___block_invoke;
    v11[3] = &unk_2643DA270;
    v11[4] = self;
    id v12 = v6;
    BOOL v8 = [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:v11 applyInMemoryChanges:!v4 secureDelete:0];
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkTabCollection _saveWindowState:forApplyingInMemoryChanges:]();
    }
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)isLockedSync
{
  return 1;
}

uint64_t __72__WebBookmarkTabCollection__saveWindowState_forApplyingInMemoryChanges___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveWindowState:*(void *)(a1 + 40)];
}

- (BOOL)_saveWindowState:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 localTabGroup];
  id v6 = [v5 bookmark];

  if ([(WebBookmarkCollection *)self _saveBookmark:v6 withSpecialID:0 updateGenerationIfNeeded:1])
  {
    v7 = [v4 privateTabGroup];
    BOOL v8 = [v7 bookmark];

    if ([(WebBookmarkCollection *)self _saveBookmark:v8 withSpecialID:0 updateGenerationIfNeeded:1])
    {
      v9 = [v4 activeTabGroupUUID];
      v10 = [(WebBookmarkCollection *)self bookmarkWithUUID:v9];

      v24 = v10;
      if (-[WebBookmarkTabCollection _saveWindowState:activeTabGroupID:localTabGroupID:privateTabGroupID:](self, "_saveWindowState:activeTabGroupID:localTabGroupID:privateTabGroupID:", v4, [v10 identifier], objc_msgSend(v6, "identifier"), objc_msgSend(v8, "identifier")))
      {
        v11 = [v4 uuid];
        uint64_t v12 = [(WebBookmarkTabCollection *)self _windowIDForUUID:v11];

        [v4 setIdentifier:v12];
        uint64_t v33 = 0;
        v34 = &v33;
        uint64_t v35 = 0x2020000000;
        char v36 = 0;
        v13 = [v4 tabGroupsToActiveTabs];
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __45__WebBookmarkTabCollection__saveWindowState___block_invoke;
        v31[3] = &unk_2643DA298;
        int v32 = v12;
        v31[4] = self;
        v31[5] = &v33;
        [v13 enumerateKeysAndObjectsUsingBlock:v31];

        v14 = [v4 profilesToActiveTabGroups];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __45__WebBookmarkTabCollection__saveWindowState___block_invoke_2;
        v29[3] = &unk_2643DA298;
        int v30 = v12;
        v29[4] = self;
        v29[5] = &v33;
        [v14 enumerateKeysAndObjectsUsingBlock:v29];

        if ([(WebBookmarkTabCollection *)self _clearUnnamedTabGroupsInWindowWithID:v12])
        {
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          v15 = [v4 unnamedTabGroupUUIDs];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v37 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v26;
            while (2)
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v26 != v17) {
                  objc_enumerationMutation(v15);
                }
                v19 = [(WebBookmarkCollection *)self bookmarkWithUUID:*(void *)(*((void *)&v25 + 1) + 8 * i)];
                if ([v19 identifier]
                  && !-[WebBookmarkTabCollection _saveUnnamedTabGroupID:inWindowWithID:](self, "_saveUnnamedTabGroupID:inWindowWithID:", [v19 identifier], v12))
                {
                  *((unsigned char *)v34 + 24) = 1;

                  goto LABEL_24;
                }
              }
              uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v37 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }
LABEL_24:

          BOOL v21 = *((unsigned char *)v34 + 24) == 0;
        }
        else
        {
          BOOL v21 = 0;
        }
        _Block_object_dispose(&v33, 8);
      }
      else
      {
        BOOL v21 = 0;
      }
    }
    else
    {
      v22 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkTabCollection _saveWindowState:]();
      }
      BOOL v21 = 0;
    }
  }
  else
  {
    v20 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkTabCollection _saveWindowState:]();
    }
    BOOL v21 = 0;
  }

  return v21;
}

- (void)_saveWindowState:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Failed to save local tab group while trying to save window state", v2, v3, v4, v5, v6);
}

- (int)frequentlyVisitedSitesFolderIDForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F66420]])
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(WebBookmarkCollection *)self bookmarkWithUUID:v4];
  }
  uint8_t v6 = [NSString stringWithFormat:@"fvs-%@", v4];
  if (v5) {
    uint64_t v7 = [v5 identifier];
  }
  else {
    uint64_t v7 = 0x7FFFFFFFLL;
  }
  [(WebBookmarkTabCollection *)self _createFrequentlyVisitedSitesFolderWithUUIDIfNeeded:v6 withParentID:v7];
  BOOL v8 = [(WebBookmarkCollection *)self bookmarkWithUUID:v6];
  int v9 = [v8 identifier];

  return v9;
}

- (void)_createFrequentlyVisitedSitesFolderWithUUIDIfNeeded:(id)a3 withParentID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(WebBookmarkCollection *)self bookmarkWithUUID:v6];
  if (!v7)
  {
    id v8 = [[WebBookmark alloc] initFolderWithParentID:v4 collectionType:1];
    [v8 setSubtype:5];
    [v8 setTitle:v6];
    [v8 _setUUID:v6];
    [v8 _setSyncable:0];
    v10 = @"com.apple.bookmarks.OmitFromUI";
    v11[0] = MEMORY[0x263EFFA88];
    int v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v8 setExtraAttributes:v9];

    [(WebBookmarkCollection *)self _saveBookmark:v8 withSpecialID:0 updateGenerationIfNeeded:1];
  }
}

- (id)profileForBookmark:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(WebBookmarkTabCollection *)self _slowDownFetchingForTabsCycler];
    uint64_t v5 = [(WebBookmarkTabCollection *)self tabGroupsChildrenForBookmark:v4];
    id v6 = [[WBMutableProfile alloc] initWithBookmark:v4 tabGroups:v5];
    if (![(WBProfile *)v6 isDefault])
    {
      uint64_t v7 = [(WebBookmarkTabCollection *)self devicesForProfile:v6];
      [(WBMutableProfile *)v6 setDevices:v7];
    }
    id v8 = -[WebBookmarkTabCollection settingsForBookmarkWithID:](self, "settingsForBookmarkWithID:", [v4 identifier]);
    [(WBMutableProfile *)v6 setSettingsDictionary:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)tabGroupsChildrenForBookmark:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [WebBookmarkListQuery alloc];
  id v6 = [v4 UUID];
  if ([v6 isEqualToString:*MEMORY[0x263F66420]]) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = [v4 identifier];
  }
  id v8 = [(WebBookmarkListQuery *)v5 initWithFolderID:v7 inCollection:self usingFilter:0 options:260];

  int v9 = [[WebBookmarkList alloc] initWithQuery:v8 skipOffset:0 collection:self];
  v10 = [(WebBookmarkList *)v9 bookmarkArray];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__WebBookmarkTabCollection_tabGroupsChildrenForBookmark___block_invoke;
  v15[3] = &unk_2643DA220;
  v15[4] = self;
  v11 = objc_msgSend(v10, "safari_mapObjectsUsingBlock:", v15);
  uint64_t v12 = v11;
  if (!v11) {
    v11 = (void *)MEMORY[0x263EFFA68];
  }
  id v13 = v11;

  return v13;
}

- (id)settingsForBookmarkWithID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [NSString stringWithFormat:@"SELECT key, value, generation, device_identifier FROM settings WHERE parent = %d", *(void *)&a3];
  db = self->super._db;
  id v7 = v5;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21, db, (const char *)[v7 UTF8String]);
  if (v23)
  {
    id v20 = v7;
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
    while (sqlite3_step(v22) == 100)
    {
      int v9 = v22;
      v10 = WBUTF8StringFromSQLStatement(v22, 0);
      v11 = WBObjectFromColumn(v9, 1);
      sqlite3_int64 v12 = sqlite3_column_int64(v9, 2);
      id v13 = WBUTF8StringFromSQLStatement(v9, 3);
      v14 = (void *)[objc_alloc(MEMORY[0x263F66610]) initWithDeviceIdentifier:v13 generation:v12];
      id v15 = objc_alloc(MEMORY[0x263F66608]);
      uint64_t v16 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
      uint64_t v17 = (void *)[v15 initWithValue:v11 generation:v14 deviceIdentifier:v16];

      [v8 setObject:v17 forKeyedSubscript:v10];
    }
    id v7 = v20;
  }
  else
  {
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to fetch profile settings for profile %d", v3);
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:v18 result:v24];

    id v8 = (void *)MEMORY[0x263EFFA78];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21);

  return v8;
}

- (void)_slowDownFetchingForTabsCycler
{
  if ([MEMORY[0x263F66638] isTabCyclerEnabled]
    && [MEMORY[0x263F66638] shouldTabCyclerSlowDown])
  {
    uint64_t v2 = (void *)MEMORY[0x263F08B88];
    [v2 sleepForTimeInterval:0.2];
  }
}

- (NSArray)windowStates
{
  return (NSArray *)[(WebBookmarkTabCollection *)self _windowStatesWithFilter:@"WHERE windows.date_closed IS NULL"];
}

- (NSArray)privatePinnedTabs
{
  return (NSArray *)[(WebBookmarkTabCollection *)self _specialTabsWithUUID:@"privatePinned" privateBrowsing:1];
}

- (NSArray)pinnedTabs
{
  return (NSArray *)[(WebBookmarkTabCollection *)self _specialTabsWithUUID:@"pinned" privateBrowsing:0];
}

- (id)_windowStatesWithFilter:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = (__CFString *)a3;
  uint64_t v5 = &stru_26CC2ED50;
  if (v4) {
    uint64_t v5 = v4;
  }
  int v30 = v4;
  id v6 = [NSString stringWithFormat:@"SELECT tab_group_bookmarks.external_uuid, profile_bookmarks.external_uuid, windows.local_tab_group_id, windows.private_tab_group_id, windows.scene_id, windows.uuid, windows.id, windows.extra_attributes FROM windows INNER JOIN bookmarks AS tab_group_bookmarks ON windows.active_tab_group_id = tab_group_bookmarks.id LEFT JOIN bookmarks AS profile_bookmarks ON windows.active_profile_id = profile_bookmarks.id %@", v5];
  uint64_t v35 = self;
  db = self->super._db;
  id v31 = v6;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v36, db, (const char *)[v31 UTF8String]);
  if (v38)
  {
    id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
    int v32 = (void *)*MEMORY[0x263F66420];
    while (sqlite3_step(v37) == 100)
    {
      id v8 = v37;
      v34 = WBUTF8StringFromSQLStatement(v37, 0);
      int v9 = WBUTF8StringFromSQLStatement(v8, 1);
      uint64_t v10 = sqlite3_column_int(v8, 2);
      uint64_t v11 = sqlite3_column_int(v8, 3);
      sqlite3_int64 v12 = WBUTF8StringFromSQLStatement(v8, 4);
      id v13 = WBUTF8StringFromSQLStatement(v8, 5);
      uint64_t v14 = sqlite3_column_int(v8, 6);
      id v15 = WBDataFromNullableColumn(v8, 7);
      if (v15)
      {
        uint64_t v16 = [MEMORY[0x263F08AC0] propertyListWithData:v15 options:2 format:0 error:0];
      }
      else
      {
        uint64_t v16 = 0;
      }
      uint64_t v17 = [(WebBookmarkTabCollection *)v35 _tabGroupWithID:v10 kind:0];
      v18 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = [v17 tabs];
        uint64_t v20 = [v19 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v41 = v20;
        _os_log_impl(&dword_21C043000, v18, OS_LOG_TYPE_INFO, "Window state local tab group count: %zu", buf, 0xCu);
      }
      uint64_t v21 = [(WebBookmarkTabCollection *)v35 _tabGroupWithID:v11 kind:1];
      v22 = (void *)v21;
      if (v17 && v21)
      {
        char v23 = [[WBWindowState alloc] initWithUUID:v13 activeTabGroupUUID:v34 localTabGroup:v17 privateTabGroup:v21 sceneID:v12 windowID:v14];
        unsigned int v24 = v23;
        if (v9) {
          long long v25 = v9;
        }
        else {
          long long v25 = v32;
        }
        [(WBWindowState *)v23 setActiveProfileIdentifier:v25];
        [(WBWindowState *)v24 setExtraAttributes:v16];
        [(WebBookmarkTabCollection *)v35 _addActiveTabsToWindowState:v24];
        [(WebBookmarkTabCollection *)v35 _addActiveTabGroupsToWindowState:v24];
        [(WebBookmarkTabCollection *)v35 _addUnnamedTabGroupsToWindowState:v24];
        [v33 addObject:v24];
      }
      else
      {
        long long v26 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C043000, v26, OS_LOG_TYPE_INFO, "Skipped window state from DB due to missing tab group.", buf, 2u);
        }
      }
    }
    long long v27 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = [v33 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v41 = v28;
      _os_log_impl(&dword_21C043000, v27, OS_LOG_TYPE_INFO, "Fetched %zu window states with filter", buf, 0xCu);
    }
  }
  else
  {
    [(WebBookmarkTabCollection *)v35 _logErrorWithMessage:@"Failed to fetch window states" result:v39];
    id v33 = (id)MEMORY[0x263EFFA68];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v36);

  return v33;
}

- (id)_tabGroupWithID:(int)a3 kind:(int64_t)a4
{
  id v6 = [(WebBookmarkCollection *)self bookmarkWithID:*(void *)&a3];
  if (v6)
  {
    id v7 = [(WebBookmarkTabCollection *)self _tabGroupForBookmark:v6 kind:a4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_addUnnamedTabGroupsToWindowState:(id)a3
{
  id v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, self->super._db, (const char *)[@"SELECT external_uuid FROM bookmarks INNER JOIN windows_unnamed_tab_groups ON bookmarks.id = windows_unnamed_tab_groups.tab_group_id WHERE windows_unnamed_tab_groups.window_id = ?" UTF8String]);
  if (v13)
  {
    uint64_t v5 = [v4 uuid];
    int v6 = [(WebBookmarkTabCollection *)self _windowIDForUUID:v5];

    sqlite3_bind_int(v12, 1, v6);
    id v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "Setting unnamed tab groups on window state", v10, 2u);
    }
    while (sqlite3_step(v12) == 100)
    {
      id v8 = WBUTF8StringFromSQLStatement(v12, 0);
      [v4 addUnnamedTabGroupUUID:v8];
      int v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Unnamed tab group set on window state", v10, 2u);
      }
    }
  }
  else
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to fetch unnamed tab groups" result:v14];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);
}

- (void)_addActiveTabsToWindowState:(id)a3
{
  id v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13, self->super._db, (const char *)objc_msgSend(@"SELECT tab_bookmarks.external_uuid, tab_group_bookmarks.external_uuid FROM bookmarks AS tab_bookmarks INNER JOIN windows_tab_groups ON tab_bookmarks.id = windows_tab_groups.active_tab_id INNER JOIN bookmarks AS tab_group_bookmarks ON windows_tab_groups.tab_group_id = tab_group_bookmarks.id WHERE windows_tab_groups.window_id = ?", "UTF8String"));
  if (v15)
  {
    uint64_t v5 = [v4 uuid];
    int v6 = [(WebBookmarkTabCollection *)self _windowIDForUUID:v5];

    sqlite3_bind_int(v14, 1, v6);
    id v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)sqlite3_int64 v12 = 0;
      _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "Setting active tab on window state", v12, 2u);
    }
    while (sqlite3_step(v14) == 100)
    {
      id v8 = v14;
      int v9 = WBUTF8StringFromSQLStatement(v14, 0);
      uint64_t v10 = WBUTF8StringFromSQLStatement(v8, 1);
      [v4 setActiveTabUUID:v9 forTabGroupWithUUID:v10];
      uint64_t v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)sqlite3_int64 v12 = 0;
        _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "Active tab set on window state", v12, 2u);
      }
    }
  }
  else
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to fetch active tabs" result:v16];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13);
}

- (int)_windowIDForUUID:(id)a3
{
  id v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, self->super._db, (const char *)[@"SELECT windows.id FROM windows WHERE windows.uuid = ?" UTF8String]);
  if (!v9)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to fetch window id" result:v10];
    goto LABEL_5;
  }
  sqlite3_bind_text(v8, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v8) != 100)
  {
LABEL_5:
    int v5 = -1;
    goto LABEL_6;
  }
  int v5 = sqlite3_column_int(v8, 0);
LABEL_6:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);

  return v5;
}

- (void)_addActiveTabGroupsToWindowState:(id)a3
{
  id v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13, self->super._db, (const char *)objc_msgSend(@"SELECT tab_group_bookmarks.external_uuid, profile_bookmarks.external_uuid FROM bookmarks AS tab_group_bookmarks INNER JOIN windows_profiles ON tab_group_bookmarks.id = windows_profiles.active_tab_group_id INNER JOIN bookmarks AS profile_bookmarks ON windows_profiles.profile_id = profile_bookmarks.id WHERE windows_profiles.window_id = ?", "UTF8String"));
  if (v15)
  {
    int v5 = [v4 uuid];
    int v6 = [(WebBookmarkTabCollection *)self _windowIDForUUID:v5];

    sqlite3_bind_int(v14, 1, v6);
    id v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)sqlite3_int64 v12 = 0;
      _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "Setting active tab groups on window state", v12, 2u);
    }
    while (sqlite3_step(v14) == 100)
    {
      id v8 = v14;
      char v9 = WBUTF8StringFromSQLStatement(v14, 0);
      unsigned int v10 = WBUTF8StringFromSQLStatement(v8, 1);
      [v4 setActiveTabGroupUUID:v9 forProfileWithIdentifier:v10];
      uint64_t v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)sqlite3_int64 v12 = 0;
        _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "Active tab group set on window state", v12, 2u);
      }
    }
  }
  else
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to fetch active tab groups" result:v16];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13);
}

- (id)_specialTabsWithUUID:(id)a3 privateBrowsing:(BOOL)a4
{
  int v6 = [(WebBookmarkCollection *)self bookmarkWithUUID:a3];
  id v7 = v6;
  if (v6)
  {
    id v8 = -[WebBookmarkCollection listWithID:](self, "listWithID:", [v6 identifier]);
    char v9 = [v8 bookmarkArray];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __65__WebBookmarkTabCollection__specialTabsWithUUID_privateBrowsing___block_invoke;
    v12[3] = &__block_descriptor_33_e28___WBTab_16__0__WebBookmark_8l;
    BOOL v13 = a4;
    unsigned int v10 = objc_msgSend(v9, "safari_mapObjectsUsingBlock:", v12);
  }
  else
  {
    unsigned int v10 = (void *)MEMORY[0x263EFFA68];
  }

  return v10;
}

- (id)_tabGroupForBookmark:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [(WebBookmarkTabCollection *)self tabsForTabGroupBookmark:v6];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __54__WebBookmarkTabCollection__tabGroupForBookmark_kind___block_invoke;
    v14[3] = &unk_2643DA1F8;
    id v8 = v6;
    id v15 = v8;
    char v9 = objc_msgSend(v7, "safari_firstObjectPassingTest:", v14);
    unsigned int v10 = [WBMutableTabGroup alloc];
    uint64_t v11 = [v9 uuid];
    sqlite3_int64 v12 = [(WBMutableTabGroup *)v10 initWithBookmark:v8 tabs:v7 lastSelectedTabUUID:v11 kind:a4];
  }
  else
  {
    sqlite3_int64 v12 = 0;
  }

  return v12;
}

- (id)tabsForTabGroupBookmark:(id)a3
{
  id v4 = a3;
  int v5 = -[WebBookmarkListQuery initWithFolderID:inCollection:usingFilter:options:]([WebBookmarkListQuery alloc], "initWithFolderID:inCollection:usingFilter:options:", [v4 identifier], self, 0, 2);
  id v6 = [[WebBookmarkList alloc] initWithQuery:v5 skipOffset:0 collection:self];
  id v7 = [(WebBookmarkList *)v6 bookmarkArray];
  id v8 = objc_msgSend(v7, "safari_mapObjectsUsingBlock:", &__block_literal_global_193);
  char v9 = v8;
  if (!v8) {
    id v8 = (void *)MEMORY[0x263EFFA68];
  }
  id v10 = v8;

  return v10;
}

- (BOOL)_restoreMissingSpecialBookmarksWithChangeNotification:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WebBookmarkTabCollection;
  BOOL v4 = [(WebBookmarkCollection *)&v6 _restoreMissingSpecialBookmarksWithChangeNotification:a3];
  if (v4)
  {
    [(WebBookmarkTabCollection *)self _createSpecialTabsFolderWithUUIDIfNeeded:@"pinned"];
    [(WebBookmarkTabCollection *)self _createSpecialTabsFolderWithUUIDIfNeeded:@"privatePinned"];
    [(WebBookmarkTabCollection *)self _createSpecialTabsFolderWithUUIDIfNeeded:@"recentlyClosed"];
  }
  return v4;
}

- (void)_createSpecialTabsFolderWithUUIDIfNeeded:(id)a3 withParentID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(WebBookmarkCollection *)self bookmarkWithUUID:v6];
  if (!v7)
  {
    id v8 = [[WebBookmark alloc] initFolderWithParentID:v4 collectionType:1];
    [v8 setTitle:v6];
    [v8 _setUUID:v6];
    [v8 _setSyncable:0];
    id v10 = @"com.apple.bookmarks.OmitFromUI";
    v11[0] = MEMORY[0x263EFFA88];
    char v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v8 setExtraAttributes:v9];

    [(WebBookmarkCollection *)self _saveBookmark:v8 withSpecialID:0 updateGenerationIfNeeded:1];
  }
}

- (void)_createSpecialTabsFolderWithUUIDIfNeeded:(id)a3
{
}

void __51__WebBookmarkTabCollection__setupInMemoryChangeSet__block_invoke()
{
  v0 = [WebBookmarkChangeSet alloc];
  id v3 = [(id)objc_opt_class() inMemoryChangesFileURL];
  uint64_t v1 = -[WebBookmarkChangeSet initWithFileURL:](v0, "initWithFileURL:");
  uint64_t v2 = (void *)inMemoryTabChangeSet;
  inMemoryTabChangeSet = v1;
}

+ (id)inMemoryChangesFileURL
{
  uint64_t v2 = NSURL;
  id v3 = [a1 safariDirectoryPath];
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"TabChanges.plist"];
  int v5 = [v2 fileURLWithPath:v4];

  return v5;
}

- (void)_setupInMemoryChangeSet
{
  if ([(WebBookmarkCollection *)self _trackChangesInMemoryIfDatabaseWriteIsNotAllowed])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__WebBookmarkTabCollection__setupInMemoryChangeSet__block_invoke;
    block[3] = &unk_2643DA0D0;
    block[4] = self;
    if (-[WebBookmarkTabCollection _setupInMemoryChangeSet]::onceToken != -1) {
      dispatch_once(&-[WebBookmarkTabCollection _setupInMemoryChangeSet]::onceToken, block);
    }
  }
}

- (WebBookmarkTabCollection)initWithConfiguration:(id)a3 checkIntegrity:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WebBookmarkTabCollection;
  return [(WebBookmarkCollection *)&v5 initWithConfiguration:a3 checkIntegrity:a4];
}

+ (BOOL)lockSync
{
  return 1;
}

WBMutableTab *__52__WebBookmarkTabCollection_tabsForTabGroupBookmark___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(WBTab *)[WBMutableTab alloc] initWithBookmark:v2];

  return v3;
}

+ (id)collectionWithConfiguration:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 storeOwner];
  if (v4 >= 3) {
    objc_super v5 = 0;
  }
  else {
    objc_super v5 = (void *)[objc_alloc(*off_2643DA348[v4]) initWithConfiguration:v3];
  }

  return v5;
}

+ (id)_syncLockFileName
{
  return @"com.apple.WebBookmarks.SafariTabs.lock";
}

- (void)_createSchema
{
  v3.receiver = self;
  v3.super_class = (Class)WebBookmarkTabCollection;
  [(WebBookmarkCollection *)&v3 _createSchema];
  [(WebBookmarkTabCollection *)self createWindowsTable];
  [(WebBookmarkTabCollection *)self createWindowsTabGroupsTable];
  [(WebBookmarkTabCollection *)self createWindowsProfilesTable];
  [(WebBookmarkTabCollection *)self createWindowsUnnamedTabGroupsTable];
  [(WebBookmarkTabCollection *)self createSettingsTable];
}

- (void)createWindowsTable
{
  [(WebBookmarkCollection *)self _executeSQL:@"CREATE TABLE IF NOT EXISTS windows (id INTEGER PRIMARY KEY,active_tab_group_id INTEGER DEFAULT NULL,active_profile_id INTEGER DEFAULT NULL,date_closed REAL DEFAULT NULL,extra_attributes BLOB DEFAULT NULL,is_last_session INTEGER DEFAULT 0,local_tab_group_id INTEGER DEFAULT NULL,private_tab_group_id INTEGER DEFAULT NULL,scene_id TEXT DEFAULT NULL,uuid TEXT NOT NULL UNIQUE,FOREIGN KEY (active_tab_group_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE SET NULL,FOREIGN KEY (active_profile_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE SET NULL,FOREIGN KEY (local_tab_group_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE CASCADE,FOREIGN KEY (private_tab_group_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE CASCADE)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX IF NOT EXISTS uuid_index ON windows (uuid)"];
}

- (void)createWindowsTabGroupsTable
{
  [(WebBookmarkCollection *)self _executeSQL:@"CREATE TABLE IF NOT EXISTS windows_tab_groups (id INTEGER PRIMARY KEY,active_tab_id INTEGER DEFAULT NULL,tab_group_id INTEGER NOT NULL,window_id INTEGER NOT NULL,FOREIGN KEY (active_tab_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE CASCADE,FOREIGN KEY (tab_group_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE CASCADE,FOREIGN KEY (window_id) REFERENCES windows (id) ON UPDATE CASCADE ON DELETE CASCADE,UNIQUE (tab_group_id, window_id))"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX IF NOT EXISTS window_index ON windows_tab_groups (window_id)"];
}

- (void)createWindowsProfilesTable
{
  [(WebBookmarkCollection *)self _executeSQL:@"CREATE TABLE IF NOT EXISTS windows_profiles (id INTEGER PRIMARY KEY,active_tab_group_id INTEGER DEFAULT NULL,profile_id INTEGER NOT NULL,window_id INTEGER NOT NULL,FOREIGN KEY (active_tab_group_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE CASCADE,FOREIGN KEY (profile_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE CASCADE,FOREIGN KEY (window_id) REFERENCES windows (id) ON UPDATE CASCADE ON DELETE CASCADE,UNIQUE (profile_id, window_id))"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX IF NOT EXISTS window_index ON windows_profiles (window_id)"];
}

- (void)createWindowsUnnamedTabGroupsTable
{
  [(WebBookmarkCollection *)self _executeSQL:@"CREATE TABLE IF NOT EXISTS windows_unnamed_tab_groups (id INTEGER PRIMARY KEY,tab_group_id INTEGER NOT NULL,window_id INTEGER NOT NULL,FOREIGN KEY (tab_group_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE CASCADE,FOREIGN KEY (window_id) REFERENCES windows (id) ON UPDATE CASCADE ON DELETE CASCADE,UNIQUE (tab_group_id, window_id))"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX IF NOT EXISTS window_index ON windows_unnamed_tab_groups (window_id)"];
}

- (void)createSettingsTable
{
  [(WebBookmarkCollection *)self _executeSQL:@"CREATE TABLE IF NOT EXISTS settings (id INTEGER PRIMARY KEY, key TEXT NOT NULL, value NUMERIC NOT NULL, generation INTEGER NOT NULL, device_identifier TEXT NOT NULL, parent INTEGER, sync_data BLOB, modified INTEGER NOT NULL, deleted INTEGER NOT NULL, server_id TEXT,FOREIGN KEY (parent) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE SET NULL, UNIQUE (key, parent))"];
  [(WebBookmarkCollection *)self _executeSQL:@"CREATE TRIGGER delete_settings AFTER UPDATE OF parent ON settings BEGIN UPDATE settings SET deleted = 1 WHERE parent IS NULL; END"];
}

- (void)performMaintenance
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__WebBookmarkTabCollection_performMaintenance__block_invoke;
  v3[3] = &unk_2643DA0F8;
  v3[4] = self;
  [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:v3 secureDelete:0];
  [(WebBookmarkCollection *)self incrementalVacuumIfNeeded];
  [(WebBookmarkCollection *)self truncateWAL];
}

uint64_t __46__WebBookmarkTabCollection_performMaintenance__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _deleteMatchingWindows:@"WHERE local_tab_group_id = 0 OR local_tab_group_id IS NULL OR private_tab_group_id = 0 OR private_tab_group_id IS NULL" logAsError:1];
  [*(id *)(a1 + 32) _deleteMatchingWindows:@"WHERE local_tab_group_id IN (SELECT windows.local_tab_group_id FROM windows LEFT JOIN bookmarks ON windows.local_tab_group_id = bookmarks.id WHERE bookmarks.id IS NULL)" logAsError:1];
  [*(id *)(a1 + 32) _deleteMatchingWindows:@"WHERE private_tab_group_id IN (SELECT windows.private_tab_group_id FROM windows LEFT JOIN bookmarks ON windows.private_tab_group_id = bookmarks.id WHERE bookmarks.id IS NULL)" logAsError:1];
  id v2 = [*(id *)(a1 + 32) _fastFetchBookmarksInBookmarkFolder:0 options:2 offset:0 limit:0];
  [*(id *)(a1 + 32) _deleteBookmarks:v2 leaveTombstone:1];
  objc_super v3 = [*(id *)(a1 + 32) _fastFetchBookmarksInBookmarkFolder:0 options:4 offset:0 limit:0];
  unint64_t v4 = objc_msgSend(v3, "safari_filterObjectsUsingBlock:", &__block_literal_global_7);

  [*(id *)(a1 + 32) _deleteBookmarks:v4 leaveTombstone:0];
  return 1;
}

BOOL __46__WebBookmarkTabCollection_performMaintenance__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 subtype] == 1;
}

- (void)_migrateWindowBookmark:(id)a3
{
  id v28 = a3;
  unint64_t v4 = [v28 UUID];
  objc_super v5 = [(WebBookmarkTabCollection *)self windowStateWithUUID:v4];

  if (!v5)
  {
    id v6 = -[WebBookmarkCollection listWithID:skipOffset:includeHidden:](self, "listWithID:skipOffset:includeHidden:", [v28 identifier], 0, 1);
    id v7 = [v6 bookmarkArray];

    if ((unint64_t)[v7 count] < 2)
    {
LABEL_9:

      goto LABEL_10;
    }
    id v8 = [v7 objectAtIndexedSubscript:0];
    char v9 = [(WebBookmarkTabCollection *)self tabGroupForBookmark:v8];

    [v9 setKind:0];
    id v10 = [v7 objectAtIndexedSubscript:1];
    uint64_t v11 = [(WebBookmarkTabCollection *)self tabGroupForBookmark:v10];

    [v11 setKind:1];
    int v12 = [v28 lastSelectedChildID];
    if (v12 == [v9 identifier])
    {
      id v13 = v9;
    }
    else
    {
      if (v12 != [v11 identifier])
      {
        if (v12 == 0x7FFFFFFF)
        {
          unsigned int v14 = 0;
        }
        else
        {
          long long v27 = -[WebBookmarkCollection bookmarkWithID:includingInMemoryChanges:](self, "bookmarkWithID:includingInMemoryChanges:", [v28 lastSelectedChildID], 1);
          if (v27)
          {
            unsigned int v14 = [(WebBookmarkTabCollection *)self tabGroupForBookmark:v27];
          }
          else
          {
            unsigned int v14 = 0;
          }
        }
        goto LABEL_8;
      }
      id v13 = v11;
    }
    unsigned int v14 = v13;
LABEL_8:
    id v15 = [WBWindowState alloc];
    unsigned int v16 = [v28 UUID];
    uint64_t v17 = [v14 uuid];
    v18 = [v28 extraAttributes];
    v19 = [v18 objectForKeyedSubscript:@"sceneID"];
    uint64_t v20 = [(WBWindowState *)v15 initWithUUID:v16 activeTabGroupUUID:v17 localTabGroup:v9 privateTabGroup:v11 sceneID:v19 windowID:0x7FFFFFFFLL];

    uint64_t v21 = [v28 extraAttributes];
    [(WBWindowState *)v20 setExtraAttributes:v21];

    [(WebBookmarkTabCollection *)self saveWindowState:v20];
    v22 = NSString;
    char v23 = [(WBWindowState *)v20 uuid];
    unsigned int v24 = [(WebBookmarkTabCollection *)self _uuidForQueries:v23];
    long long v25 = [v22 stringWithFormat:@"UPDATE windows SET is_last_session = 1 WHERE uuid = %@", v24];

    id v26 = v25;
    -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", [v26 UTF8String]);

    goto LABEL_9;
  }
LABEL_10:
}

- (void)_migrateSchemaVersion43ToVersion44
{
  [(id)inMemoryTabChangeSet removeAllChanges];
  [(WebBookmarkTabCollection *)self _restoreMissingSpecialBookmarksWithChangeNotification:0];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 44"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion44ToVersion45
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  [(WebBookmarkTabCollection *)self createWindowsTable];
  [(WebBookmarkTabCollection *)self createWindowsTabGroupsTable];
  [(WebBookmarkCollection *)self applyInMemoryChangesToDatabase];
  objc_super v3 = [(WebBookmarkCollection *)self listWithSpecialID:6];
  if ([v3 bookmarkCount])
  {
    [(WebBookmarkTabCollection *)self _deleteAllWindowStates];
    [(WebBookmarkCollection *)self _fastFetchBookmarksInBookmarkFolder:0 includingHiddenBookmarks:1];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
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
          id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (([v8 isSyncable] & 1) == 0)
          {
            char v9 = [v8 title];
            if (([v9 isEqualToString:@"Local"] & 1) != 0
              || [v9 isEqualToString:@"Private"])
            {
              [(WebBookmarkCollection *)self deleteBookmark:v8 leaveTombstone:0];
            }
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v5);
    }
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v10 = objc_msgSend(v3, "bookmarkArray", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        [(WebBookmarkTabCollection *)self _migrateWindowBookmark:*(void *)(*((void *)&v14 + 1) + 8 * j)];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }

  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 45"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion51ToVersion52
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE windows ADD COLUMN active_profile_id INTEGER DEFAULT NULL"];
  [(WebBookmarkTabCollection *)self createWindowsProfilesTable];
  [(WebBookmarkTabCollection *)self createWindowsUnnamedTabGroupsTable];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 52"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion52ToVersion53
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkTabCollection *)self createSettingsTable];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 53"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion53ToVersion54
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE settings ADD COLUMN server_id TEXT"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 54"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion54ToVersion55
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE settings ADD COLUMN server_id TEXT"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 55"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (BOOL)_deleteMatchingWindows:(id)a3 logAsError:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v24 = (__CFString *)a3;
  uint64_t v6 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)int v32 = v24;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "Deleting windows with condition: %@", buf, 0xCu);
  }
  if (v24) {
    id v7 = v24;
  }
  else {
    id v7 = &stru_26CC2ED50;
  }
  id v8 = [NSString stringWithFormat:@"SELECT id, uuid FROM windows %@", v7];
  db = self->super._db;
  id v23 = v8;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, db, (const char *)[v23 UTF8String]);
  if (v33)
  {
    int v10 = 0;
    while (sqlite3_step(*(sqlite3_stmt **)&v32[4]) == 100)
    {
      uint64_t v11 = *(sqlite3_stmt **)&v32[4];
      sqlite3_int64 v12 = sqlite3_column_int64(*(sqlite3_stmt **)&v32[4], 0);
      id v13 = WBUTF8StringFromSQLStatement(v11, 1);
      if (v4)
      {
        long long v14 = WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v29 = 134218242;
          *(void *)int v30 = v12;
          *(_WORD *)&v30[8] = 2112;
          *(void *)&v30[10] = v13;
          _os_log_error_impl(&dword_21C043000, v14, OS_LOG_TYPE_ERROR, "Delete invalid window %lli %@", v29, 0x16u);
        }
      }
      else
      {
        long long v15 = WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v29 = 134218242;
          *(void *)int v30 = v12;
          *(_WORD *)&v30[8] = 2112;
          *(void *)&v30[10] = v13;
          _os_log_impl(&dword_21C043000, v15, OS_LOG_TYPE_INFO, "Delete window %lli %@", v29, 0x16u);
        }
      }

      ++v10;
    }
    long long v16 = [NSString stringWithFormat:@"DELETE FROM windows %@", v7];
    long long v17 = self->super._db;
    id v18 = v16;
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v29, v17, (const char *)[v18 UTF8String]);
    if (v30[12])
    {
      uint64_t v19 = sqlite3_step(*(sqlite3_stmt **)&v30[4]);
      if (v19 == 101)
      {
        long long v20 = WBS_LOG_CHANNEL_PREFIXTabGroup();
        BOOL v21 = 1;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long v25 = 67109378;
          int v26 = v10;
          __int16 v27 = 2112;
          id v28 = v24;
          _os_log_impl(&dword_21C043000, v20, OS_LOG_TYPE_INFO, "%i windows deleted using condition: %@", v25, 0x12u);
        }
        goto LABEL_23;
      }
      [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to delete windows" result:v19];
    }
    else
    {
      [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to delete windows" result:*(unsigned int *)&v30[16]];
    }
    BOOL v21 = 0;
LABEL_23:
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v29);

    goto LABEL_24;
  }
  [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to fetch windows" result:v34];
  BOOL v21 = 0;
LABEL_24:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);

  return v21;
}

- (BOOL)_performOSVersionUpgradesFromPreviousVersion:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WebBookmarkTabCollection;
  if (-[WebBookmarkCollection _performOSVersionUpgradesFromPreviousVersion:](&v7, sel__performOSVersionUpgradesFromPreviousVersion_, v4)&& ([@"16.0" compare:v4 options:64] != 1|| -[WebBookmarkTabCollection _removePlaceholderTabGroupRecordsOnUpgrade](self, "_removePlaceholderTabGroupRecordsOnUpgrade")))
  {
    [(WebBookmarkTabCollection *)self _createParticipantPresenceTable];
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_createParticipantPresenceTable
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"DROP TABLE IF EXISTS participant_presence"];
  [(WebBookmarkCollection *)self _executeSQL:@"CREATE TABLE participant_presence (id INTEGER PRIMARY KEY, participant_id TEXT, tab_group_server_id TEXT, tab_server_id TEXT, UNIQUE(participant_id))"];
}

- (BOOL)_performSafariVersionUpgradesFromPreviousVersion:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)WebBookmarkTabCollection;
  if (![(WebBookmarkCollection *)&v26 _performSafariVersionUpgradesFromPreviousVersion:v4])goto LABEL_54; {
  if ([@"614.1.25.0.1" compare:v4 options:64] == 1)
  }
  {
    BOOL v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v25 = 0;
      _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to fix local bookmarks in syncable folders", v25, 2u);
    }
    if (![(WebBookmarkTabCollection *)self _fixLocalBookmarksInSyncableFolders]) {
      goto LABEL_54;
    }
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v25 = 0;
      _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to regenerate sync positions", v25, 2u);
    }
    if (![(WebBookmarkTabCollection *)self _regenerateSyncPositionsIfNeeded]) {
      goto LABEL_54;
    }
  }
  if (objc_msgSend(@"614.1.25.0.9", "safari_isVersionStringGreaterThanVersionString:", v4))
  {
    objc_super v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v25 = 0;
      _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_DEFAULT, "Retrieving shared tab groups with missing CKShare records", v25, 2u);
    }
    if (![(WebBookmarkTabCollection *)self _saveTabGroupRecordsWithMissingCKShareRecord])
    {
      id v18 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkTabCollection _performSafariVersionUpgradesFromPreviousVersion:].cold.6();
      }
      goto LABEL_54;
    }
    id v8 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v25 = 0;
      _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_DEFAULT, "Did finish retrieving shared tab groups with missing CKShare records", v25, 2u);
    }
  }
  if (objc_msgSend(@"616.1.21", "safari_isVersionStringGreaterThanVersionString:", v4))
  {
    char v9 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v25 = 0;
      _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_DEFAULT, "Resetting all current user-owned shared Tab Group zone server change tokens", v25, 2u);
    }
    if (![(WebBookmarkTabCollection *)self _resetCurrentUserOwnedSharedTabGroupZoneServerChangeTokens])
    {
      uint64_t v19 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkTabCollection _performSafariVersionUpgradesFromPreviousVersion:].cold.5();
      }
      goto LABEL_54;
    }
    int v10 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v25 = 0;
      _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_DEFAULT, "Did reset all current user-owned shared Tab Group zone server change tokens", v25, 2u);
    }
  }
  if (objc_msgSend(@"614.2", "safari_isVersionStringGreaterThanVersionString:", v4))
  {
    uint64_t v11 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v25 = 0;
      _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_DEFAULT, "Finding any locally saved CKShare to enable presence", v25, 2u);
    }
    if (![(WebBookmarkTabCollection *)self updateContainsCKShareRecord])
    {
      long long v20 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkTabCollection _performSafariVersionUpgradesFromPreviousVersion:].cold.4();
      }
      goto LABEL_54;
    }
    sqlite3_int64 v12 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v25 = 0;
      _os_log_impl(&dword_21C043000, v12, OS_LOG_TYPE_DEFAULT, "Did finish looking for locally saved CKShare to enable presence", v25, 2u);
    }
  }
  if (objc_msgSend(@"616.1.17.10.3", "safari_isVersionStringGreaterThanVersionString:", v4))
  {
    id v13 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v25 = 0;
      _os_log_impl(&dword_21C043000, v13, OS_LOG_TYPE_DEFAULT, "Deleting extra personal profiles", v25, 2u);
    }
    if (![(WebBookmarkTabCollection *)self _deleteDuplicatePersonalProfilesWithInvalidUUID])
    {
      BOOL v21 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkTabCollection _performSafariVersionUpgradesFromPreviousVersion:]();
      }
      goto LABEL_54;
    }
    long long v14 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v25 = 0;
      _os_log_impl(&dword_21C043000, v14, OS_LOG_TYPE_DEFAULT, "Finished cleaning up personal profiles", v25, 2u);
    }
  }
  if (objc_msgSend(@"618.1.13", "safari_isVersionStringGreaterThanVersionString:", v4))
  {
    if (![(WebBookmarkTabCollection *)self _deleteDefaultProfileIfSavedAsTabGroup])
    {
      v22 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkTabCollection _performSafariVersionUpgradesFromPreviousVersion:]();
      }
      goto LABEL_54;
    }
    long long v15 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v25 = 0;
      _os_log_impl(&dword_21C043000, v15, OS_LOG_TYPE_DEFAULT, "Deleted personal profile which was mistakenly saved as a Tab Group.", v25, 2u);
    }
  }
  if (objc_msgSend(@"618.2.3", "safari_isVersionStringGreaterThanVersionString:", v4))
  {
    if ([(WebBookmarkTabCollection *)self _removeClosedLocallyCreatedUnnamedTabGroups])
    {
      long long v16 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v25 = 0;
        _os_log_impl(&dword_21C043000, v16, OS_LOG_TYPE_DEFAULT, "Removed unnamed tab groups from windows that were already closed", v25, 2u);
      }
      goto LABEL_41;
    }
    id v23 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkTabCollection _performSafariVersionUpgradesFromPreviousVersion:]();
    }
LABEL_54:
    BOOL v17 = 0;
    goto LABEL_55;
  }
LABEL_41:
  BOOL v17 = 1;
LABEL_55:

  return v17;
}

- (BOOL)_performSafariVersionUpgradesOutsideSafariProcessFromPreviousVersion:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WebBookmarkTabCollection;
  if (![(WebBookmarkCollection *)&v10 _performSafariVersionUpgradesOutsideSafariProcessFromPreviousVersion:v4])goto LABEL_9; {
  if (objc_msgSend(@"618.1.16", "safari_isVersionStringGreaterThanVersionString:", v4))
  }
  {
    if ([(WebBookmarkTabCollection *)self _reEncodeSessionStateDataIfNeeded])
    {
      BOOL v5 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v9 = 0;
        _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_DEFAULT, "Re-encoded session state data to truncate large HTTP bodies.", v9, 2u);
      }
      goto LABEL_6;
    }
    objc_super v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkTabCollection _performSafariVersionUpgradesOutsideSafariProcessFromPreviousVersion:]();
    }
LABEL_9:
    BOOL v6 = 0;
    goto LABEL_10;
  }
LABEL_6:
  BOOL v6 = 1;
LABEL_10:

  return v6;
}

- (BOOL)_deleteDuplicatePersonalProfilesWithInvalidUUID
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v12, [(WebBookmarkCollection *)self _selectBookmarksWhere:@"server_id = 'DefaultProfile'"]);
  uint64_t v3 = *MEMORY[0x263F66420];
  while (1)
  {
    int v4 = sqlite3_step(v13);
    if (v4 != 100) {
      break;
    }
    BOOL v5 = [WebBookmark alloc];
    BOOL v6 = v13;
    objc_super v7 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    id v8 = [(WebBookmark *)v5 initWithSQLiteStatement:v6 deviceIdentifier:v7 collectionType:1];

    char v9 = [(WebBookmark *)v8 UUID];
    LOBYTE(v6) = [v9 isEqualToString:v3];

    if ((v6 & 1) == 0
      && ![(WebBookmarkCollection *)self deleteBookmark:v8 leaveTombstone:0])
    {
      objc_super v10 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        [(WebBookmark *)v8 UUID];
        objc_claimAutoreleasedReturnValue();
        -[WebBookmarkTabCollection _deleteDuplicatePersonalProfilesWithInvalidUUID]();
      }

      break;
    }
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);
  return v4 != 100;
}

- (BOOL)_deleteDefaultProfileIfSavedAsTabGroup
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v10, [(WebBookmarkCollection *)self _selectBookmarksWhere:@"server_id = 'DefaultProfile' AND parent = 0 AND syncable = 1 AND type = 1 AND subtype = 0"]);
  while (1)
  {
    int v3 = sqlite3_step(v11);
    if (v3 != 100) {
      break;
    }
    int v4 = [WebBookmark alloc];
    BOOL v5 = v11;
    BOOL v6 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    objc_super v7 = [(WebBookmark *)v4 initWithSQLiteStatement:v5 deviceIdentifier:v6 collectionType:1];

    if (![(WebBookmarkCollection *)self deleteBookmark:v7 leaveTombstone:0])
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkTabCollection _deleteDefaultProfileIfSavedAsTabGroup]();
      }

      break;
    }
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
  return v3 != 100;
}

- (BOOL)_removeClosedLocallyCreatedUnnamedTabGroups
{
  int v3 = [(WebBookmarkTabCollection *)self _allUnnamedTabGroupUUIDsFromCurrentWindowStates];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v11, [(WebBookmarkCollection *)self _selectBookmarksWhere:@"type = 1 AND subtype = 0 AND parent in (SELECT id FROM bookmarks WHERE type = 1 AND subtype = 3)"]);
  while (1)
  {
    int v4 = sqlite3_step(v12);
    if (v4 != 100) {
      break;
    }
    BOOL v5 = [WebBookmark alloc];
    BOOL v6 = v12;
    objc_super v7 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    id v8 = [(WebBookmark *)v5 initWithSQLiteStatement:v6 deviceIdentifier:v7 collectionType:1];

    char v9 = [(WebBookmark *)v8 UUID];
    LOBYTE(v6) = [v3 containsObject:v9];

    if ((v6 & 1) == 0
      && [(WebBookmark *)v8 identifier]
      && ![(WebBookmarkCollection *)self deleteBookmark:v8 leaveTombstone:1])
    {

      break;
    }
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);

  return v4 != 100;
}

- (id)_allUnnamedTabGroupUUIDsFromCurrentWindowStates
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263EFFA08] set];
  [(WebBookmarkTabCollection *)self windowStates];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      id v8 = v3;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        char v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "unnamedTabGroupUUIDs", (void)v11);
        int v3 = [v8 setByAddingObjectsFromSet:v9];

        ++v7;
        id v8 = v3;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v3;
}

- (BOOL)_reEncodeSessionStateDataIfNeeded
{
  int v3 = objc_msgSend(NSString, "stringWithFormat:", @"type = 0 AND subtype = 0 AND LENGTH(local_attributes) > %d", 3145728);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v12, [(WebBookmarkCollection *)self _selectBookmarksWhere:v3]);

  while (sqlite3_step(v13) == 100)
  {
    id v4 = [WebBookmark alloc];
    uint64_t v5 = v13;
    uint64_t v6 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    uint64_t v7 = [(WebBookmark *)v4 initWithSQLiteStatement:v5 deviceIdentifier:v6 collectionType:1];

    id v8 = [(WBTab *)[WBMutableTab alloc] initWithBookmark:v7];
    char v9 = [(WBTab *)v8 localAttributes];
    [v9 setSessionStateData:0];
    [(WBMutableTab *)v8 setLocalAttributes:v9];
    objc_super v10 = [(WBTab *)v8 bookmark];
    [(WebBookmarkCollection *)self _saveBookmark:v10 withSpecialID:0 updateGenerationIfNeeded:1];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);
  return 1;
}

- (BOOL)_fixLocalBookmarksInSyncableFolders
{
  if (![(WebBookmarkTabCollection *)self maintainsSyncMetadata]) {
    return 1;
  }
  int v3 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_DEFAULT, "Fixing local bookmarks in syncable folders.", buf, 2u);
  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)buf, [(WebBookmarkCollection *)self _selectBookmarksWhere:@"syncable = 0 AND parent IN (SELECT id FROM bookmarks WHERE parent = 0 AND syncable = 1 AND type = 1 AND subtype = 0 AND hidden = 0 AND special_id = 0)"]);
  while (1)
  {
    int v4 = sqlite3_step(v26);
    BOOL v5 = v4 != 100;
    if (v4 != 100) {
      break;
    }
    uint64_t v6 = [WebBookmark alloc];
    uint64_t v7 = v26;
    id v8 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    char v9 = [(WebBookmark *)v6 initWithSQLiteStatement:v7 deviceIdentifier:v8 collectionType:1];

    objc_super v10 = [WebBookmark alloc];
    long long v11 = [(WebBookmark *)v9 title];
    long long v12 = [(WebBookmark *)v9 address];
    uint64_t v13 = [(WebBookmark *)v9 parentID];
    uint64_t v14 = [(WebBookmark *)v9 subtype];
    long long v15 = [(WebBookmark *)v9 deviceIdentifier];
    uint64_t v16 = [(WebBookmark *)v10 initWithTitle:v11 address:v12 parentID:v13 subtype:v14 deviceIdentifier:v15 collectionType:1];

    BOOL v17 = [(WebBookmark *)v9 localAttributes];
    [(WebBookmark *)v16 setLocalAttributes:v17];

    id v18 = [(WebBookmark *)v9 extraAttributes];
    [(WebBookmark *)v16 setExtraAttributes:v18];

    if (![(WebBookmarkCollection *)self _saveAndMoveBookmark:v16 toFolderID:[(WebBookmark *)v9 parentID] orderIndex:[(WebBookmark *)v9 orderIndex]])
    {
      BOOL v21 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkTabCollection _fixLocalBookmarksInSyncableFolders]();
      }
      goto LABEL_17;
    }
    if (![(WebBookmarkCollection *)self deleteBookmark:v9 leaveTombstone:0])
    {
      v22 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkTabCollection _fixLocalBookmarksInSyncableFolders]();
      }
LABEL_17:

      goto LABEL_18;
    }
  }
  uint64_t v19 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_21C043000, v19, OS_LOG_TYPE_DEFAULT, "Successfully fixed local bookmarks in syncable folders.", v24, 2u);
  }
LABEL_18:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
  return v5;
}

- (BOOL)_regenerateSyncPositionsIfNeeded
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  if (![(WebBookmarkTabCollection *)self maintainsSyncMetadata]) {
    return 1;
  }
  int v3 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_DEFAULT, "Will begin regenerating sync positions", buf, 2u);
  }
  v37 = -[WebBookmarkListQuery initWithBookmarksWhere:folderID:orderBy:usingFilter:]([WebBookmarkListQuery alloc], "initWithBookmarksWhere:folderID:orderBy:usingFilter:", @"parent = 0 AND syncable = 1 AND type = 1 AND subtype = 0 AND hidden = 0 AND special_id = 0");
  char v36 = [[WebBookmarkList alloc] initWithQuery:v37 skipOffset:0 collection:self];
  int v4 = [(WebBookmarkList *)v36 bookmarkArray];
  unsigned int v39 = objc_msgSend(v4, "safari_splitArrayUsingCondition:", &__block_literal_global_167);

  BOOL v5 = [v39 first];
  char v38 = [v5 sortedArrayUsingComparator:&__block_literal_global_170];

  uint64_t v6 = [v38 lastObject];
  uint64_t v7 = [v6 syncPosition];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v8 = [v39 second];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v9)
  {
    uint64_t v40 = *(void *)v47;
    while (2)
    {
      uint64_t v10 = 0;
      long long v11 = v7;
      do
      {
        if (*(void *)v47 != v40) {
          objc_enumerationMutation(v8);
        }
        long long v12 = *(void **)(*((void *)&v46 + 1) + 8 * v10);
        uint64_t v13 = objc_msgSend((id)objc_opt_class(), "deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:", -[WBCollectionConfiguration collectionType](self->super._configuration, "collectionType"), 1);
        uint64_t v14 = [v13 UUID];
        long long v15 = [v14 UUIDString];

        uint64_t v16 = objc_msgSend(MEMORY[0x263F66618], "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", v11, 0, v15, -[WebBookmarkCollection nextDatabaseSyncChangeID](self, "nextDatabaseSyncChangeID"));
        [v12 setSyncPosition:v16];

        uint64_t v7 = [v12 syncPosition];

        BOOL v17 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v18 = [v12 privacyPreservingDescription];
          uint64_t v19 = [v12 syncPosition];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v18;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v19;
          _os_log_impl(&dword_21C043000, v17, OS_LOG_TYPE_INFO, "Setting position of tab group %{public}@ to position: %{public}@", buf, 0x16u);
        }
        if (![(WebBookmarkCollection *)self updateBookmarkSyncPositionIfNeeded:v12]|| ![(WebBookmarkCollection *)self _incrementGeneration])
        {
          char v33 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            [v12 privacyPreservingDescription];
            objc_claimAutoreleasedReturnValue();
            -[WebBookmarkTabCollection _regenerateSyncPositionsIfNeeded]();
          }

          goto LABEL_32;
        }

        ++v10;
        long long v11 = v7;
      }
      while (v9 != v10);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  long long v20 = [v39 second];
  BOOL v21 = [v38 arrayByAddingObjectsFromArray:v20];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = v21;
  uint64_t v22 = [v8 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v8);
        }
        long long v25 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        objc_super v26 = [v25 serverID];
        BOOL v27 = v26 == 0;

        if (v27) {
          [(WebBookmarkTabCollection *)self _generateServerIdIfNeededForTabGroupBookmark:v25];
        }
      }
      uint64_t v22 = [v8 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v22);
  }

  id v28 = [v8 valueForKey:@"serverID"];
  BOOL v29 = [(WebBookmarkCollection *)self _orderChildrenWithServerIDs:v28 inFolderWithServerID:0 excludeDeletedBookmarks:1];

  if (v29)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v53 = 1;
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __60__WebBookmarkTabCollection__regenerateSyncPositionsIfNeeded__block_invoke_175;
    v41[3] = &unk_2643DA140;
    v41[4] = self;
    v41[5] = buf;
    [(WebBookmarkCollection *)self enumerateDescendantsOfBookmarkID:0 usingBlock:v41];
    int v30 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
      *(_DWORD *)v50 = 67109120;
      int v51 = v31;
      _os_log_impl(&dword_21C043000, v30, OS_LOG_TYPE_DEFAULT, "Did finish regenerating sync positions, success: %d", v50, 8u);
    }
    BOOL v32 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v35 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkTabCollection _regenerateSyncPositionsIfNeeded]();
    }
LABEL_32:
    BOOL v32 = 0;
  }

  return v32;
}

BOOL __60__WebBookmarkTabCollection__regenerateSyncPositionsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 syncPosition];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __60__WebBookmarkTabCollection__regenerateSyncPositionsIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 syncPosition];
  uint64_t v6 = [v4 syncPosition];
  uint64_t v7 = [v5 compare:v6];

  return v7;
}

void __60__WebBookmarkTabCollection__regenerateSyncPositionsIfNeeded__block_invoke_175(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if ([v5 isSyncable])
  {
    uint64_t v6 = [v5 syncPosition];

    if (!v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) generateSyncPositionForBookmark:v5];
      [v5 setSyncPosition:v7];

      id v8 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = [v5 privacyPreservingDescription];
        uint64_t v10 = [v5 syncPosition];
        int v12 = 138543618;
        uint64_t v13 = v9;
        __int16 v14 = 2114;
        long long v15 = v10;
        _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Setting position of record %{public}@ to position: %{public}@", (uint8_t *)&v12, 0x16u);
      }
      if (![*(id *)(a1 + 32) updateBookmarkSyncPositionIfNeeded:v5]
        || ([*(id *)(a1 + 32) _incrementGeneration] & 1) == 0)
      {
        long long v11 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          [v5 privacyPreservingDescription];
          objc_claimAutoreleasedReturnValue();
          __60__WebBookmarkTabCollection__regenerateSyncPositionsIfNeeded__block_invoke_175_cold_1();
        }

        *a3 = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }
    }
  }
}

- (BOOL)_saveTabGroupRecordsWithMissingCKShareRecord
{
  BOOL v3 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_DEFAULT, "Collecting tab groups that might be shared and missing a CKShare", buf, 2u);
  }
  id v4 = [[WebBookmarkListQuery alloc] initWithBookmarksWhere:@"parent = 0 AND syncable = 1 AND type = 1 AND subtype = 0 AND hidden = 0 AND special_id = 0" folderID:0 orderBy:@"order_index ASC" usingFilter:0];
  id v5 = [[WebBookmarkList alloc] initWithQuery:v4 skipOffset:0 collection:self];
  uint64_t v6 = [(WebBookmarkList *)v5 bookmarkArray];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__WebBookmarkTabCollection__saveTabGroupRecordsWithMissingCKShareRecord__block_invoke;
  v12[3] = &unk_2643DA168;
  void v12[4] = self;
  uint64_t v7 = objc_msgSend(v6, "safari_mapAndFilterObjectsUsingBlock:", v12);

  if ([v7 count])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __72__WebBookmarkTabCollection__saveTabGroupRecordsWithMissingCKShareRecord__block_invoke_179;
    v10[3] = &unk_2643DA190;
    id v11 = v7;
    BOOL v8 = [(WebBookmarkCollection *)self updateDatabaseSyncDataUsingBlock:v10];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

id __72__WebBookmarkTabCollection__saveTabGroupRecordsWithMissingCKShareRecord__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) syncDataForBookmark:v3];
  id v5 = [v4 record];
  uint64_t v6 = [v5 recordID];

  uint64_t v7 = [v6 zoneID];
  if (!v6) {
    goto LABEL_5;
  }
  BOOL v8 = [*(id *)(a1 + 32) _primaryRecordZoneID];
  if ([v7 isEqual:v8])
  {

LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = [v4 shareRecord];

  if (v9) {
    goto LABEL_5;
  }
  int v12 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v6 ckShortDescription];
    int v15 = 138543362;
    uint64_t v16 = v13;
    _os_log_impl(&dword_21C043000, v12, OS_LOG_TYPE_DEFAULT, "TabGroup with recordID %{public}@ is potentially missing its CKShare record", (uint8_t *)&v15, 0xCu);
  }
  id v14 = objc_alloc(MEMORY[0x263EFD7E8]);
  uint64_t v10 = (void *)[v14 initWithRecordName:*MEMORY[0x263EFD500] zoneID:v7];
LABEL_6:

  return v10;
}

id __72__WebBookmarkTabCollection__saveTabGroupRecordsWithMissingCKShareRecord__block_invoke_179(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 recordIDsToRefresh];
  id v5 = (void *)[v4 mutableCopy];

  [v5 addObjectsFromArray:*(void *)(a1 + 32)];
  [v3 setRecordIDsToRefresh:v5];

  return v3;
}

- (BOOL)_resetCurrentUserOwnedSharedTabGroupZoneServerChangeTokens
{
  return [(WebBookmarkCollection *)self updateDatabaseSyncDataUsingBlock:&__block_literal_global_182];
}

id __86__WebBookmarkTabCollection__resetCurrentUserOwnedSharedTabGroupZoneServerChangeTokens__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [v2 recordZoneIDsToLastServerChangeTokens];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    char v6 = 0;
    uint64_t v7 = *(void *)v16;
    *(void *)&long long v5 = 138543362;
    long long v14 = v5;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "safari_isInPrivateDatabase", v14)
          && (objc_msgSend(v9, "safari_isTabGroupSecondaryRecordZoneID") & 1) != 0)
        {
          uint64_t v10 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            id v11 = [v9 ckShortDescription];
            *(_DWORD *)buf = v14;
            long long v20 = v11;
            _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_DEFAULT, "Resetting last server change token for zone %{public}@", buf, 0xCu);
          }
          [v2 setLastServerChangeToken:0 forRecordZoneID:v9];
          char v6 = 1;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v4);

    if (v6)
    {
      int v12 = 0;
      [v2 setLastPrivateDatabaseServerChangeToken:0];
      goto LABEL_17;
    }
  }
  else
  {
  }
  int v12 = v2;
  id v2 = 0;
LABEL_17:

  return v2;
}

- (BOOL)containsCKShareRecord
{
  id v2 = [(WebBookmarkCollection *)self syncStringForKey:@"DatabaseContainsShareRecord"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setContainsCKShareRecord:(BOOL)a3
{
  if (a3) {
    char v3 = @"1";
  }
  else {
    char v3 = @"0";
  }
  [(WebBookmarkCollection *)self syncSetString:v3 forKey:@"DatabaseContainsShareRecord"];
}

- (BOOL)updateContainsCKShareRecord
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__WebBookmarkTabCollection_updateContainsCKShareRecord__block_invoke;
  v3[3] = &unk_2643DA0F8;
  v3[4] = self;
  return [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:v3 secureDelete:0];
}

uint64_t __55__WebBookmarkTabCollection_updateContainsCKShareRecord__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [[WebBookmarkListQuery alloc] initWithBookmarksWhere:@"parent = 0 AND syncable = 1 AND type = 1 AND subtype = 0 AND hidden = 0 AND special_id = 0" folderID:0 orderBy:@"order_index ASC" usingFilter:0];
  char v3 = [[WebBookmarkList alloc] initWithQuery:v2 skipOffset:0 collection:*(void *)(a1 + 32)];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = [(WebBookmarkList *)v3 bookmarkArray];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) hasShareRecord])
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [*(id *)(a1 + 32) setContainsCKShareRecord:v5];
  return 1;
}

- (BOOL)_clearAllSyncData
{
  v5.receiver = self;
  v5.super_class = (Class)WebBookmarkTabCollection;
  BOOL v3 = [(WebBookmarkCollection *)&v5 _clearAllSyncData];
  if (v3)
  {
    [(WebBookmarkCollection *)self syncSetString:0 forKey:@"DatabaseContainsShareRecord"];
    [(WebBookmarkTabCollection *)self _resetSettingsSyncData];
  }
  return v3;
}

- (BOOL)_clearAllSyncKeys
{
  return 1;
}

- (BOOL)_shouldGenerateNewServerIDWhenClearingSyncDataForBookmark:(id)a3
{
  return [a3 subtype] != 2;
}

- (id)tabGroupForBookmark:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 extraAttributes];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"IsUnnamed"];
  int v7 = [v6 BOOLValue];

  if (v7) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 2;
  }
  long long v9 = [(WebBookmarkTabCollection *)self _tabGroupForBookmark:v4 kind:v8];

  return v9;
}

- (id)_uuidForQueries:(id)a3
{
  BOOL v3 = [NSString stringWithFormat:@"'%@'", a3];
  return v3;
}

- (void)_logErrorWithMessage:(id)a3 result:(int)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [(WebBookmarkCollection *)self _errorForMostRecentSQLiteError];
  uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    long long v9 = objc_msgSend(v7, "safari_privacyPreservingDescription");
    int v10 = 138412802;
    id v11 = v6;
    __int16 v12 = 1024;
    int v13 = a4;
    __int16 v14 = 2114;
    long long v15 = v9;
    _os_log_error_impl(&dword_21C043000, v8, OS_LOG_TYPE_ERROR, "%@ with result: %d error: %{public}@", (uint8_t *)&v10, 0x1Cu);
  }
}

id __57__WebBookmarkTabCollection_tabGroupsChildrenForBookmark___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) tabGroupForBookmark:a2];
  return v2;
}

- (id)devicesForProfile:(id)a3
{
  id v4 = a3;
  objc_super v5 = -[WebBookmarkListQuery initWithFolderID:inCollection:usingFilter:options:]([WebBookmarkListQuery alloc], "initWithFolderID:inCollection:usingFilter:options:", [v4 databaseIdentifier], self, 0, 36);
  id v6 = [[WebBookmarkList alloc] initWithQuery:v5 skipOffset:0 collection:self];
  int v7 = [(WebBookmarkList *)v6 bookmarkArray];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__WebBookmarkTabCollection_devicesForProfile___block_invoke;
  v13[3] = &unk_2643DA248;
  v13[4] = self;
  id v8 = v4;
  id v14 = v8;
  long long v9 = objc_msgSend(v7, "safari_mapObjectsUsingBlock:", v13);
  int v10 = v9;
  if (!v9) {
    long long v9 = (void *)MEMORY[0x263EFFA68];
  }
  id v11 = v9;

  return v11;
}

id __46__WebBookmarkTabCollection_devicesForProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  objc_super v5 = [*(id *)(a1 + 40) identifier];
  id v6 = [v4 deviceForBookmark:v3 inProfileWithIdentifier:v5];

  return v6;
}

- (id)remoteDevicesForProfileBookmark:(id)a3
{
  id v4 = a3;
  objc_super v5 = -[WebBookmarkListQuery initWithFolderID:inCollection:usingFilter:options:]([WebBookmarkListQuery alloc], "initWithFolderID:inCollection:usingFilter:options:", [v4 identifier], self, 0, 68);
  id v6 = [[WebBookmarkList alloc] initWithQuery:v5 skipOffset:0 collection:self];
  int v7 = [(WebBookmarkList *)v6 bookmarkArray];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__WebBookmarkTabCollection_remoteDevicesForProfileBookmark___block_invoke;
  v13[3] = &unk_2643DA248;
  v13[4] = self;
  id v8 = v4;
  id v14 = v8;
  long long v9 = objc_msgSend(v7, "safari_mapObjectsUsingBlock:", v13);
  int v10 = v9;
  if (!v9) {
    long long v9 = (void *)MEMORY[0x263EFFA68];
  }
  id v11 = v9;

  return v11;
}

id __60__WebBookmarkTabCollection_remoteDevicesForProfileBookmark___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  objc_super v5 = [*(id *)(a1 + 40) UUID];
  id v6 = [v4 deviceForBookmark:v3 inProfileWithIdentifier:v5];

  return v6;
}

- (id)deviceForBookmark:(id)a3 inProfileWithIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    [(WebBookmarkTabCollection *)self tabGroupsChildrenForBookmark:v6];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          __int16 v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_msgSend(v12, "setKind:", 3, (void)v16);
          int v13 = [v6 UUID];
          [v12 setDeviceUUIDString:v13];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    id v14 = [[WBDevice alloc] initWithBookmark:v6 unnamedTabGroups:v8 profileIdentifier:v7];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)settingChangeWithName:(id)a3 parentID:(int)a4
{
  objc_super v5 = [NSString stringWithFormat:@"settings.key = '%@' AND settings.parent = %d", a3, *(void *)&a4];
  id v6 = [(WebBookmarkTabCollection *)self allSettingsChangesWithWhereClause:v5];
  id v7 = [v6 firstObject];

  return v7;
}

- (id)allSettingsChangesForParentWithID:(int)a3
{
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"(settings.modified = 1 OR settings.deleted = 1) AND settings.parent = %d", *(void *)&a3);
  objc_super v5 = [(WebBookmarkTabCollection *)self allSettingsChangesWithWhereClause:v4];

  return v5;
}

- (id)settingsChangesForAllDeletedSettings
{
  id v22 = [MEMORY[0x263EFF980] array];
  uint64_t v21 = self;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v25, self->super._db, (const char *)objc_msgSend(@"SELECT settings.id, settings.key, settings.value, settings.generation, settings.device_identifier, settings.sync_data, settings.deleted, settings.server_id FROM settings WHERE deleted = 1", "UTF8String"));
  while (sqlite3_step(v26) == 100)
  {
    id v3 = v26;
    sqlite3_int64 v4 = sqlite3_column_int64(v26, 0);
    uint64_t v23 = WBUTF8StringFromSQLStatement(v3, 1);
    objc_super v5 = WBObjectFromColumn(v3, 2);
    sqlite3_int64 v6 = sqlite3_column_int64(v3, 3);
    id v7 = WBUTF8StringFromSQLStatement(v3, 4);
    id v8 = WBDataFromNullableColumn(v3, 5);
    sqlite3_int64 v9 = sqlite3_column_int64(v3, 6);
    uint64_t v10 = WBUTF8StringFromSQLStatement(v3, 7);
    if (!v10)
    {
      id v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_DEFAULT, "Retrieving deleted profile setting change with no server ID.", buf, 2u);
      }
    }
    __int16 v12 = (void *)[objc_alloc(MEMORY[0x263F66610]) initWithDeviceIdentifier:v7 generation:v6];
    id v13 = objc_alloc(MEMORY[0x263F66608]);
    id v14 = [(WebBookmarkCollection *)v21 currentDeviceIdentifier];
    long long v15 = (void *)[v13 initWithValue:v5 generation:v12 deviceIdentifier:v14];

    if (v9) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 1;
    }
    long long v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFD7C8]), "safari_initWithEncodedRecordData:", v8);
    long long v18 = [MEMORY[0x263EFF9A0] dictionary];
    [v18 setObject:v23 forKeyedSubscript:@"SettingName"];
    [v18 setObject:v5 forKeyedSubscript:@"Value"];
    [v18 setObject:v10 forKeyedSubscript:@"SettingServerID"];
    long long v19 = [[WBFieldChangeRecord alloc] initWithField:v15 changeType:v16 attributes:v18 record:v17 identifier:v4];
    [v22 addObject:v19];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v25);
  return v22;
}

- (id)allSettingsChangesWithWhereClause:(id)a3
{
  id v3 = a3;
  id v27 = [MEMORY[0x263EFF980] array];
  sqlite3_int64 v4 = [NSString stringWithFormat:@"SELECT settings.id, settings.key, settings.value, settings.generation, settings.device_identifier, settings.sync_data, settings.deleted, settings.server_id, bookmarks.server_id FROM settings INNER JOIN bookmarks ON settings.parent = bookmarks.id WHERE %@", v3];
  db = self->super._db;
  id v25 = v4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v32, db, (const char *)[v25 UTF8String]);
  id v26 = v3;
  while (sqlite3_step(v33) == 100)
  {
    sqlite3_int64 v6 = v33;
    sqlite3_int64 v7 = sqlite3_column_int64(v33, 0);
    BOOL v29 = WBUTF8StringFromSQLStatement(v6, 1);
    id v8 = WBObjectFromColumn(v6, 2);
    sqlite3_int64 v9 = sqlite3_column_int64(v6, 3);
    int v30 = WBUTF8StringFromSQLStatement(v6, 4);
    uint64_t v10 = WBDataFromNullableColumn(v6, 5);
    sqlite3_int64 v11 = sqlite3_column_int64(v6, 6);
    __int16 v12 = WBUTF8StringFromSQLStatement(v6, 7);
    if (!v12)
    {
      id v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C043000, v13, OS_LOG_TYPE_DEFAULT, "Retrieving profile setting change with no server ID.", buf, 2u);
      }
    }
    id v14 = WBUTF8StringFromSQLStatement(v6, 8);
    if (!v14)
    {
      long long v15 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C043000, v15, OS_LOG_TYPE_DEFAULT, "Retrieving profile setting change with no parent server ID.", buf, 2u);
      }
    }
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F66610]) initWithDeviceIdentifier:v30 generation:v9];
    id v17 = objc_alloc(MEMORY[0x263F66608]);
    long long v18 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    long long v19 = (void *)[v17 initWithValue:v8 generation:v16 deviceIdentifier:v18];

    if (v11) {
      uint64_t v20 = 2;
    }
    else {
      uint64_t v20 = 1;
    }
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x263EFD7C8]), "safari_initWithEncodedRecordData:", v10);
    id v22 = [MEMORY[0x263EFF9A0] dictionary];
    [v22 setObject:v29 forKeyedSubscript:@"SettingName"];
    [v22 setObject:v8 forKeyedSubscript:@"Value"];
    [v22 setObject:v14 forKeyedSubscript:@"Parent"];
    [v22 setObject:v12 forKeyedSubscript:@"SettingServerID"];
    uint64_t v23 = [[WBFieldChangeRecord alloc] initWithField:v19 changeType:v20 attributes:v22 record:v21 identifier:v7];
    [v27 addObject:v23];

    id v3 = v26;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v32);

  return v27;
}

- (BOOL)saveSettings:(id)a3 inParentWithID:(int)a4 parentServerID:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v47 = a5;
  long long v48 = v7;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v8 = [v7 allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v9)
  {
    uint64_t v41 = v6;
    obuint64_t j = v8;
    sqlite3_int64 v44 = (int)v6;
    uint64_t v45 = *(void *)v54;
    while (2)
    {
      uint64_t v43 = v9;
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v54 != v45) {
          objc_enumerationMutation(obj);
        }
        sqlite3_int64 v11 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        __int16 v12 = [v48 objectForKeyedSubscript:v11];
        id v13 = [v12 value];
        id v14 = [v12 generation];
        sqlite3_int64 v15 = [v14 generation];

        uint64_t v16 = [v12 deviceIdentifier];
        id v17 = [NSString stringWithFormat:@"%@_%@_%@", @"Setting", v11, v47];
        WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v49, self->super._db, (const char *)objc_msgSend(@"INSERT INTO settings (key, value, generation, device_identifier, parent, modified, deleted, server_id) VALUES (@key, @value, @generation, @device_identifier, @parent, 1, 0, @server_id) ON CONFLICT (key, parent) DO UPDATE SET key = excluded.key, deleted = excluded.deleted, value = (CASE WHEN (@generation < generation) OR (@generation = generation AND @device_identifier < device_identifier) THEN excluded.value ELSE @value END), generation = (CASE WHEN (@generation < generation) OR (@generation = generation AND @device_identifier < device_identifier) THEN excluded.generation ELSE @generation END), device_identifier = (CASE WHEN (@generation < generation) OR (@generation = generation AND @device_identifier < device_identifier) THEN excluded.device_identifier ELSE @device_identifier END), modified = (CASE WHEN (@generation < generation) OR (@generation = generation AND @device_identifier < device_identifier) THEN excluded.modified ELSE 1 END)", "UTF8String"));
        if (!v51)
        {
          unsigned int v39 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to save profile settings for profile parent %d", v41);
          [(WebBookmarkTabCollection *)self _logErrorWithMessage:v39 result:v52];

LABEL_20:
          WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v49);

          BOOL v38 = 0;
          id v8 = obj;
          goto LABEL_21;
        }
        long long v18 = v50;
        int v19 = sqlite3_bind_parameter_index(v50, "@key");
        sqlite3_bind_text(v18, v19, (const char *)[v11 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = v50;
          int v21 = sqlite3_bind_parameter_index(v50, "@value");
          sqlite3_bind_int64(v20, v21, [v13 integerValue]);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v22 = v50;
            int v23 = sqlite3_bind_parameter_index(v50, "@value");
            sqlite3_bind_text(v22, v23, (const char *)[v13 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_20;
            }
            uint64_t v24 = v50;
            int v25 = sqlite3_bind_parameter_index(v50, "@value");
            id v26 = v13;
            sqlite3_bind_blob(v24, v25, (const void *)[v26 bytes], objc_msgSend(v26, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          }
        }
        id v27 = v50;
        int v28 = sqlite3_bind_parameter_index(v50, "@generation");
        sqlite3_bind_int64(v27, v28, v15);
        BOOL v29 = v50;
        int v30 = sqlite3_bind_parameter_index(v50, "@device_identifier");
        id v31 = v16;
        sqlite3_bind_text(v29, v30, (const char *)[v31 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        BOOL v32 = v50;
        int v33 = sqlite3_bind_parameter_index(v50, "@parent");
        sqlite3_bind_int64(v32, v33, v44);
        unsigned int v34 = v50;
        int v35 = sqlite3_bind_parameter_index(v50, "@server_id");
        id v36 = v17;
        sqlite3_bind_text(v34, v35, (const char *)[v36 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        uint64_t v37 = sqlite3_step(v50);
        if (v37 != 101)
        {
          [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to save settings" result:v37];
          goto LABEL_20;
        }
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v49);
      }
      id v8 = obj;
      uint64_t v9 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
      BOOL v38 = 1;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v38 = 1;
  }
LABEL_21:

  return v38;
}

- (BOOL)resetModifiedStateForSetting:(id)a3 withRecord:(id)a4 value:(id)a5 forBookmarkWithID:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = [NSString stringWithFormat:@"UPDATE settings SET sync_data = ?, modified = (CASE WHEN value = ? THEN 0 ELSE 1 END) WHERE key = '%@' AND parent = %d", a3, v6];
  db = self->super._db;
  id v14 = v12;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v23, db, (const char *)[v14 UTF8String]);
  if (!v25)
  {
    id v17 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to update profile settings for profile ID %d", v6);
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:v17 result:v26];

    goto LABEL_12;
  }
  sqlite3_int64 v15 = v24;
  uint64_t v16 = objc_msgSend(v10, "safari_encodedSystemFieldsData");
  bindNullableDataToSQLStatement(v15, 1, v16);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sqlite3_bind_int64(v24, 2, [v11 integerValue]);
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sqlite3_bind_text(v24, 2, (const char *)[v11 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_12:
    BOOL v21 = 0;
    goto LABEL_13;
  }
  long long v18 = v24;
  id v19 = v11;
  sqlite3_bind_blob(v18, 2, (const void *)[v19 bytes], objc_msgSend(v19, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
LABEL_9:
  uint64_t v20 = sqlite3_step(v24);
  if (v20 != 101)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to update settings" result:v20];
    goto LABEL_12;
  }
  BOOL v21 = 1;
LABEL_13:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v23);

  return v21;
}

- (BOOL)deleteSettingsRecordWithServerID:(id)a3
{
  sqlite3_int64 v4 = [NSString stringWithFormat:@"DELETE FROM settings WHERE server_id = '%@'", a3];
  db = self->super._db;
  id v6 = v4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, db, (const char *)[v6 UTF8String]);
  if (!v13)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Failed to delete profile settings"];
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:v9 result:v14];

LABEL_6:
    BOOL v8 = 0;
    goto LABEL_7;
  }
  uint64_t v7 = sqlite3_step(v12);
  if (v7 != 101)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to delete settings" result:v7];
    goto LABEL_6;
  }
  BOOL v8 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);

  return v8;
}

- (BOOL)deleteSettingWithIdentifier:(int64_t)a3
{
  objc_super v5 = objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM settings WHERE id = %zu", a3);
  db = self->super._db;
  id v7 = v5;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12, db, (const char *)[v7 UTF8String]);
  if (!v14)
  {
    id v10 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to delete settings for id %zu", a3);
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:v10 result:v15];

LABEL_6:
    BOOL v9 = 0;
    goto LABEL_7;
  }
  uint64_t v8 = sqlite3_step(v13);
  if (v8 != 101)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to delete settings" result:v8];
    goto LABEL_6;
  }
  BOOL v9 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);

  return v9;
}

- (BOOL)_resetSettingsSyncData
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6, self->super._db, (const char *)objc_msgSend(@"UPDATE settings SET sync_data = null, modified = (CASE WHEN deleted = 1 THEN settings.modified ELSE 1 END)", "UTF8String"));
  if (!v8)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to clear sync data" result:v9];
LABEL_6:
    BOOL v4 = 0;
    goto LABEL_7;
  }
  uint64_t v3 = sqlite3_step(v7);
  if (v3 != 101)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to update settings sync data and modified values" result:v3];
    goto LABEL_6;
  }
  BOOL v4 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6);
  return v4;
}

- (id)windowStateWithUUID:(id)a3
{
  BOOL v4 = NSString;
  objc_super v5 = [(WebBookmarkTabCollection *)self _uuidForQueries:a3];
  id v6 = [v4 stringWithFormat:@"WHERE uuid = %@", v5];

  id v7 = [(WebBookmarkTabCollection *)self _windowStatesWithFilter:v6];
  char v8 = [v7 firstObject];

  return v8;
}

- (WBWindowState)lastClosedWindowState
{
  id v2 = [(WebBookmarkTabCollection *)self _windowStatesWithFilter:@"WHERE windows.date_closed = (SELECT MAX(date_closed) from windows)"];
  uint64_t v3 = [v2 firstObject];

  return (WBWindowState *)v3;
}

- (NSArray)lastSessionWindowStates
{
  return (NSArray *)[(WebBookmarkTabCollection *)self _windowStatesWithFilter:@"WHERE windows.is_last_session = 1"];
}

- (NSArray)recentlyClosedWindowStates
{
  return (NSArray *)[(WebBookmarkTabCollection *)self _windowStatesWithFilter:@"WHERE windows.date_closed > 0"];
}

- (BOOL)_saveWindowState:(id)a3 activeTabGroupID:(int)a4 localTabGroupID:(int)a5 privateTabGroupID:(int)a6
{
  id v10 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v28, self->super._db, (const char *)objc_msgSend(@"INSERT INTO windows (active_tab_group_id, active_profile_id, date_closed, extra_attributes, is_last_session, local_tab_group_id, private_tab_group_id, scene_id, uuid) VALUES (?, ?, ?, ?, 1, ?, ?, ?, ?) ON CONFLICT (uuid) DO UPDATE SET active_tab_group_id = excluded.active_tab_group_id, active_profile_id = excluded.active_profile_id, date_closed = excluded.date_closed, extra_attributes = excluded.extra_attributes, local_tab_group_id = excluded.local_tab_group_id, private_tab_group_id = excluded.private_tab_group_id, is_last_session = 1, scene_id = excluded.scene_id", "UTF8String"));
  if (v30)
  {
    if (a4) {
      int v11 = a4;
    }
    else {
      int v11 = a5;
    }
    sqlite3_bind_int(v29, 1, v11);
    __int16 v12 = [v10 activeProfileIdentifier];

    if (v12
      && ([v10 activeProfileIdentifier],
          char v13 = objc_claimAutoreleasedReturnValue(),
          [(WebBookmarkCollection *)self bookmarkWithUUID:v13],
          char v14 = objc_claimAutoreleasedReturnValue(),
          v13,
          v14))
    {
      sqlite3_bind_int(v29, 2, [v14 identifier]);
    }
    else
    {
      char v14 = 0;
      sqlite3_bind_null(v29, 2);
    }
    unsigned int v15 = [v10 dateClosed];

    uint64_t v16 = v29;
    if (v15)
    {
      id v17 = [v10 dateClosed];
      [v17 timeIntervalSinceReferenceDate];
      sqlite3_bind_double(v16, 3, v18);
    }
    else
    {
      sqlite3_bind_null(v29, 3);
    }
    uint64_t v20 = v29;
    BOOL v21 = [v10 extraAttributes];
    bindAttributesToSQLStatement(v20, 4, v21);

    sqlite3_bind_int(v29, 5, a5);
    sqlite3_bind_int(v29, 6, a6);
    id v22 = v29;
    id v23 = [v10 sceneID];
    sqlite3_bind_text(v22, 7, (const char *)[v23 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    uint64_t v24 = v29;
    id v25 = [v10 uuid];
    sqlite3_bind_text(v24, 8, (const char *)[v25 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    uint64_t v26 = sqlite3_step(v29);
    BOOL v19 = v26 == 101;
    if (v26 != 101) {
      [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to add a window" result:v26];
    }
  }
  else
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to add a window" result:v31];
    BOOL v19 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v28);

  return v19;
}

- (BOOL)_saveActiveTabID:(int)a3 inTabGroupWithID:(int)a4 windowID:(int)a5
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12, self->super._db, (const char *)objc_msgSend(@"INSERT INTO windows_tab_groups (active_tab_id, tab_group_id, window_id) VALUES (?, ?, ?) ON CONFLICT (tab_group_id, window_id) DO UPDATE SET active_tab_id = excluded.active_tab_id", "UTF8String"));
  if (!v14)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to add an active tab" result:v15];
LABEL_6:
    BOOL v10 = 0;
    goto LABEL_7;
  }
  sqlite3_bind_int(v13, 1, a3);
  sqlite3_bind_int(v13, 2, a4);
  sqlite3_bind_int(v13, 3, a5);
  uint64_t v9 = sqlite3_step(v13);
  if (v9 != 101)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to add an active tab" result:v9];
    goto LABEL_6;
  }
  BOOL v10 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);
  return v10;
}

- (BOOL)_saveActiveTabGroupID:(int)a3 inProfileWithID:(int)a4 windowID:(int)a5
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12, self->super._db, (const char *)objc_msgSend(@"INSERT INTO windows_profiles (active_tab_group_id, profile_id, window_id) VALUES (?, ?, ?) ON CONFLICT (profile_id, window_id) DO UPDATE SET active_tab_group_id = excluded.active_tab_group_id", "UTF8String"));
  if (!v14)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to add an active tab group" result:v15];
LABEL_6:
    BOOL v10 = 0;
    goto LABEL_7;
  }
  sqlite3_bind_int(v13, 1, a3);
  sqlite3_bind_int(v13, 2, a4);
  sqlite3_bind_int(v13, 3, a5);
  uint64_t v9 = sqlite3_step(v13);
  if (v9 != 101)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to add an active tab group" result:v9];
    goto LABEL_6;
  }
  BOOL v10 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);
  return v10;
}

- (BOOL)_clearUnnamedTabGroupsInWindowWithID:(int)a3
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8, self->super._db, (const char *)[@"DELETE FROM windows_unnamed_tab_groups WHERE window_id = ?" UTF8String]);
  if (!v10)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to clear unnamed tab groups" result:v11];
LABEL_6:
    BOOL v6 = 0;
    goto LABEL_7;
  }
  sqlite3_bind_int(v9, 1, a3);
  uint64_t v5 = sqlite3_step(v9);
  if (v5 != 101)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to clear unnamed tab groups" result:v5];
    goto LABEL_6;
  }
  BOOL v6 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8);
  return v6;
}

- (BOOL)_saveUnnamedTabGroupID:(int)a3 inWindowWithID:(int)a4
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->super._db, (const char *)objc_msgSend(@"INSERT INTO windows_unnamed_tab_groups (tab_group_id, window_id) VALUES (?, ?)", "UTF8String"));
  if (!v12)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to add an unnamed tab group" result:v13];
LABEL_6:
    BOOL v8 = 0;
    goto LABEL_7;
  }
  sqlite3_bind_int(v11, 1, a3);
  sqlite3_bind_int(v11, 2, a4);
  uint64_t v7 = sqlite3_step(v11);
  if (v7 != 101)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to add an unnamed tab group" result:v7];
    goto LABEL_6;
  }
  BOOL v8 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
  return v8;
}

void __45__WebBookmarkTabCollection__saveWindowState___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) bookmarkWithUUID:a2];
  BOOL v8 = [*(id *)(a1 + 32) bookmarkWithUUID:v9];
  if ((objc_msgSend(*(id *)(a1 + 32), "_saveActiveTabID:inTabGroupWithID:windowID:", objc_msgSend(v8, "identifier"), objc_msgSend(v7, "identifier"), *(unsigned int *)(a1 + 48)) & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __45__WebBookmarkTabCollection__saveWindowState___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) bookmarkWithUUID:a2];
  BOOL v8 = [*(id *)(a1 + 32) bookmarkWithUUID:v9];
  if ((objc_msgSend(*(id *)(a1 + 32), "_saveActiveTabGroupID:inProfileWithID:windowID:", objc_msgSend(v8, "identifier"), objc_msgSend(v7, "identifier"), *(unsigned int *)(a1 + 48)) & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)closeWindowState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  [v4 setDateClosed:v5];

  LOBYTE(self) = [(WebBookmarkTabCollection *)self saveWindowState:v4];
  return (char)self;
}

- (BOOL)_deleteWindowState:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = NSString;
  BOOL v6 = [v4 uuid];
  uint64_t v7 = [(WebBookmarkTabCollection *)self _uuidForQueries:v6];
  BOOL v8 = [v5 stringWithFormat:@"WHERE uuid = %@", v7];

  if ([(WebBookmarkTabCollection *)self _deleteMatchingWindows:v8 logAsError:0])
  {
    id v9 = [v4 localTabGroup];
    char v10 = [v9 uuid];
    unsigned int v11 = [(WebBookmarkCollection *)self bookmarkWithUUID:v10];

    if ([v11 identifier]
      && ![(WebBookmarkCollection *)self deleteBookmark:v11 leaveTombstone:0])
    {
      BOOL v19 = 0;
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      char v12 = [v4 unnamedTabGroupUUIDs];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = [(WebBookmarkCollection *)self bookmarkWithUUID:*(void *)(*((void *)&v21 + 1) + 8 * i)];
            if ([v16 identifier]
              && ![(WebBookmarkCollection *)self deleteBookmark:v16 leaveTombstone:1])
            {

              BOOL v19 = 0;
              goto LABEL_19;
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      id v17 = [v4 privateTabGroup];
      double v18 = [v17 uuid];
      char v12 = [(WebBookmarkCollection *)self bookmarkWithUUID:v18];

      if ([v12 identifier]) {
        BOOL v19 = [(WebBookmarkCollection *)self deleteBookmark:v12 leaveTombstone:0];
      }
      else {
        BOOL v19 = 1;
      }
LABEL_19:
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)deleteWindowState:(id)a3
{
  return [(WebBookmarkTabCollection *)self _deleteWindowState:a3 forApplyingInMemoryChanges:0];
}

- (BOOL)_deleteWindowState:(id)a3 forApplyingInMemoryChanges:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __74__WebBookmarkTabCollection__deleteWindowState_forApplyingInMemoryChanges___block_invoke;
    v11[3] = &unk_2643DA270;
    v11[4] = self;
    id v12 = v6;
    BOOL v8 = [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:v11 applyInMemoryChanges:!v4 secureDelete:1];
  }
  else
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkTabCollection _deleteWindowState:forApplyingInMemoryChanges:]();
    }
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __74__WebBookmarkTabCollection__deleteWindowState_forApplyingInMemoryChanges___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteWindowState:*(void *)(a1 + 40)];
}

- (BOOL)deleteWindowStates:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__WebBookmarkTabCollection_deleteWindowStates___block_invoke;
  v7[3] = &unk_2643DA270;
  id v8 = v4;
  id v9 = self;
  id v5 = v4;
  LOBYTE(self) = [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:v7 secureDelete:1];

  return (char)self;
}

uint64_t __47__WebBookmarkTabCollection_deleteWindowStates___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        if ((objc_msgSend(*(id *)(a1 + 40), "_deleteWindowState:", *(void *)(*((void *)&v8 + 1) + 8 * v5), (void)v8) & 1) == 0)
        {
          uint64_t v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

- (BOOL)_deleteAllWindowStates
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(WebBookmarkTabCollection *)self windowStates];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        if (![(WebBookmarkTabCollection *)self _deleteWindowState:*(void *)(*((void *)&v9 + 1) + 8 * i)])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)deleteAllWindowStates
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__WebBookmarkTabCollection_deleteAllWindowStates__block_invoke;
  v3[3] = &unk_2643DA0F8;
  v3[4] = self;
  return [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:v3 secureDelete:1];
}

uint64_t __49__WebBookmarkTabCollection_deleteAllWindowStates__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteAllWindowStates];
}

- (BOOL)_deleteWindowsNotInLastSession
{
  id v2 = self;
  uint64_t v3 = [(WebBookmarkTabCollection *)self _windowStatesWithFilter:@"WHERE is_last_session = 0"];
  LOBYTE(v2) = [(WebBookmarkTabCollection *)v2 deleteWindowStates:v3];

  return (char)v2;
}

- (unint64_t)_countOfAllLocalTabsToBeDeleted
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6, self->super._db, (const char *)[@"SELECT COUNT(*) FROM bookmarks WHERE syncable = 0 AND hidden = 0 AND type = 0 AND parent != 0" UTF8String]);
  if (!v8)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to query number of tabs to be deleted" result:v9];
LABEL_6:
    unint64_t v4 = 0;
    goto LABEL_7;
  }
  uint64_t v3 = sqlite3_step(v7);
  if (v3 != 100)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to query number of tabs to be deleted" result:v3];
    goto LABEL_6;
  }
  unint64_t v4 = sqlite3_column_int(v7, 0);
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6);
  return v4;
}

- (BOOL)_deleteAllLocalTabsAndGroups
{
  uint64_t v3 = [(WebBookmarkTabCollection *)self _specialTabFolderUUIDsForQueries];
  unint64_t v4 = [v3 componentsJoinedByString:@", "];

  uint64_t v5 = [NSString stringWithFormat:@"DELETE FROM bookmarks WHERE syncable = 0 AND (parent != 0 OR external_uuid NOT IN (%@))", v4];
  db = self->super._db;
  id v7 = v5;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, db, (const char *)[v7 UTF8String]);
  if (!v13)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to delete all tabs" result:v14];
LABEL_6:
    BOOL v9 = 0;
    goto LABEL_7;
  }
  uint64_t v8 = sqlite3_step(v12);
  if (v8 != 101)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to delete all tabs" result:v8];
    goto LABEL_6;
  }
  BOOL v9 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);

  return v9;
}

- (BOOL)_markTabsClosed:(id)a3
{
  unint64_t v4 = objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_395);
  uint64_t v5 = [v4 componentsJoinedByString:@", "];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  id v7 = [NSString stringWithFormat:@"UPDATE bookmarks SET date_closed = %f WHERE id in (%@)", v6, v5];
  db = self->super._db;
  id v9 = v7;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12, db, (const char *)[v9 UTF8String]);
  int v10 = v13;
  if (!v13) {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to update tab close date" result:v14];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);

  return v10 != 0;
}

id __44__WebBookmarkTabCollection__markTabsClosed___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 bookmark];
  unint64_t v4 = objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "identifier"));

  return v4;
}

- (BOOL)_markWindowStatesAsLastSession:(id)a3
{
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__WebBookmarkTabCollection__markWindowStatesAsLastSession___block_invoke;
  v16[3] = &unk_2643DA2E0;
  v16[4] = self;
  unint64_t v4 = objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v16);
  uint64_t v5 = [v4 componentsJoinedByString:@", "];
  uint64_t v6 = [NSString stringWithFormat:@"UPDATE windows SET is_last_session = CASE WHEN uuid in (%@) THEN 1 ELSE 0 END", v5];
  db = self->super._db;
  id v8 = v6;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12, db, (const char *)[v8 UTF8String]);
  if (!v14)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to update last session" result:v15];
LABEL_6:
    BOOL v10 = 0;
    goto LABEL_7;
  }
  uint64_t v9 = sqlite3_step(v13);
  if (v9 != 101)
  {
    [(WebBookmarkTabCollection *)self _logErrorWithMessage:@"Failed to update last session" result:v9];
    goto LABEL_6;
  }
  BOOL v10 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);

  return v10;
}

id __59__WebBookmarkTabCollection__markWindowStatesAsLastSession___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 uuid];
  unint64_t v4 = [v2 _uuidForQueries:v3];

  return v4;
}

- (BOOL)allowsScopedBookmarksInTabGroup:(id)a3
{
  id v3 = a3;
  if (([v3 supportsTabGroupFavorites] & 1) != 0 && objc_msgSend(v3, "isSyncable"))
  {
    unint64_t v4 = [v3 bookmark];
    if ([v4 specialID])
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      uint64_t v6 = [v3 bookmark];
      int v5 = [v6 isHidden] ^ 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_generateServerIdIfNeededForTabGroup:(id)a3
{
  unint64_t v4 = [a3 bookmark];
  LOBYTE(self) = [(WebBookmarkTabCollection *)self _generateServerIdIfNeededForTabGroupBookmark:v4];

  return (char)self;
}

- (BOOL)_generateServerIdIfNeededForTabGroupBookmark:(id)a3
{
  id v4 = a3;
  int v5 = [v4 serverID];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else if ([v4 identifier] == 0x7FFFFFFF)
  {
    BOOL v6 = 0;
  }
  else
  {
    id v7 = -[WebBookmarkCollection serverIDForBookmarkID:](self, "serverIDForBookmarkID:", [v4 identifier]);
    if (v7)
    {
      [v4 setServerID:v7];
      BOOL v6 = 1;
    }
    else
    {
      id v8 = [MEMORY[0x263F08C38] UUID];
      uint64_t v9 = [v8 UUIDString];
      BOOL v10 = [(WebBookmarkCollection *)self setServerID:v9 forBookmark:v4];

      if (v10)
      {
        uint64_t v11 = -[WebBookmarkCollection serverIDForBookmarkID:](self, "serverIDForBookmarkID:", [v4 identifier]);
        [v4 setServerID:v11];
      }
      else
      {
        uint64_t v11 = 0;
      }
      BOOL v6 = v11 != 0;
      id v7 = (void *)v11;
    }
  }
  return v6;
}

- (id)_generateNewServerIDForBookmark:(id)a3
{
  id v4 = a3;
  if (![v4 isFolder] || objc_msgSend(v4, "subtype") != 1) {
    goto LABEL_6;
  }
  int v5 = -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", [v4 parentID]);
  if (![v5 isFolder] || objc_msgSend(v5, "subtype"))
  {

LABEL_6:
    v9.receiver = self;
    v9.super_class = (Class)WebBookmarkTabCollection;
    BOOL v6 = [(WebBookmarkCollection *)&v9 _generateNewServerIDForBookmark:v4];
    goto LABEL_7;
  }
  id v8 = [v5 serverID];
  BOOL v6 = [@"TopScopedBookmarkList_" stringByAppendingString:v8];

LABEL_7:
  return v6;
}

- (id)_topScopedBookmarkListServerIdForTabGroup:(id)a3
{
  id v3 = [a3 bookmark];
  id v4 = [v3 serverID];
  int v5 = [@"TopScopedBookmarkList_" stringByAppendingString:v4];

  return v5;
}

- (BOOL)createTopScopedBookmarkListForTabGroup:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(WebBookmarkTabCollection *)self allowsScopedBookmarksInTabGroup:v4]) {
    goto LABEL_5;
  }
  int v5 = [v4 uuid];
  int v6 = [(WebBookmarkCollection *)self identifierOfBookmarkWithUUID:v5];

  if (v6 == 0x7FFFFFFF) {
    goto LABEL_5;
  }
  if (-[WebBookmarkTabCollection _generateServerIdIfNeededForTabGroup:](self, "_generateServerIdIfNeededForTabGroup:", v4)&& (-[WebBookmarkTabCollection _listOfScopedBookmarkFoldersInTabGroup:](self, "_listOfScopedBookmarkFoldersInTabGroup:", v4), v7 = objc_claimAutoreleasedReturnValue(), [v7 bookmarkArray], id v8 = objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "count"), v8, v7, !v9))
  {
    long long v12 = [(WebBookmarkTabCollection *)self _topScopedBookmarkListServerIdForTabGroup:v4];
    int v13 = [(WebBookmarkCollection *)self bookmarkIDForServerID:v12 excludeDeletedBookmarks:0];
    if (v13 == 0x7FFFFFFF)
    {
      char v14 = [WebBookmark alloc];
      uint64_t v15 = [v4 identifier];
      uint64_t v16 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
      id v17 = [(WebBookmark *)v14 initFolderWithParentID:v15 subtype:1 deviceIdentifier:v16 collectionType:1];

      [v17 setTitle:@"TopScopedBookmarkList"];
      [v17 setServerID:v12];
      BOOL v10 = [(WebBookmarkCollection *)self _saveBookmark:v17 withSpecialID:0 updateGenerationIfNeeded:1];
    }
    else
    {
      double v18 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = [v4 identifier];
        uint64_t v20 = [v4 uuid];
        v21[0] = 67109635;
        v21[1] = v13;
        __int16 v22 = 1024;
        int v23 = v19;
        __int16 v24 = 2113;
        id v25 = v20;
        _os_log_error_impl(&dword_21C043000, v18, OS_LOG_TYPE_ERROR, "Detected orphaned TopScopedBookmarkList %d that belongs to Tab Group %d(%{private}@).", (uint8_t *)v21, 0x18u);
      }
      BOOL v10 = 0;
    }
  }
  else
  {
LABEL_5:
    BOOL v10 = 0;
  }

  return v10;
}

- (id)topScopedBookmarkListForTabGroup:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(WebBookmarkTabCollection *)self allowsScopedBookmarksInTabGroup:v6])
  {
    id v17 = 0;
    goto LABEL_17;
  }
  id v8 = [(WebBookmarkTabCollection *)self _listOfScopedBookmarkFoldersInTabGroup:v6];
  uint64_t v9 = [v8 bookmarkArray];
  uint64_t v10 = [v9 count];

  if (!v10)
  {
    if (![(WebBookmarkTabCollection *)self createTopScopedBookmarkListForTabGroup:v6])goto LABEL_14; {
    uint64_t v11 = [(WebBookmarkTabCollection *)self _listOfScopedBookmarkFoldersInTabGroup:v6];
    }

    id v8 = (void *)v11;
  }
  long long v12 = [v8 bookmarkArray];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    char v14 = [v8 bookmarkArray];
    uint64_t v15 = [v14 firstObject];
    uint64_t v16 = [v15 identifier];
  }
  else
  {
    char v14 = [(WebBookmarkTabCollection *)self _topScopedBookmarkListServerIdForTabGroup:v6];
    uint64_t v16 = [(WebBookmarkCollection *)self bookmarkIDForServerID:v14 excludeDeletedBookmarks:0];
  }

  if (v16 && v16 != 0x7FFFFFFF)
  {
    int v19 = [[WebBookmarkListQuery alloc] initWithFolderID:v16 inCollection:self usingFilter:0 options:0];
    id v17 = [[WebBookmarkList alloc] initWithQuery:v19 skipOffset:0 collection:self queue:v7];

    goto LABEL_16;
  }
  double v18 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    [v6 identifier];
    [v6 uuid];
    objc_claimAutoreleasedReturnValue();
    -[WebBookmarkTabCollection topScopedBookmarkListForTabGroup:onQueue:]();
  }

LABEL_14:
  id v17 = 0;
LABEL_16:

LABEL_17:
  return v17;
}

- (id)_listOfScopedBookmarkFoldersInTabGroup:(id)a3
{
  id v4 = a3;
  int v5 = -[WebBookmarkListQuery initWithFolderID:inCollection:usingFilter:options:]([WebBookmarkListQuery alloc], "initWithFolderID:inCollection:usingFilter:options:", [v4 identifier], self, 0, 13);
  id v6 = [[WebBookmarkList alloc] initWithQuery:v5 skipOffset:0 collection:self];

  return v6;
}

- (id)_specialTabFolderUUIDs
{
  v4[3] = *MEMORY[0x263EF8340];
  v4[0] = @"pinned";
  v4[1] = @"privatePinned";
  v4[2] = @"recentlyClosed";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
  return v2;
}

- (id)_specialTabFolderUUIDsForQueries
{
  id v3 = [(WebBookmarkTabCollection *)self _specialTabFolderUUIDs];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__WebBookmarkTabCollection__specialTabFolderUUIDsForQueries__block_invoke;
  v6[3] = &unk_2643DA308;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", v6);

  return v4;
}

id __60__WebBookmarkTabCollection__specialTabFolderUUIDsForQueries__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) _uuidForQueries:a2];
  return v2;
}

- (void)_createSpecialFolderWithIDIfNeeded:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9[1] = *MEMORY[0x263EF8340];
  int v5 = -[WebBookmarkCollection bookmarkWithSpecialID:](self, "bookmarkWithSpecialID:");
  if (!v5)
  {
    id v6 = [[WebBookmark alloc] initFolderWithParentID:0 collectionType:1];
    [v6 setTitle:@"Windows"];
    id v8 = @"com.apple.bookmarks.OmitFromUI";
    v9[0] = MEMORY[0x263EFFA88];
    id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v6 setExtraAttributes:v7];

    [v6 _setSyncable:0];
    [(WebBookmarkCollection *)self _saveBookmark:v6 withSpecialID:v3 updateGenerationIfNeeded:1];
  }
}

WBTab *__65__WebBookmarkTabCollection__specialTabsWithUUID_privateBrowsing___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[WBTab alloc] initWithBookmark:v3 isPrivateBrowsing:*(unsigned __int8 *)(a1 + 32)];

  return v4;
}

- (int)pinnedTabsFolderID
{
  int result = self->_cachedPinnedTabsFolderID;
  if (!result)
  {
    id v4 = [(WebBookmarkCollection *)self bookmarkWithUUID:@"pinned"];
    self->_cachedPinnedTabsFolderID = [v4 identifier];

    return self->_cachedPinnedTabsFolderID;
  }
  return result;
}

- (int)privatePinnedTabsFolderID
{
  int result = self->_cachedPrivatePinnedTabsFolderID;
  if (!result)
  {
    id v4 = [(WebBookmarkCollection *)self bookmarkWithUUID:@"privatePinned"];
    self->_cachedPrivatePinnedTabsFolderID = [v4 identifier];

    return self->_cachedPrivatePinnedTabsFolderID;
  }
  return result;
}

- (NSArray)recentlyClosedTabs
{
  return (NSArray *)[(WebBookmarkTabCollection *)self _specialTabsWithUUID:@"recentlyClosed" privateBrowsing:0];
}

- (WebBookmarkList)recentlyClosedTabList
{
  id v3 = [(WebBookmarkCollection *)self bookmarkWithUUID:@"recentlyClosed"];
  id v4 = -[WebBookmarkCollection listWithID:](self, "listWithID:", [v3 identifier]);

  return (WebBookmarkList *)v4;
}

- (int)_cachedPinnedTabsFolderIDForProfileWithIdentifier:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_cachedPinnedTabsFolderIDByProfileIdentifier objectForKeyedSubscript:a3];
  int v5 = v4;
  if (v4) {
    int v3 = [v4 intValue];
  }

  if (v5) {
    return v3;
  }
  else {
    return 0x7FFFFFFF;
  }
}

- (void)_cachePinnedTabsFolderID:(int)a3 forProfileWithIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v9 = a4;
  if (!self->_cachedPinnedTabsFolderIDByProfileIdentifier)
  {
    id v6 = [MEMORY[0x263EFF9A0] dictionary];
    cachedPinnedTabsFolderIDByProfileIdentifier = self->_cachedPinnedTabsFolderIDByProfileIdentifier;
    self->_cachedPinnedTabsFolderIDByProfileIdentifier = v6;
  }
  id v8 = [NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)self->_cachedPinnedTabsFolderIDByProfileIdentifier setObject:v8 forKeyedSubscript:v9];
}

- (int)pinnedTabsFolderIDForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  LODWORD(v5) = [(WebBookmarkTabCollection *)self _cachedPinnedTabsFolderIDForProfileWithIdentifier:v4];
  if (v5 == 0x7FFFFFFF)
  {
    id v6 = [(WebBookmarkCollection *)self bookmarkWithUUID:v4];
    id v7 = [NSString stringWithFormat:@"pinned-%@", v4];
    -[WebBookmarkTabCollection _createSpecialTabsFolderWithUUIDIfNeeded:withParentID:](self, "_createSpecialTabsFolderWithUUIDIfNeeded:withParentID:", v7, [v6 identifier]);
    id v8 = [(WebBookmarkCollection *)self bookmarkWithUUID:v7];
    uint64_t v5 = [v8 identifier];

    [(WebBookmarkTabCollection *)self _cachePinnedTabsFolderID:v5 forProfileWithIdentifier:v4];
  }

  return v5;
}

- (id)pinnedTabsForProfileWithIdentifier:(id)a3
{
  id v4 = [NSString stringWithFormat:@"pinned-%@", a3];
  uint64_t v5 = [(WebBookmarkTabCollection *)self _specialTabsWithUUID:v4 privateBrowsing:0];

  return v5;
}

- (id)generatePositionBeforeFirstRecordInParentWithServerID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)*MEMORY[0x263F66408];
  }
  int v7 = [(WebBookmarkCollection *)self bookmarkIDForServerID:v6 excludeDeletedBookmarks:1];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v16, self->super._db, (const char *)[@"SELECT sync_data FROM bookmarks WHERE parent = ? AND server_id IS NOT NULL" UTF8String]);
  sqlite3_bind_int(v17, 1, v7);
  id v8 = 0;
  while (sqlite3_step(v17) == 100)
  {
    id v9 = WBDataFromNullableColumn(v17, 0);
    uint64_t v10 = +[WBBookmarkSyncData positionFromContentsOfData:v9];

    if (v8)
    {
      if ([v10 compare:v8] == -1)
      {
        id v11 = v10;

        id v8 = v11;
      }
    }
    else
    {
      id v8 = v10;
    }
  }
  long long v12 = (void *)MEMORY[0x263F66618];
  uint64_t v13 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
  char v14 = objc_msgSend(v12, "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", 0, v8, v13, -[WebBookmarkCollection nextDatabaseSyncChangeID](self, "nextDatabaseSyncChangeID"));

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v16);
  return v14;
}

- (int)createLegacyPlaceholderTabGroupBookmarksForSharedTabGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [WebBookmark alloc];
  id v6 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
  id v7 = [(WebBookmark *)v5 initFolderWithParentID:0 deviceIdentifier:v6 collectionType:1];

  id v8 = [v4 serverID];
  uint64_t v9 = *MEMORY[0x263F667B0];
  uint64_t v10 = [(id)*MEMORY[0x263F667B0] stringByAppendingString:v8];
  [v7 setServerID:v10];

  id v11 = [v4 title];
  [v7 setTitle:v11];

  [v7 _setHidden:1];
  if (![(WebBookmarkCollection *)self _saveAndMoveBookmark:v7 toFolderID:0]) {
    goto LABEL_6;
  }
  if (![(WebBookmarkCollection *)self _reorderBookmark:v7 afterBookmark:v4])
  {
    [(WebBookmarkCollection *)self deleteBookmark:v7 leaveTombstone:0];
LABEL_6:
    int v21 = 0x7FFFFFFF;
    goto LABEL_9;
  }
  long long v12 = _WBSLocalizedString();
  uint64_t v13 = [NSString stringWithFormat:@"https://www.icloud.com/%@/unsupported-safari-version", *MEMORY[0x263F66698]];
  char v14 = [WebBookmark alloc];
  uint64_t v15 = [v7 identifier];
  uint64_t v16 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
  id v17 = [(WebBookmark *)v14 initWithTitle:v12 address:v13 parentID:v15 deviceIdentifier:v16 collectionType:1];

  double v18 = NSString;
  int v19 = [v4 serverID];
  uint64_t v20 = [v18 stringWithFormat:@"%@TabGroupTab_%@", v9, v19];
  [(WebBookmark *)v17 setServerID:v20];

  [(WebBookmark *)v17 _setHidden:1];
  if (-[WebBookmarkCollection _saveAndMoveBookmark:toFolderID:](self, "_saveAndMoveBookmark:toFolderID:", v17, [v7 identifier]))
  {
    int v21 = [v7 identifier];
  }
  else
  {
    [(WebBookmarkCollection *)self deleteBookmark:v7 leaveTombstone:0];
    int v21 = 0x7FFFFFFF;
  }

LABEL_9:
  return v21;
}

- (BOOL)_removePlaceholderTabGroupRecordsOnUpgrade
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__WebBookmarkTabCollection__removePlaceholderTabGroupRecordsOnUpgrade__block_invoke;
  v3[3] = &unk_2643DA0F8;
  v3[4] = self;
  return [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:v3 secureDelete:1];
}

uint64_t __70__WebBookmarkTabCollection__removePlaceholderTabGroupRecordsOnUpgrade__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  int v3 = [NSString stringWithFormat:@"server_id LIKE '%@%%'", *MEMORY[0x263F667B0]];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v10, (sqlite3_stmt *)[v2 _selectBookmarksWhere:v3]);

  while (sqlite3_step(v11) == 100)
  {
    id v4 = [WebBookmark alloc];
    uint64_t v5 = v11;
    uint64_t v6 = [*(id *)(a1 + 32) currentDeviceIdentifier];
    id v7 = [(WebBookmark *)v4 initWithSQLiteStatement:v5 deviceIdentifier:v6 collectionType:1];

    LOBYTE(v6) = [*(id *)(a1 + 32) deleteBookmark:v7 leaveTombstone:0];
    if ((v6 & 1) == 0)
    {
      uint64_t v8 = 0;
      goto LABEL_6;
    }
  }
  uint64_t v8 = [*(id *)(a1 + 32) updateDatabaseSyncDataUsingBlock:&__block_literal_global_436];
LABEL_6:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
  return v8;
}

id __70__WebBookmarkTabCollection__removePlaceholderTabGroupRecordsOnUpgrade__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 clearAllLastServerChangeTokens];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)_performSafariVersionUpgradesFromPreviousVersion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Failed to remove unnamed tab groups from windows that were already closed.", v2, v3, v4, v5, v6);
}

- (void)_performSafariVersionUpgradesFromPreviousVersion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Failed to delete personal profile which was saved as a Tab Group.", v2, v3, v4, v5, v6);
}

- (void)_performSafariVersionUpgradesFromPreviousVersion:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Failed to delete extra personal profiles", v2, v3, v4, v5, v6);
}

- (void)_performSafariVersionUpgradesFromPreviousVersion:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Failed to check locally saved CKShare records", v2, v3, v4, v5, v6);
}

- (void)_performSafariVersionUpgradesFromPreviousVersion:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Failed to reset current user-owned shared Tab Group zone server change tokens", v2, v3, v4, v5, v6);
}

- (void)_performSafariVersionUpgradesFromPreviousVersion:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Failed to retrieve CKShare records to refresh", v2, v3, v4, v5, v6);
}

- (void)_performSafariVersionUpgradesOutsideSafariProcessFromPreviousVersion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Failed to re-encode session state data to truncate large HTTP bodies.", v2, v3, v4, v5, v6);
}

- (void)_deleteDuplicatePersonalProfilesWithInvalidUUID
{
  OUTLINED_FUNCTION_3_1();
  *(_DWORD *)uint64_t v1 = 138543362;
  *(void *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_2(&dword_21C043000, v1, v3, "Failed to delete extra personal profile with mismatched UUID: %{public}@", v4);
}

- (void)_deleteDefaultProfileIfSavedAsTabGroup
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Failed to delete personal profile that was saved as a Tab Group", v2, v3, v4, v5, v6);
}

- (void)_fixLocalBookmarksInSyncableFolders
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Failed to save updated syncable bookmark", v2, v3, v4, v5, v6);
}

- (void)_regenerateSyncPositionsIfNeeded
{
  OUTLINED_FUNCTION_3_1();
  *(_DWORD *)uint64_t v1 = 138543362;
  *(void *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_2(&dword_21C043000, v1, v3, "Failed to save generated position for record %{public}@", v4);
}

void __60__WebBookmarkTabCollection__regenerateSyncPositionsIfNeeded__block_invoke_175_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  *(_DWORD *)uint64_t v1 = 138543362;
  *(void *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_2(&dword_21C043000, v1, v3, "Setting position failed for bookmark %{public}@", v4);
}

- (void)_saveWindowState:forApplyingInMemoryChanges:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Attempted to save a nil window state", v2, v3, v4, v5, v6);
}

- (void)_saveWindowState:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Failed to save private tab group while trying to save window state", v2, v3, v4, v5, v6);
}

- (void)_deleteWindowState:forApplyingInMemoryChanges:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Attempted to delete a nil window state", v2, v3, v4, v5, v6);
}

- (void)topScopedBookmarkListForTabGroup:onQueue:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  *(_DWORD *)uint64_t v1 = 67109379;
  *(_DWORD *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 8) = 2113;
  *(void *)(v1 + 10) = v3;
  _os_log_error_impl(&dword_21C043000, v5, OS_LOG_TYPE_ERROR, "Tab Group %d(%{private}@) does not have a scoped bookmark folder.", v4, 0x12u);
}

@end