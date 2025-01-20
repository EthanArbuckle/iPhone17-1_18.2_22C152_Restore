@interface WBBookmarkDBAccess
- (BOOL)addItem:(void *)a3 underFolderWithServerId:(id)a4 database:(void *)a5;
- (BOOL)changeIsDAVMoveChange:(void *)a3;
- (BOOL)changeIsMoveChange:(void *)a3;
- (BOOL)item:(void *)a3 isEqualToItem:(void *)a4;
- (BOOL)item:(void *)a3 isInFolderWithServerSyncId:(id)a4;
- (BOOL)performMaintenanceOnDatabase:(void *)a3 afterVersion:(id)a4;
- (NSString)description;
- (WBBookmarkDBAccess)initWithCollectionType:(int64_t)a3;
- (WBBookmarkDBAccess)initWithCollectionType:(int64_t)a3 storeOwner:(int64_t)a4;
- (__CFArray)copyChangesWithDatabase:(void *)a3 changeToken:(const void *)a4;
- (__CFData)copySyncDataWithDatabase:(void *)a3;
- (__CFData)copySyncDataWithItem:(void *)a3;
- (__CFString)copyParentServerIdWithItem:(void *)a3;
- (__CFString)copyServerIdWithChange:(void *)a3;
- (__CFString)copyServerIdWithItem:(void *)a3;
- (__CFString)copySyncKeyWithItem:(void *)a3;
- (id)copyAccountHashWithDatabase:(void *)a3;
- (id)copyAttributesWithItem:(void *)a3;
- (id)copyChangeTokenWithDatabase:(void *)a3;
- (id)copyDeletedBookmarkSyncDataWithChange:(void *)a3;
- (id)copyDeviceIdentifier;
- (id)copyFirstServerIdInFolderWithServerId:(id)a3 database:(void *)a4;
- (id)copyLastServerIdInFolderWithServerId:(id)a3 database:(void *)a4;
- (id)copyLocalIDsInFolderWithLocalID:(id)a3 database:(void *)a4;
- (id)copyModifiedAttributesWithChange:(void *)a3;
- (id)copySaveURLForAssetWithKey:(id)a3 item:(void *)a4;
- (id)copyServerIdInFolderAfterServerId:(id)a3 database:(void *)a4;
- (id)copyServerIdInFolderBeforeServerId:(id)a3 database:(void *)a4;
- (id)copyServerIdsInFolderWithServerId:(id)a3 database:(void *)a4;
- (id)copyUsernameAccountHashWithDatabase:(void *)a3;
- (id)copyValueForKey:(id)a3 item:(void *)a4;
- (id)localIDsOfInterestForDiagnosticsWithDatabase:(void *)a3;
- (int)changeTypeForChange:(void *)a3;
- (int64_t)bookmarkTypeForChange:(void *)a3;
- (int64_t)bookmarkTypeWithBookmark:(void *)a3;
- (int64_t)collectionType;
- (int64_t)folderTypeForChange:(void *)a3;
- (int64_t)folderTypeWithFolder:(void *)a3;
- (int64_t)itemTypeForChange:(void *)a3;
- (int64_t)itemTypeWithItem:(void *)a3;
- (int64_t)localCloudKitMigrationState:(void *)a3;
- (int64_t)storeOwner;
- (void)beginMergingChangesWithDatabase:(void *)a3;
- (void)clearAllSyncDataWithDatabase:(void *)a3;
- (void)clearChangesWithChangeToken:(void *)a3 database:(void *)a4;
- (void)clearlAllLocalBookmarksForAutomatedTestingWithDatabase:(void *)a3;
- (void)closeDatabase:(void *)a3 shouldSave:(BOOL)a4;
- (void)copyChangedItemWithChange:(void *)a3;
- (void)copyDeviceIdentifier;
- (void)copyItemWithLocalID:(id)a3 database:(void *)a4;
- (void)copyItemWithServerId:(id)a3 database:(void *)a4;
- (void)createBookmarkWithType:(int64_t)a3 database:(void *)a4;
- (void)createDatabase;
- (void)createFolderWithType:(int64_t)a3 database:(void *)a4;
- (void)finishMergingChangesWithDatabase:(void *)a3;
- (void)notifyForSaveOfAssetWithKey:(id)a3 item:(void *)a4;
- (void)openDatabase:(void *)a3;
- (void)performDeduplicationWithDatabase:(void *)a3 mode:(int64_t)a4;
- (void)removeItemWithServerId:(__CFString *)a3 database:(void *)a4;
- (void)resetDeviceIdentifier;
- (void)saveDatabase:(void *)a3;
- (void)setAccountHash:(id)a3 database:(void *)a4;
- (void)setChildrenOrder:(id)a3 forFolderWithServerId:(id)a4 database:(void *)a5;
- (void)setDeletedBookmarkSyncData:(id)a3 change:(void *)a4;
- (void)setLocalCloudKitMigrationState:(int64_t)a3 database:(void *)a4;
- (void)setModifiedAttributes:(id)a3 item:(void *)a4;
- (void)setServerId:(__CFString *)a3 item:(void *)a4;
- (void)setSyncData:(__CFData *)a3 database:(void *)a4;
- (void)setSyncData:(__CFData *)a3 item:(void *)a4;
- (void)setSyncKey:(__CFString *)a3 item:(void *)a4;
@end

@implementation WBBookmarkDBAccess

- (WBBookmarkDBAccess)initWithCollectionType:(int64_t)a3
{
  return [(WBBookmarkDBAccess *)self initWithCollectionType:a3 storeOwner:0];
}

- (WBBookmarkDBAccess)initWithCollectionType:(int64_t)a3 storeOwner:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WBBookmarkDBAccess;
  v6 = [(WBBookmarkDBAccess *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_collectionType = a3;
    v6->_storeOwner = a4;
    v8 = v6;
  }

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = WBNSStringFromCollectionType(self->_collectionType);
  v6 = WBNSStringFromCollectionStoreOwner(self->_storeOwner);
  v7 = [v3 stringWithFormat:@"<%@: %p, type: %@, store owner: %@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (void)createDatabase
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int64_t collectionType = self->_collectionType;
  int64_t storeOwner = self->_storeOwner;
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v21 = 136315138;
    *(void *)&v21[4] = "WebBookmarkDatabaseCreate";
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s()", v21, 0xCu);
  }
  v5 = [MEMORY[0x263F086E0] mainBundle];
  v6 = [v5 bundleIdentifier];
  int v7 = [v6 hasPrefix:@"com.apple.dataaccess"];

  if (collectionType == 1)
  {
    v8 = objc_opt_class();
    uint64_t v9 = +[WBCollectionConfiguration safariTabCollectionConfiguration];
    goto LABEL_7;
  }
  if (!collectionType)
  {
    v8 = objc_opt_class();
    uint64_t v9 = +[WBCollectionConfiguration safariBookmarkCollectionConfiguration];
LABEL_7:
    objc_super v10 = (void *)v9;
    goto LABEL_9;
  }
  objc_super v10 = 0;
  v8 = 0;
LABEL_9:
  [v10 setStoreOwner:storeOwner];
  char v11 = [v8 lockSync];
  v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)v21 = 136315138;
      *(void *)&v21[4] = "WebBookmarkDatabaseCreate";
      _os_log_impl(&dword_21C043000, v12, OS_LOG_TYPE_INFO, "@@ %s: Did successfully lock database", v21, 0xCu);
    }
    v14 = (void *)[objc_alloc((Class)v8) initWithConfiguration:v10 checkIntegrity:0];
    v15 = v14;
    if (v14)
    {
      if (!v7 || ![v14 _syncType])
      {
        v19 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v21 = 136315394;
          *(void *)&v21[4] = "WebBookmarkDatabaseCreate";
          *(_WORD *)&v21[12] = 2114;
          *(void *)&v21[14] = v15;
          _os_log_impl(&dword_21C043000, v19, OS_LOG_TYPE_INFO, "<- %s -> database: %{public}@", v21, 0x16u);
        }
        id v18 = v15;
        goto LABEL_27;
      }
      v16 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v21 = 136315138;
        *(void *)&v21[4] = "WebBookmarkDatabaseCreate";
        v17 = "<- %s -> database: NULL due to not running in data access process with DAV enabled";
LABEL_25:
        _os_log_impl(&dword_21C043000, v16, OS_LOG_TYPE_INFO, v17, v21, 0xCu);
      }
    }
    else
    {
      v16 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v21 = 136315138;
        *(void *)&v21[4] = "WebBookmarkDatabaseCreate";
        v17 = "<- %s -> database: NULL due to failure to allocate WebBookmarkCollection";
        goto LABEL_25;
      }
    }
    objc_msgSend(v8, "unlockSync", *(_OWORD *)v21);
    id v18 = 0;
LABEL_27:

    goto LABEL_28;
  }
  if (v13)
  {
    *(_DWORD *)v21 = 136315138;
    *(void *)&v21[4] = "WebBookmarkDatabaseCreate";
    _os_log_impl(&dword_21C043000, v12, OS_LOG_TYPE_INFO, "<- %s -> database: NULL due to failure to obtain lock", v21, 0xCu);
  }
  id v18 = 0;
LABEL_28:

  return v18;
}

- (void)openDatabase:(void *)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    v8 = "BADatabaseOpen";
    __int16 v9 = 2114;
    objc_super v10 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v7, 0x16u);
  }
  v5 = a3;
  if (([v5 maintainsSyncMetadata] & 1) == 0) {
    [v5 beginSyncTransaction];
  }
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    v8 = "BADatabaseOpen";
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v7, 0xCu);
  }
}

- (void)saveDatabase:(void *)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    v8 = "BADatabaseSave";
    __int16 v9 = 2114;
    objc_super v10 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v7, 0x16u);
  }
  v5 = a3;
  if (([v5 maintainsSyncMetadata] & 1) == 0) {
    [v5 commitSyncTransaction];
  }
  [v5 _postBookmarksDidReloadNotificationAndStartReadingListFetcherIfChangesWereMade];
  if (([v5 maintainsSyncMetadata] & 1) == 0) {
    [v5 beginSyncTransaction];
  }
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    v8 = "BADatabaseSave";
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v7, 0xCu);
  }
}

- (void)closeDatabase:(void *)a3 shouldSave:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    uint64_t v11 = "BADatabaseClose";
    __int16 v12 = 2114;
    BOOL v13 = a3;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, shouldSave: %d)", (uint8_t *)&v10, 0x1Cu);
  }
  int v7 = a3;
  char v8 = [v7 maintainsSyncMetadata];
  if (v4)
  {
    if ((v8 & 1) == 0) {
      [v7 commitSyncTransaction];
    }
    [v7 _restoreMissingSpecialBookmarksWithChangeNotification:0];
    [v7 _postBookmarksDidReloadNotificationAndStartReadingListFetcherIfChangesWereMade];
  }
  else if ((v8 & 1) == 0)
  {
    [v7 rollbackSyncTransaction];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [(id)objc_opt_class() unlockSync];
    }
  }
  __int16 v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    uint64_t v11 = "BADatabaseClose";
    _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v10, 0xCu);
  }
}

- (__CFData)copySyncDataWithDatabase:(void *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    uint64_t v11 = "BADatabaseCopySyncData";
    __int16 v12 = 2114;
    BOOL v13 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v10, 0x16u);
  }
  v5 = a3;
  v6 = [v5 syncDataForKey:@"BASyncData"];
  int v7 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v6)
    {
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
      char v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v8 = @"(null)";
    }
    int v10 = 136315394;
    uint64_t v11 = "BADatabaseCopySyncData";
    __int16 v12 = 2114;
    BOOL v13 = v8;
    _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "<- %s -> Return data of size: %{public}@", (uint8_t *)&v10, 0x16u);
    if (v6) {
  }
    }
  return (__CFData *)v6;
}

- (void)setSyncData:(__CFData *)a3 database:(void *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v6 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a3)
    {
      int v7 = [NSNumber numberWithLong:CFDataGetLength(a3)];
    }
    else
    {
      int v7 = @"(null)";
    }
    int v9 = 136315650;
    int v10 = "BADatabaseSetSyncData";
    __int16 v11 = 2114;
    __int16 v12 = a4;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, data size: %{public}@)", (uint8_t *)&v9, 0x20u);
    if (a3) {
  }
    }
  [a4 setSyncData:a3 forKey:@"BASyncData"];
  char v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    int v10 = "BADatabaseSetSyncData";
    _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v9, 0xCu);
  }
}

- (void)clearAllSyncDataWithDatabase:(void *)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    int v7 = "BADatabaseClearAllSyncData";
    __int16 v8 = 2114;
    int v9 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v6, 0x16u);
  }
  [a3 _clearAllSyncData];
  v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    int v7 = "BADatabaseClearAllSyncData";
    _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v6, 0xCu);
  }
}

- (__CFArray)copyChangesWithDatabase:(void *)a3 changeToken:(const void *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    uint64_t v14 = "BADatabaseCopyChanges";
    __int16 v15 = 2114;
    uint64_t v16 = a3;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v13, 0x16u);
  }
  int v7 = a3;
  __int16 v8 = [v7 changeList];
  int v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "currentRecordGeneration"));

  id v10 = v9;
  *a4 = v10;
  __int16 v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    uint64_t v14 = "BADatabaseCopyChanges";
    __int16 v15 = 2114;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    id v18 = v10;
    _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "<- %s -> %{public}@, %{public}@", (uint8_t *)&v13, 0x20u);
  }

  return v8;
}

- (void)clearChangesWithChangeToken:(void *)a3 database:(void *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v26 = 136315650;
    v27 = "BADatabaseClearChangesForToken";
    __int16 v28 = 2114;
    v29 = a4;
    __int16 v30 = 2114;
    v31 = a3;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, %{public}@)", (uint8_t *)&v26, 0x20u);
  }
  int v7 = a4;
  int v8 = [a3 intValue];
  if ([v7 currentRecordGeneration] != v8)
  {
    int v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[WBBookmarkDBAccess clearChangesWithChangeToken:database:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  if (([v7 _clearChangeList] & 1) == 0)
  {
    __int16 v17 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[WBBookmarkDBAccess clearChangesWithChangeToken:database:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  v25 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    int v26 = 136315138;
    v27 = "BADatabaseClearChangesForToken";
    _os_log_impl(&dword_21C043000, v25, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v26, 0xCu);
  }
}

- (void)removeItemWithServerId:(__CFString *)a3 database:(void *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = v6;
    int v8 = [(__CFString *)a3 wb_stringByRedactingBookmarkDAVServerID];
    int v29 = 136315650;
    *(void *)__int16 v30 = "BADatabaseRemoveItemWithServerId";
    *(_WORD *)&v30[8] = 2114;
    *(void *)&v30[10] = a4;
    *(_WORD *)&v30[18] = 2114;
    v31 = v8;
    _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, %{public}@)", (uint8_t *)&v29, 0x20u);
  }
  if (a3)
  {
    int v9 = a4;
    uint64_t v10 = [v9 bookmarkWithServerID:a3 excludeDeletedBookmarks:0];
    uint64_t v11 = v10;
    if (v10)
    {
      if ([v10 isReadingListItem])
      {
        uint64_t v12 = [v11 UUID];
        [v9 clearReadingListArchiveWithUUID:v12];
      }
      if ([v11 isReadingListFolder]) {
        [v9 clearAllReadingListArchives];
      }
      uint64_t v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = v13;
        int v15 = [v11 identifier];
        uint64_t v16 = [(__CFString *)a3 wb_stringByRedactingBookmarkDAVServerID];
        int v17 = [v11 parentID];
        int v29 = 67109634;
        *(_DWORD *)__int16 v30 = v15;
        *(_WORD *)&v30[4] = 2114;
        *(void *)&v30[6] = v16;
        *(_WORD *)&v30[14] = 1024;
        *(_DWORD *)&v30[16] = v17;
        _os_log_impl(&dword_21C043000, v14, OS_LOG_TYPE_INFO, "Deleting bookmark with ID %d and serverID %{public}@ from parent with ID %d", (uint8_t *)&v29, 0x18u);
      }
      [v9 deleteBookmark:v11 leaveTombstone:0];
      uint64_t v18 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        goto LABEL_22;
      }
      int v29 = 136315138;
      *(void *)__int16 v30 = "BADatabaseRemoveItemWithServerId";
    }
    else
    {
      __int16 v28 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        -[WBBookmarkDBAccess removeItemWithServerId:database:](v28);
      }
      uint64_t v18 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        goto LABEL_22;
      }
      int v29 = 136315138;
      *(void *)__int16 v30 = "BADatabaseRemoveItemWithServerId";
    }
    _os_log_impl(&dword_21C043000, v18, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v29, 0xCu);
LABEL_22:

    return;
  }
  uint64_t v19 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
    -[WBBookmarkDBAccess removeItemWithServerId:database:](v19, v20, v21, v22, v23, v24, v25, v26);
  }
  v27 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    int v29 = 136315138;
    *(void *)__int16 v30 = "BADatabaseRemoveItemWithServerId";
    _os_log_impl(&dword_21C043000, v27, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v29, 0xCu);
  }
}

- (void)beginMergingChangesWithDatabase:(void *)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    int v7 = "BADatabaseBeginMergingChanges";
    __int16 v8 = 2114;
    int v9 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v6, 0x16u);
  }
  [a3 _setMergeMode:1];
  v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    int v7 = "BADatabaseBeginMergingChanges";
    _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v6, 0xCu);
  }
}

- (void)finishMergingChangesWithDatabase:(void *)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    int v7 = "BADatabaseFinishMergingChanges";
    __int16 v8 = 2114;
    int v9 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v6, 0x16u);
  }
  [a3 _setMergeMode:0];
  v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    int v7 = "BADatabaseFinishMergingChanges";
    _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v6, 0xCu);
  }
}

- (id)localIDsOfInterestForDiagnosticsWithDatabase:(void *)a3
{
  return 0;
}

- (__CFString)copyServerIdWithItem:(void *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    uint64_t v13 = "BAItemCopyServerId";
    __int16 v14 = 2114;
    int v15 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@)", (uint8_t *)&v12, 0x16u);
  }
  v5 = [a3 bookmark];
  int v6 = [v5 serverID];
  int v7 = (__CFString *)[v6 copy];

  __int16 v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = v8;
    uint64_t v10 = [(__CFString *)v7 wb_stringByRedactingBookmarkDAVServerID];
    int v12 = 136315394;
    uint64_t v13 = "BAItemCopyServerId";
    __int16 v14 = 2114;
    int v15 = v10;
    _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v12, 0x16u);
  }
  return v7;
}

- (void)setServerId:(__CFString *)a3 item:(void *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = v6;
    __int16 v8 = [(__CFString *)a3 wb_stringByRedactingBookmarkDAVServerID];
    int v14 = 136315650;
    int v15 = "BAItemSetServerId";
    __int16 v16 = 2114;
    int v17 = a4;
    __int16 v18 = 2114;
    uint64_t v19 = v8;
    _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@, %{public}@)", (uint8_t *)&v14, 0x20u);
  }
  int v9 = a4;
  uint64_t v10 = [v9 bookmark];
  if ([v10 isInserted])
  {
    uint64_t v11 = [v9 collection];
    int v12 = [v9 bookmark];
    [v11 setServerID:a3 forBookmark:v12];
  }
  else
  {
    [v10 setServerID:a3];
  }
  uint64_t v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    int v15 = "BAItemSetServerId";
    _os_log_impl(&dword_21C043000, v13, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v14, 0xCu);
  }
}

- (__CFString)copyParentServerIdWithItem:(void *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    __int16 v16 = "BAItemCopyParentServerId";
    __int16 v17 = 2114;
    __int16 v18 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@)", (uint8_t *)&v15, 0x16u);
  }
  v5 = a3;
  int v6 = [v5 bookmark];
  uint64_t v7 = [v6 parentID];

  __int16 v8 = [v5 collection];

  int v9 = [v8 serverIDForBookmarkID:v7];
  uint64_t v10 = (__CFString *)[v9 copy];

  uint64_t v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = v11;
    uint64_t v13 = [(__CFString *)v10 wb_stringByRedactingBookmarkDAVServerID];
    int v15 = 136315394;
    __int16 v16 = "BAItemCopyParentServerId";
    __int16 v17 = 2114;
    __int16 v18 = v13;
    _os_log_impl(&dword_21C043000, v12, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v15, 0x16u);
  }
  return v10;
}

- (__CFString)copySyncKeyWithItem:(void *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    uint64_t v11 = "BAItemCopySyncKey";
    __int16 v12 = 2114;
    uint64_t v13 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@)", (uint8_t *)&v10, 0x16u);
  }
  v5 = [a3 bookmark];
  int v6 = [v5 syncKey];
  uint64_t v7 = (__CFString *)[v6 copy];

  __int16 v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    uint64_t v11 = "BAItemCopySyncKey";
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "<- %s -> syncKey: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  return v7;
}

- (void)setSyncKey:(__CFString *)a3 item:(void *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    __int16 v12 = "BAItemSetSyncKey";
    __int16 v13 = 2114;
    uint64_t v14 = a4;
    __int16 v15 = 2114;
    __int16 v16 = a3;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@, syncKey: %{public}@)", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v7 = a4;
  __int16 v8 = [v7 bookmark];
  if ([v8 isInserted])
  {
    int v9 = [v7 collection];
    [v9 _setSyncKey:a3 forBookmark:v8];
  }
  else
  {
    [v8 setSyncKey:a3];
  }
  int v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    __int16 v12 = "BAItemSetSyncKey";
    _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v11, 0xCu);
  }
}

- (__CFData)copySyncDataWithItem:(void *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    __int16 v13 = "BAItemCopySyncData";
    __int16 v14 = 2114;
    __int16 v15 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@)", (uint8_t *)&v12, 0x16u);
  }
  v5 = a3;
  int v6 = [v5 bookmark];
  uint64_t v7 = [v6 syncData];
  __int16 v8 = (void *)[v7 copy];

  int v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (v8)
    {
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
      int v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v10 = @"(null)";
    }
    int v12 = 136315394;
    __int16 v13 = "BAItemCopySyncData";
    __int16 v14 = 2114;
    __int16 v15 = v10;
    _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "<- %s -> Return data of size: %{public}@", (uint8_t *)&v12, 0x16u);
    if (v8) {
  }
    }
  return (__CFData *)v8;
}

- (void)setSyncData:(__CFData *)a3 item:(void *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v6 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a3)
    {
      uint64_t v7 = [NSNumber numberWithLong:CFDataGetLength(a3)];
    }
    else
    {
      uint64_t v7 = @"(null)";
    }
    int v12 = 136315650;
    __int16 v13 = "BAItemSetSyncData";
    __int16 v14 = 2114;
    __int16 v15 = a4;
    __int16 v16 = 2114;
    uint64_t v17 = v7;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@, data of size: %{public}@)", (uint8_t *)&v12, 0x20u);
    if (a3) {
  }
    }
  __int16 v8 = a4;
  int v9 = [v8 bookmark];
  if ([v9 isInserted])
  {
    int v10 = [v8 collection];
    [v10 _setSyncData:a3 forBookmark:v9];
  }
  else
  {
    [v9 setSyncData:a3];
  }
  int v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    __int16 v13 = "BAItemSetSyncData";
    _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v12, 0xCu);
  }
}

- (int)changeTypeForChange:(void *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    int v9 = "BAChangeGetChangeType";
    __int16 v10 = 2114;
    int v11 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(change: %{public}@)", (uint8_t *)&v8, 0x16u);
  }
  int v5 = [a3 changeType];
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    int v9 = "BAChangeGetChangeType";
    __int16 v10 = 1024;
    LODWORD(v11) = v5;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "<- %s -> %d", (uint8_t *)&v8, 0x12u);
  }
  return v5;
}

- (void)copyChangedItemWithChange:(void *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    __int16 v14 = "BAChangeCopyChangedItem";
    __int16 v15 = 2114;
    __int16 v16 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(change: %{public}@)", (uint8_t *)&v13, 0x16u);
  }
  int v5 = a3;
  if ([v5 changeType] == 2)
  {
    int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      __int16 v14 = "BAChangeCopyChangedItem";
      _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "<- %s -> (null)", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v7 = 0;
  }
  else
  {
    int v8 = [BABookmarkItem alloc];
    int v9 = [v5 collection];
    __int16 v10 = [v5 bookmark];
    uint64_t v7 = [(BABookmarkItem *)v8 initWithBookmarkCollection:v9 bookmark:v10];

    int v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      __int16 v14 = "BAChangeCopyChangedItem";
      __int16 v15 = 2114;
      __int16 v16 = v7;
      _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }

  return v7;
}

- (__CFString)copyServerIdWithChange:(void *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "BAChangeCopyServerId";
    __int16 v13 = 2114;
    __int16 v14 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(change: %{public}@)", (uint8_t *)&v11, 0x16u);
  }
  int v5 = [a3 bookmark];
  int v6 = [v5 serverID];

  uint64_t v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = v7;
    int v9 = [(__CFString *)v6 wb_stringByRedactingBookmarkDAVServerID];
    int v11 = 136315394;
    uint64_t v12 = "BAChangeCopyServerId";
    __int16 v13 = 2114;
    __int16 v14 = v9;
    _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v11, 0x16u);
  }
  return v6;
}

- (BOOL)changeIsDAVMoveChange:(void *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    __int16 v10 = "BAChangeIsMove";
    __int16 v11 = 2114;
    uint64_t v12 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(%{public}@)", (uint8_t *)&v9, 0x16u);
  }
  int v5 = [a3 bookmark];
  int v6 = [v5 attributesMarkedAsModified:64];

  uint64_t v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    __int16 v10 = "BAChangeIsMove";
    __int16 v11 = 1024;
    LODWORD(v12) = v6;
    _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "<- %s -> %d", (uint8_t *)&v9, 0x12u);
  }
  return v6;
}

- (int64_t)itemTypeForChange:(void *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    __int16 v10 = "CKBAChangeGetItemType";
    __int16 v11 = 2114;
    int64_t v12 = (int64_t)a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(change: %{public}@)", (uint8_t *)&v9, 0x16u);
  }
  int v5 = [a3 bookmark];
  int64_t v6 = [v5 isFolder];

  uint64_t v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    __int16 v10 = "CKBAChangeGetItemType";
    __int16 v11 = 2048;
    int64_t v12 = v6;
    _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "<- %s -> %ld", (uint8_t *)&v9, 0x16u);
  }
  return v6;
}

- (int64_t)folderTypeForChange:(void *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    __int16 v11 = "CKBAChangeGetFolder";
    __int16 v12 = 2114;
    int64_t v13 = (int64_t)a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(folder: %{public}@)", (uint8_t *)&v10, 0x16u);
  }
  int v5 = [a3 bookmark];
  int v6 = [v5 specialID];
  switch(v6)
  {
    case 4:
      int64_t v7 = 0;
      break;
    case 1:
      int64_t v7 = 1;
      break;
    case 2:
      int64_t v7 = 2;
      break;
    case 3:
      int64_t v7 = 3;
      break;
    default:
      int64_t v7 = 0;
      break;
  }

  int v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    __int16 v11 = "CKBAChangeGetFolder";
    __int16 v12 = 2048;
    int64_t v13 = v7;
    _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "<- %s -> %ld", (uint8_t *)&v10, 0x16u);
  }
  return v7;
}

- (int64_t)bookmarkTypeForChange:(void *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    int v9 = "CKBAChangeGetBookmarkType";
    __int16 v10 = 2114;
    __int16 v11 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(bookmark: %{public}@)", (uint8_t *)&v8, 0x16u);
  }
  int v5 = [a3 bookmark];
  int64_t v6 = CKBABookmarkTypeForBookmark(v5);

  return v6;
}

- (id)copyDeviceIdentifier
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    __int16 v11 = "-[WBBookmarkDBAccess copyDeviceIdentifier]";
    _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_INFO, "-> %s()", (uint8_t *)&v10, 0xCu);
  }
  BOOL v4 = +[WebBookmarkCollection deviceIdentifierForCloudKitWithCollectionType:self->_collectionType generateIfNeeded:1];
  int v5 = [v4 UUID];
  int64_t v6 = [v5 UUIDString];

  int64_t v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[WBBookmarkDBAccess copyDeviceIdentifier]();
  }
  int v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    __int16 v11 = "-[WBBookmarkDBAccess copyDeviceIdentifier]";
    _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted", (uint8_t *)&v10, 0xCu);
  }
  return v6;
}

- (void)resetDeviceIdentifier
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    int64_t v7 = "-[WBBookmarkDBAccess resetDeviceIdentifier]";
    _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_INFO, "-> %s()", (uint8_t *)&v6, 0xCu);
  }
  +[WebBookmarkCollection resetDeviceIdentifierForCloudKitWithCollectionType:self->_collectionType];
  id v4 = +[WebBookmarkCollection deviceIdentifierForCloudKitWithCollectionType:self->_collectionType generateIfNeeded:1];
  int v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    int64_t v7 = "-[WBBookmarkDBAccess resetDeviceIdentifier]";
    _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)performMaintenanceOnDatabase:(void *)a3 afterVersion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    uint64_t v15 = "CKBADatabasePerformMaintenanceAfterVersion";
    __int16 v16 = 2114;
    uint64_t v17 = a3;
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, start version: %{public}@)", (uint8_t *)&v14, 0x20u);
  }
  int64_t v7 = a3;
  char v8 = objc_msgSend(@"605.2.2", "safari_isVersionStringGreaterThanVersionString:", v5);
  int v9 = objc_msgSend(v5, "safari_isVersionStringBetweenVersionString:andVersionString:", @"606", @"606.1.16");
  if ((v8 & 1) != 0 || v9) {
    int v10 = [v7 fixCachedNumberOfChildrenIfNeeded];
  }
  else {
    int v10 = 0;
  }
  __int16 v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = "NO";
    if (v10) {
      uint64_t v12 = "YES";
    }
    int v14 = 136315394;
    uint64_t v15 = "CKBADatabasePerformMaintenanceAfterVersion";
    __int16 v16 = 2080;
    uint64_t v17 = (void *)v12;
    _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "<- %s -> %s", (uint8_t *)&v14, 0x16u);
  }

  return v10;
}

- (int64_t)localCloudKitMigrationState:(void *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    int v9 = "CKBADatabaseGetLocalCloudKitMigrationState";
    __int16 v10 = 2114;
    int64_t v11 = (int64_t)a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v8, 0x16u);
  }
  int64_t v5 = [a3 localMigrationState];
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    int v9 = "CKBADatabaseGetLocalCloudKitMigrationState";
    __int16 v10 = 2048;
    int64_t v11 = v5;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "<- %s -> %lld", (uint8_t *)&v8, 0x16u);
  }
  return v5;
}

- (void)setLocalCloudKitMigrationState:(int64_t)a3 database:(void *)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    int v9 = "CKBADatabaseSetLocalCloudKitMigrationState";
    __int16 v10 = 2114;
    int64_t v11 = a4;
    __int16 v12 = 2048;
    int64_t v13 = a3;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, migration state: %lld)", (uint8_t *)&v8, 0x20u);
  }
  [a4 setLocalMigrationState:a3 generateDeviceIdentifierIfNeeded:1];
  int64_t v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    int v9 = "CKBADatabaseSetLocalCloudKitMigrationState";
    _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v8, 0xCu);
  }
}

- (id)copyUsernameAccountHashWithDatabase:(void *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    int v9 = "CKBADatabaseCopyUsernameAccountHash";
    __int16 v10 = 2114;
    int64_t v11 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v8, 0x16u);
  }
  int64_t v5 = [a3 deprecatedUsernameAccountHash];
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    int v9 = "CKBADatabaseCopyUsernameAccountHash";
    __int16 v10 = 2114;
    int64_t v11 = v5;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return v5;
}

- (id)copyAccountHashWithDatabase:(void *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    int v9 = "CKBADatabaseCopyAccountHash";
    __int16 v10 = 2114;
    int64_t v11 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v8, 0x16u);
  }
  int64_t v5 = [a3 accountHash];
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    int v9 = "CKBADatabaseCopyAccountHash";
    __int16 v10 = 2114;
    int64_t v11 = v5;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return v5;
}

- (void)setAccountHash:(id)a3 database:(void *)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    int v9 = "CKBADatabaseSetAccountHash";
    __int16 v10 = 2114;
    int64_t v11 = a4;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, account hash: %{public}@)", (uint8_t *)&v8, 0x20u);
  }
  [a4 updateAccountHash:v5];
  int64_t v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    int v9 = "CKBADatabaseSetAccountHash";
    _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v8, 0xCu);
  }
}

- (id)copyChangeTokenWithDatabase:(void *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    int64_t v11 = "CKBADatabaseCopyChangeToken";
    __int16 v12 = 2114;
    id v13 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v10, 0x16u);
  }
  id v5 = NSNumber;
  int v6 = a3;
  int64_t v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "currentRecordGeneration"));

  int v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    int64_t v11 = "CKBADatabaseCopyChangeToken";
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v10, 0x16u);
  }
  return v7;
}

- (void)copyItemWithLocalID:(id)a3 database:(void *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315650;
    uint64_t v17 = "CKBADatabaseCopyItemWithLocalID";
    __int16 v18 = 2114;
    id v19 = a4;
    __int16 v20 = 2114;
    id v21 = v5;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, %{public}@)", (uint8_t *)&v16, 0x20u);
  }
  if (!v5)
  {
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v5 intValue];
LABEL_7:
    int v8 = a4;
    int v9 = [v8 bookmarkWithID:v7];
    if (v9)
    {
      int v10 = [[BABookmarkItem alloc] initWithBookmarkCollection:v8 bookmark:v9];
      int64_t v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v16 = 136315394;
        uint64_t v17 = "CKBADatabaseCopyItemWithLocalID";
        __int16 v18 = 2114;
        id v19 = v10;
        _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v16, 0x16u);
      }
    }
    else
    {
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v16 = 136315138;
        uint64_t v17 = "CKBADatabaseCopyItemWithLocalID";
        _os_log_impl(&dword_21C043000, v14, OS_LOG_TYPE_INFO, "<- %s -> (null)", (uint8_t *)&v16, 0xCu);
      }
      int v10 = 0;
    }

    goto LABEL_19;
  }
  __int16 v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[WBBookmarkDBAccess copyItemWithLocalID:database:](v12);
  }
  id v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315138;
    uint64_t v17 = "CKBADatabaseCopyItemWithLocalID";
    _os_log_impl(&dword_21C043000, v13, OS_LOG_TYPE_INFO, "<- %s -> (null)", (uint8_t *)&v16, 0xCu);
  }
  int v10 = 0;
LABEL_19:

  return v10;
}

- (id)copyLocalIDsInFolderWithLocalID:(id)a3 database:(void *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315650;
    uint64_t v17 = "CKBADatabaseCopyLocalIDsInFolderWithLocalID";
    __int16 v18 = 2114;
    id v19 = a4;
    __int16 v20 = 2114;
    id v21 = v5;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, %{public}@)", (uint8_t *)&v16, 0x20u);
  }
  if (!v5)
  {
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v5 intValue];
LABEL_7:
    int v8 = [a4 syncableBookmarksIDsInFolderWithBookmarkID:v7];
    int v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    int v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v16 = 136315394;
        uint64_t v17 = "CKBADatabaseCopyLocalIDsInFolderWithLocalID";
        __int16 v18 = 2114;
        id v19 = v8;
        _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v16, 0x16u);
      }
      id v11 = v8;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[WBBookmarkDBAccess copyLocalIDsInFolderWithLocalID:database:]();
      }
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v16 = 136315138;
        uint64_t v17 = "CKBADatabaseCopyLocalIDsInFolderWithLocalID";
        _os_log_impl(&dword_21C043000, v14, OS_LOG_TYPE_INFO, "<- %s -> (null)", (uint8_t *)&v16, 0xCu);
      }
    }

    goto LABEL_21;
  }
  __int16 v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[WBBookmarkDBAccess copyLocalIDsInFolderWithLocalID:database:](v12);
  }
  id v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315138;
    uint64_t v17 = "CKBADatabaseCopyLocalIDsInFolderWithLocalID";
    _os_log_impl(&dword_21C043000, v13, OS_LOG_TYPE_INFO, "<- %s -> (null)", (uint8_t *)&v16, 0xCu);
  }
  int v8 = [MEMORY[0x263EFFA08] set];
LABEL_21:

  return v8;
}

- (void)copyItemWithServerId:(id)a3 database:(void *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    uint64_t v14 = "CKBADatabaseCopyItemWithServerId";
    __int16 v15 = 2114;
    int v16 = a4;
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, %{public}@)", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v7 = a4;
  int v8 = [v7 bookmarkWithServerID:v5 excludeDeletedBookmarks:1];
  if (v8)
  {
    int v9 = [[BABookmarkItem alloc] initWithBookmarkCollection:v7 bookmark:v8];
    int v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      uint64_t v14 = "CKBADatabaseCopyItemWithServerId";
      __int16 v15 = 2114;
      int v16 = v9;
      _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    id v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      uint64_t v14 = "CKBADatabaseCopyItemWithServerId";
      _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "<- %s -> (null)", (uint8_t *)&v13, 0xCu);
    }
    int v9 = 0;
  }

  return v9;
}

- (BOOL)addItem:(void *)a3 underFolderWithServerId:(id)a4 database:(void *)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a4;
  int v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v33 = 136315906;
    v34 = "CKBADatabaseAddItemUnderFolderWithServerId";
    __int16 v35 = 2114;
    v36 = a5;
    __int16 v37 = 2114;
    v38 = a3;
    __int16 v39 = 2114;
    id v40 = v7;
    _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, item: %{public}@, parentSyncServerId: %{public}@)", (uint8_t *)&v33, 0x2Au);
  }
  int v9 = a3;
  int v10 = [v9 collection];
  id v11 = [v9 bookmark];
  uint64_t v12 = [v10 bookmarkIDForServerID:v7 excludeDeletedBookmarks:1];
  if (v12 == 0x7FFFFFFF)
  {
    int v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v33 = 136315394;
      v34 = "saveBookmarkUnderFolderWithServerId";
      __int16 v35 = 2114;
      v36 = v7;
      _os_log_impl(&dword_21C043000, v13, OS_LOG_TYPE_INFO, "@@ %s: Parent server ID %{public}@ does not point to any item in the local database", (uint8_t *)&v33, 0x16u);
    }
    goto LABEL_6;
  }
  uint64_t v15 = v12;
  if ([v10 isMerging])
  {
    if ([v11 specialID])
    {
      int v16 = objc_msgSend(v10, "bookmarkWithSpecialID:", objc_msgSend(v11, "specialID"));
      if (v16)
      {
LABEL_10:
        [v10 _mergeBookmark:v11 withOriginalBookmark:v16 prioritizeOriginalBookmarkAttributes:0 generateChangesIfNeeded:1];
        objc_msgSend(v10, "_markBookmarkID:added:", objc_msgSend(v16, "identifier"), 0);
        __int16 v17 = [v11 serverID];
        [v10 setServerID:v17 forBookmark:v16];

        id v18 = [v11 syncData];
        [v10 _setSyncData:v18 forBookmark:v16];

        uint64_t v19 = [v11 syncKey];
        [v10 _setSyncKey:v19 forBookmark:v16];

        [v9 setBookmark:v16];
        __int16 v20 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[WBBookmarkDBAccess addItem:underFolderWithServerId:database:]((uint64_t)v16, v20);
        }

        BOOL v14 = 1;
        goto LABEL_27;
      }
    }
    else
    {
      int v21 = [v11 isFolder];
      uint64_t v22 = [v11 title];
      if (v21)
      {
        int v16 = objc_msgSend(v10, "_mergeCandidateFolderWithTitle:parent:mergeMode:", v22, v15, objc_msgSend(v10, "_mergeMode"));
      }
      else
      {
        uint64_t v23 = [v11 address];
        int v16 = objc_msgSend(v10, "_mergeCandidateBookmarkWithTitle:address:parent:mergeMode:", v22, v23, v15, objc_msgSend(v10, "_mergeMode"));
      }
      if (v16) {
        goto LABEL_10;
      }
    }
  }
  if (([v11 isInserted] & 1) == 0)
  {
    [v11 _setParentID:v15];
    objc_msgSend(v10, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v11, objc_msgSend(v11, "specialID"), 0);
    objc_msgSend(v10, "_markBookmarkID:added:", objc_msgSend(v11, "identifier"), 0);
    uint64_t v26 = [v11 serverID];
    [v10 setServerID:v26 forBookmark:v11];

    v27 = [v11 syncData];
    [v10 _setSyncData:v27 forBookmark:v11];

    __int16 v28 = [v11 syncKey];
    [v10 _setSyncKey:v28 forBookmark:v11];

    uint64_t v29 = [v11 identifier];
    __int16 v30 = [v11 isSelectedFavoritesFolder];
    objc_msgSend(v10, "updateSelectedFavoritesFolderWithBookmarkID:wasFavoritesFolder:isFavoritesFolder:", v29, 0, objc_msgSend(v30, "BOOLValue"));

    uint64_t v24 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    BOOL v14 = 1;
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
    int v33 = 136315650;
    v34 = "saveBookmarkUnderFolderWithServerId";
    __int16 v35 = 2114;
    v36 = v9;
    __int16 v37 = 2114;
    v38 = v7;
    uint64_t v25 = "@@ %s: Record %{public}@ was insert in parent record with server ID %{public}@";
    goto LABEL_26;
  }
  if ([v11 parentID] == v15)
  {
    uint64_t v24 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    BOOL v14 = 1;
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
    int v33 = 136315650;
    v34 = "saveBookmarkUnderFolderWithServerId";
    __int16 v35 = 2114;
    v36 = v9;
    __int16 v37 = 2114;
    v38 = v7;
    uint64_t v25 = "@@ %s: Record %{public}@ is already inside parent record with server ID %{public}@";
    goto LABEL_26;
  }
  if (![v10 _moveBookmark:v11 toFolderWithID:v15 detectCycles:1])
  {
LABEL_6:
    BOOL v14 = 0;
    goto LABEL_27;
  }
  uint64_t v24 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  BOOL v14 = 1;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    int v33 = 136315650;
    v34 = "saveBookmarkUnderFolderWithServerId";
    __int16 v35 = 2114;
    v36 = v9;
    __int16 v37 = 2114;
    v38 = v7;
    uint64_t v25 = "@@ %s: Record %{public}@ did move to parent record with server ID %{public}@";
LABEL_26:
    _os_log_impl(&dword_21C043000, v24, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v33, 0x20u);
  }
LABEL_27:

  v31 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    int v33 = 136315394;
    v34 = "CKBADatabaseAddItemUnderFolderWithServerId";
    __int16 v35 = 1024;
    LODWORD(v36) = v14;
    _os_log_impl(&dword_21C043000, v31, OS_LOG_TYPE_INFO, "<- %s -> %d", (uint8_t *)&v33, 0x12u);
  }

  return v14;
}

- (void)performDeduplicationWithDatabase:(void *)a3 mode:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    int v9 = "CKBADatabasePerformDeduplication";
    __int16 v10 = 2114;
    id v11 = a3;
    __int16 v12 = 2048;
    int64_t v13 = a4;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, mode: %ld)", (uint8_t *)&v8, 0x20u);
  }
  [a3 _deduplicateBookmarksForSyncingAndTrackChanges:a4 == 2 considerBookmarksWithSyncDataAsUnique:a4 == 1];
  id v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    int v9 = "CKBADatabasePerformDeduplication";
    _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v8, 0xCu);
  }
}

- (id)copyServerIdsInFolderWithServerId:(id)a3 database:(void *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    int v8 = objc_msgSend(v5, "wb_stringByRedactingBookmarkDAVServerID");
    *(_DWORD *)buf = 136315650;
    uint64_t v25 = "CKBADatabaseCopyServerIdsInFolderWithServerId";
    __int16 v26 = 2114;
    v27 = a4;
    __int16 v28 = 2114;
    uint64_t v29 = v8;
    _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, %{public}@)", buf, 0x20u);
  }
  int v9 = [a4 serverIDsInFolderWithServerID:v5 excludeDeletedBookmarks:1];
  __int16 v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = v9;
    __int16 v12 = [MEMORY[0x263EFF9C0] set];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:buf count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "wb_stringByRedactingBookmarkDAVServerID", (void)v20);
          [v12 addObject:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:buf count:16];
      }
      while (v15);
    }

    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "CKBADatabaseCopyServerIdsInFolderWithServerId";
    __int16 v26 = 2114;
    v27 = v12;
    _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", buf, 0x16u);
  }
  return v9;
}

- (void)setChildrenOrder:(id)a3 forFolderWithServerId:(id)a4 database:(void *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = v9;
    id v11 = objc_msgSend(v8, "wb_stringByRedactingBookmarkDAVServerID");
    __int16 v12 = objc_msgSend(v7, "safari_mapObjectsUsingBlock:", &__block_literal_global_1);
    int v14 = 136315906;
    uint64_t v15 = "CKBADatabaseSetChildrenOrderForFolderWithServerId";
    __int16 v16 = 2114;
    uint64_t v17 = a5;
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    __int16 v20 = 2114;
    long long v21 = v12;
    _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, %{public}@, %{public}@)", (uint8_t *)&v14, 0x2Au);
  }
  [a5 _orderChildrenWithServerIDs:v7 inFolderWithServerID:v8 excludeDeletedBookmarks:1];
  id v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    uint64_t v15 = "CKBADatabaseSetChildrenOrderForFolderWithServerId";
    _os_log_impl(&dword_21C043000, v13, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v14, 0xCu);
  }
}

- (id)copyServerIdInFolderBeforeServerId:(id)a3 database:(void *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    id v11 = "CKBADatabaseCopyServerIdInFolderBeforeServerId";
    __int16 v12 = 2114;
    id v13 = a4;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, request before targetItemId: %{public}@)", (uint8_t *)&v10, 0x20u);
  }
  id v7 = [a4 _serverIDBeforeServerID:v5];
  id v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    id v11 = "CKBADatabaseCopyServerIdInFolderBeforeServerId";
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (id)copyServerIdInFolderAfterServerId:(id)a3 database:(void *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    id v11 = "CKBADatabaseCopyServerIdInFolderAfterServerId";
    __int16 v12 = 2114;
    id v13 = a4;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, request after targetItemId: %{public}@)", (uint8_t *)&v10, 0x20u);
  }
  id v7 = [a4 _serverIDAfterServerID:v5];
  id v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    id v11 = "CKBADatabaseCopyServerIdInFolderAfterServerId";
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (id)copyFirstServerIdInFolderWithServerId:(id)a3 database:(void *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    id v11 = "CKBADatabaseCopyFirstServerIdInFolderWithServerId";
    __int16 v12 = 2114;
    id v13 = a4;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, folderServerId: %{public}@)", (uint8_t *)&v10, 0x20u);
  }
  id v7 = [a4 _firstServerIDInFolderWithServerID:v5];
  id v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    id v11 = "CKBADatabaseCopyFirstServerIdInFolderWithServerId";
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (id)copyLastServerIdInFolderWithServerId:(id)a3 database:(void *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    id v11 = "CKBADatabaseCopyLastServerIdInFolderWithServerId";
    __int16 v12 = 2114;
    id v13 = a4;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, folderServerId: %{public}@)", (uint8_t *)&v10, 0x20u);
  }
  id v7 = [a4 _lastServerIDInFolderWithServerID:v5];
  id v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    id v11 = "CKBADatabaseCopyLastServerIdInFolderWithServerId";
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (int64_t)itemTypeWithItem:(void *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    int v10 = "CKBAItemGetItemType";
    __int16 v11 = 2114;
    int64_t v12 = (int64_t)a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@)", (uint8_t *)&v9, 0x16u);
  }
  id v5 = [a3 bookmark];
  int64_t v6 = [v5 isFolder];

  id v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    int v10 = "CKBAItemGetItemType";
    __int16 v11 = 2048;
    int64_t v12 = v6;
    _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "<- %s -> %ld", (uint8_t *)&v9, 0x16u);
  }
  return v6;
}

- (BOOL)item:(void *)a3 isInFolderWithServerSyncId:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int64_t v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315650;
    __int16 v20 = "CKBAItemGetIsInFolderWithServerSyncId";
    __int16 v21 = 2114;
    uint64_t v22 = a3;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@, parentRecordName: %@)", (uint8_t *)&v19, 0x20u);
  }
  id v7 = a3;
  id v8 = [v7 bookmark];
  if ([v8 isInserted])
  {
    int v9 = [v7 collection];
    uint64_t v10 = [v8 parentID];
    if (v5 || v10)
    {
      if (v5)
      {
        __int16 v14 = [v9 serverIDForBookmarkID:v10];
        int v12 = [v14 isEqualToString:v5];
        id v15 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = "NO";
          if (v12) {
            uint64_t v16 = "YES";
          }
          int v19 = 136315394;
          __int16 v20 = "CKBAItemGetIsInFolderWithServerSyncId";
          __int16 v21 = 2080;
          uint64_t v22 = (void *)v16;
          _os_log_impl(&dword_21C043000, v15, OS_LOG_TYPE_INFO, "<- %s -> %s", (uint8_t *)&v19, 0x16u);
        }
      }
      else
      {
        uint64_t v17 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v19 = 136315138;
          __int16 v20 = "CKBAItemGetIsInFolderWithServerSyncId";
          _os_log_impl(&dword_21C043000, v17, OS_LOG_TYPE_INFO, "<- %s -> NO", (uint8_t *)&v19, 0xCu);
        }
        LOBYTE(v12) = 0;
      }
    }
    else
    {
      __int16 v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      LOBYTE(v12) = 1;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v19 = 136315138;
        __int16 v20 = "CKBAItemGetIsInFolderWithServerSyncId";
        _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "<- %s -> YES", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315138;
      __int16 v20 = "CKBAItemGetIsInFolderWithServerSyncId";
      _os_log_impl(&dword_21C043000, v13, OS_LOG_TYPE_INFO, "<- %s -> NO", (uint8_t *)&v19, 0xCu);
    }
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)item:(void *)a3 isEqualToItem:(void *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int64_t v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    uint64_t v13 = "CKBAItemIsEqualToItem";
    __int16 v14 = 2114;
    id v15 = a3;
    __int16 v16 = 2114;
    uint64_t v17 = a4;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(item1: %{public}@, item2: %{public}@)", (uint8_t *)&v12, 0x20u);
  }
  id v7 = [a3 bookmark];
  id v8 = [a4 bookmark];
  int v9 = [v7 isEqualToBookmark:v8];
  uint64_t v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    uint64_t v13 = "CKBAItemIsEqualToItem";
    __int16 v14 = 1024;
    LODWORD(v15) = v9;
    _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_INFO, "<- %s -> %d", (uint8_t *)&v12, 0x12u);
  }

  return v9;
}

- (int64_t)folderTypeWithFolder:(void *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    __int16 v11 = "CKBAFolderGetFolderType";
    __int16 v12 = 2114;
    int64_t v13 = (int64_t)a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(folder: %{public}@)", (uint8_t *)&v10, 0x16u);
  }
  id v5 = [a3 bookmark];
  int v6 = [v5 specialID];
  switch(v6)
  {
    case 4:
      int64_t v7 = 0;
      break;
    case 1:
      int64_t v7 = 1;
      break;
    case 2:
      int64_t v7 = 2;
      break;
    case 3:
      int64_t v7 = 3;
      break;
    default:
      int64_t v7 = 0;
      break;
  }

  id v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    __int16 v11 = "CKBAFolderGetFolderType";
    __int16 v12 = 2048;
    int64_t v13 = v7;
    _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "<- %s -> %ld", (uint8_t *)&v10, 0x16u);
  }
  return v7;
}

- (void)createFolderWithType:(int64_t)a3 database:(void *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    id v15 = "CKBADatabaseCreateFolder";
    __int16 v16 = 2114;
    uint64_t v17 = a4;
    __int16 v18 = 2048;
    int64_t v19 = a3;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, folder type: %lld)", (uint8_t *)&v14, 0x20u);
  }
  int64_t v7 = a4;
  id v8 = [WebBookmark alloc];
  int v9 = [v7 configuration];
  id v10 = -[WebBookmark initFolderWithParentID:collectionType:](v8, "initFolderWithParentID:collectionType:", 0, [v9 collectionType]);

  if ((unint64_t)(a3 - 1) <= 2 && *off_2643D9D38[a3 - 1]) {
    objc_msgSend(v10, "markSpecial:");
  }
  [v10 setSubtype:a3 == 4];
  __int16 v11 = [[BABookmarkItem alloc] initWithBookmarkCollection:v7 bookmark:v10];
  __int16 v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    id v15 = "CKBADatabaseCreateFolder";
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    _os_log_impl(&dword_21C043000, v12, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v14, 0x16u);
  }

  return v11;
}

- (int64_t)bookmarkTypeWithBookmark:(void *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    int v9 = "CKBABookmarkGetBookmarkType";
    __int16 v10 = 2114;
    __int16 v11 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(bookmark: %{public}@)", (uint8_t *)&v8, 0x16u);
  }
  id v5 = [a3 bookmark];
  int64_t v6 = CKBABookmarkTypeForBookmark(v5);

  return v6;
}

- (void)createBookmarkWithType:(int64_t)a3 database:(void *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int64_t v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315650;
    uint64_t v17 = "CKBADatabaseCreateBookmark";
    __int16 v18 = 2114;
    int64_t v19 = a4;
    __int16 v20 = 2048;
    int64_t v21 = a3;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, bookmark type: %lld)", (uint8_t *)&v16, 0x20u);
  }
  int64_t v7 = a4;
  switch(a3)
  {
    case 2:
      __int16 v11 = [WebBookmark alloc];
      int v9 = [v7 currentDeviceIdentifier];
      uint64_t v12 = [v7 configuration];
      __int16 v10 = -[WebBookmark initWithTitle:address:parentID:subtype:deviceIdentifier:collectionType:](v11, "initWithTitle:address:parentID:subtype:deviceIdentifier:collectionType:", &stru_26CC2ED50, &stru_26CC2ED50, 0, 1, v9, [v12 collectionType]);

      goto LABEL_8;
    case 1:
      __int16 v10 = [[WebBookmark alloc] initReadingListBookmarkWithTitle:&stru_26CC2ED50 address:&stru_26CC2ED50 previewText:&stru_26CC2ED50];
      break;
    case 0:
      int v8 = [WebBookmark alloc];
      int v9 = [v7 configuration];
      __int16 v10 = -[WebBookmark initWithTitle:address:collectionType:](v8, "initWithTitle:address:collectionType:", &stru_26CC2ED50, &stru_26CC2ED50, [v9 collectionType]);
LABEL_8:

      break;
    default:
      __int16 v10 = 0;
      break;
  }
  int64_t v13 = [[BABookmarkItem alloc] initWithBookmarkCollection:v7 bookmark:v10];
  int v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    uint64_t v17 = "CKBADatabaseCreateBookmark";
    __int16 v18 = 2114;
    int64_t v19 = v13;
    _os_log_impl(&dword_21C043000, v14, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v16, 0x16u);
  }

  return v13;
}

- (BOOL)changeIsMoveChange:(void *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    __int16 v10 = "CKBAChangeGetWasBookmarkMoved";
    __int16 v11 = 2114;
    uint64_t v12 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(change: %{public}@)", (uint8_t *)&v9, 0x16u);
  }
  id v5 = [a3 bookmark];
  if ([v5 attributesMarkedAsModified:64]) {
    int v6 = 1;
  }
  else {
    int v6 = [v5 attributesMarkedAsModified:4];
  }
  int64_t v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    __int16 v10 = "CKBAChangeGetWasBookmarkMoved";
    __int16 v11 = 1024;
    LODWORD(v12) = v6;
    _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "<- %s -> %d", (uint8_t *)&v9, 0x12u);
  }

  return v6;
}

- (id)copyDeletedBookmarkSyncDataWithChange:(void *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    int v14 = "CKBAChangeCopyDeletedBookmarkSyncData";
    __int16 v15 = 2114;
    int v16 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(change: %{public}@)", (uint8_t *)&v13, 0x16u);
  }
  id v5 = a3;
  if ([v5 changeType] == 2)
  {
    int v6 = [v5 bookmark];
    int64_t v7 = [v6 syncData];

    int v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = v8;
      uint64_t v10 = [v7 length];
      int v13 = 136315650;
      int v14 = "CKBAChangeCopyDeletedBookmarkSyncData";
      __int16 v15 = 2048;
      int v16 = v7;
      __int16 v17 = 2048;
      uint64_t v18 = v10;
      _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "<- %s -> syncData %p of size: %ld", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    __int16 v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      int v14 = "CKBAChangeCopyDeletedBookmarkSyncData";
      _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "<- %s -> (null)", (uint8_t *)&v13, 0xCu);
    }
    int64_t v7 = 0;
  }

  return v7;
}

- (void)setDeletedBookmarkSyncData:(id)a3 change:(void *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int64_t v7 = v6;
    int v21 = 136315906;
    uint64_t v22 = "CKBAChangeSetDeletedBookmarkSyncData";
    __int16 v23 = 2114;
    id v24 = a4;
    __int16 v25 = 2048;
    id v26 = v5;
    __int16 v27 = 2048;
    uint64_t v28 = [v5 length];
    _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "-> %s(change: %{public}@, syncData %p of size: %zd)", (uint8_t *)&v21, 0x2Au);
  }
  int v8 = a4;
  int v9 = [v8 bookmark];
  if ([v8 changeType] == 2)
  {
    if ([v9 isInserted])
    {
      uint64_t v10 = [v8 collection];
      [v10 _setSyncData:v5 forBookmark:v9];

      __int16 v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v21 = 136315138;
        uint64_t v22 = "CKBAChangeSetDeletedBookmarkSyncData";
LABEL_15:
        _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v21, 0xCu);
      }
    }
    else
    {
      int v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[WBBookmarkDBAccess setDeletedBookmarkSyncData:change:](v13, v14, v15, v16, v17, v18, v19, v20);
      }
      __int16 v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v21 = 136315138;
        uint64_t v22 = "CKBAChangeSetDeletedBookmarkSyncData";
        goto LABEL_15;
      }
    }
  }
  else
  {
    uint64_t v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[WBBookmarkDBAccess setDeletedBookmarkSyncData:change:](v12, v8, v9);
    }
    __int16 v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      uint64_t v22 = "CKBAChangeSetDeletedBookmarkSyncData";
      goto LABEL_15;
    }
  }
}

- (id)copyModifiedAttributesWithChange:(void *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    uint64_t v14 = "CKBAChangeCopyModifiedAttributes";
    __int16 v15 = 2114;
    uint64_t v16 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(change: %{public}@)", (uint8_t *)&v13, 0x16u);
  }
  id v5 = a3;
  int v6 = [v5 bookmark];
  BOOL v7 = [v5 changeType] == 0;
  int v8 = [v5 collection];

  int v9 = copyBookmarkAttributes(v6, v8, v7);

  uint64_t v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[WBBookmarkDBAccess copyModifiedAttributesWithChange:]();
  }
  __int16 v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    uint64_t v14 = "CKBAChangeCopyModifiedAttributes";
    _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted", (uint8_t *)&v13, 0xCu);
  }

  return v9;
}

- (id)copyAttributesWithItem:(void *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315394;
    uint64_t v18 = "CKBAItemCopyAttributes";
    __int16 v19 = 2114;
    uint64_t v20 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@)", (uint8_t *)&v17, 0x16u);
  }
  id v5 = (objc_class *)MEMORY[0x263EFF9A0];
  int v6 = a3;
  id v7 = [v5 alloc];
  int v8 = [v6 bookmark];
  int v9 = [v6 collection];
  uint64_t v10 = copyBookmarkAttributes(v8, v9, 1);
  __int16 v11 = (void *)[v7 initWithDictionary:v10 copyItems:1];

  uint64_t v12 = [MEMORY[0x263EFF9D0] null];

  int v13 = [v11 allKeysForObject:v12];
  [v11 removeObjectsForKeys:v13];

  uint64_t v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[WBBookmarkDBAccess copyAttributesWithItem:]();
  }
  __int16 v15 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    uint64_t v18 = "CKBAItemCopyAttributes";
    _os_log_impl(&dword_21C043000, v15, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted", (uint8_t *)&v17, 0xCu);
  }
  return v11;
}

- (void)setModifiedAttributes:(id)a3 item:(void *)a4
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "CKBAItemSetModifiedAttributes";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = a4;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@)", buf, 0x16u);
  }
  id v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[WBBookmarkDBAccess setModifiedAttributes:item:]();
  }
  int v8 = a4;
  int v9 = [v8 bookmark];
  uint64_t v10 = [v8 collection];
  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __CKBAItemSetModifiedAttributes_block_invoke;
  v94 = &unk_2643D9CF8;
  id v11 = v9;
  id v95 = v11;
  id v12 = v10;
  id v96 = v12;
  int v13 = (void (**)(void))MEMORY[0x21D4A1230](buf);
  uint64_t v14 = [v5 objectForKeyedSubscript:@"Title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v15 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = NSNumber;
      int v17 = v15;
      uint64_t v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", -[__CFString length](v14, "length"));
      int v89 = 136315394;
      v90 = "CKBAItemSetModifiedAttributes";
      __int16 v91 = 2114;
      v92 = v18;
      _os_log_impl(&dword_21C043000, v17, OS_LOG_TYPE_INFO, "@@ %s: Set title to value of length: %{public}@", (uint8_t *)&v89, 0x16u);
    }
    __int16 v19 = v11;
    uint64_t v20 = v14;
  }
  else
  {
    uint64_t v21 = [MEMORY[0x263EFF9D0] null];
    int v22 = [(__CFString *)v14 isEqual:v21];

    if (!v22) {
      goto LABEL_14;
    }
    __int16 v23 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v89 = 136315138;
      v90 = "CKBAItemSetModifiedAttributes";
      _os_log_impl(&dword_21C043000, v23, OS_LOG_TYPE_INFO, "@@ %s: Set title to value of length: (null)", (uint8_t *)&v89, 0xCu);
    }
    uint64_t v20 = &stru_26CC2ED50;
    __int16 v19 = v11;
  }
  [v19 setTitle:v20];
LABEL_14:
  if (![v11 isFolder])
  {
    uint64_t v32 = [v5 objectForKeyedSubscript:@"URL"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v33 = [v32 absoluteString];
      v34 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        __int16 v35 = NSNumber;
        v36 = v34;
        __int16 v37 = objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v33, "length"));
        int v89 = 136315394;
        v90 = "CKBAItemSetModifiedAttributes";
        __int16 v91 = 2114;
        v92 = v37;
        _os_log_impl(&dword_21C043000, v36, OS_LOG_TYPE_INFO, "@@ %s: Set URL to value of length: %{public}@", (uint8_t *)&v89, 0x16u);
      }
      [v11 setAddress:v33];
    }
    else
    {
      v38 = [MEMORY[0x263EFF9D0] null];
      int v39 = [v32 isEqual:v38];

      if (v39)
      {
        id v40 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          int v89 = 136315138;
          v90 = "CKBAItemSetModifiedAttributes";
          _os_log_impl(&dword_21C043000, v40, OS_LOG_TYPE_INFO, "@@ %s: Set URL to value of length: (null)", (uint8_t *)&v89, 0xCu);
        }
        [v11 setAddress:&stru_26CC2ED50];
      }
    }
    uint64_t v41 = [v5 objectForKeyedSubscript:@"ShowIconOnly"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        int v89 = 136315394;
        v90 = "CKBAItemSetModifiedAttributes";
        __int16 v91 = 2112;
        v92 = v41;
        _os_log_impl(&dword_21C043000, v42, OS_LOG_TYPE_INFO, "@@ %s: Set showIconOnly to value: %@", (uint8_t *)&v89, 0x16u);
      }
      uint64_t v43 = [v41 BOOLValue];
    }
    else
    {
      v44 = [MEMORY[0x263EFF9D0] null];
      int v45 = [v41 isEqual:v44];

      if (!v45) {
        goto LABEL_38;
      }
      v46 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        int v89 = 136315138;
        v90 = "CKBAItemSetModifiedAttributes";
        _os_log_impl(&dword_21C043000, v46, OS_LOG_TYPE_INFO, "@@ %s: Set showIconOnly to value: 0", (uint8_t *)&v89, 0xCu);
      }
      uint64_t v43 = 0;
    }
    [v11 setShowIconOnly:v43];
LABEL_38:
    if (([v11 isReadingListItem] & 1) == 0)
    {
      v13[2](v13);
      v63 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (!os_log_type_enabled(v63, OS_LOG_TYPE_INFO)) {
        goto LABEL_93;
      }
      int v89 = 136315138;
      v90 = "CKBAItemSetModifiedAttributes";
      goto LABEL_92;
    }
    v47 = [v5 objectForKeyedSubscript:@"DateAdded"];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v49 = v47;
    if ((isKindOfClass & 1) == 0)
    {
      v50 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v47);
      int v51 = [v47 isEqual:v50];

      if (!v51) {
        goto LABEL_43;
      }
      v49 = 0;
    }
    [v11 setDateAdded:v49];
LABEL_43:
    v52 = [v5 objectForKeyedSubscript:@"DateLastViewed"];

    objc_opt_class();
    char v53 = objc_opt_isKindOfClass();
    v54 = v52;
    if ((v53 & 1) == 0)
    {
      v55 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v52);
      int v56 = [v52 isEqual:v55];

      if (!v56) {
        goto LABEL_47;
      }
      v54 = 0;
    }
    [v11 setReadingListDateLastViewed:v54];
LABEL_47:
    v57 = [v5 objectForKeyedSubscript:@"PreviewText"];

    objc_opt_class();
    char v58 = objc_opt_isKindOfClass();
    v59 = v57;
    if ((v58 & 1) == 0)
    {
      v60 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v57);
      int v61 = [v57 isEqual:v60];

      if (!v61)
      {
LABEL_51:
        uint64_t v41 = objc_msgSend(v5, "wb_URLForKey:isValid:", @"ImageURL", 0);

        if (v41)
        {
          v62 = [v41 absoluteString];
          [v11 setReadingListIconURL:v62];
        }
        v13[2](v13);
        v63 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (!os_log_type_enabled(v63, OS_LOG_TYPE_INFO)) {
          goto LABEL_93;
        }
        int v89 = 136315138;
        v90 = "CKBAItemSetModifiedAttributes";
LABEL_92:
        _os_log_impl(&dword_21C043000, v63, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v89, 0xCu);
        goto LABEL_93;
      }
      v59 = 0;
    }
    [v11 setPreviewText:v59];
    goto LABEL_51;
  }
  id v24 = [v12 configuration];
  uint64_t v25 = [v24 collectionType];

  if (v25 != 1)
  {
    id v26 = v14;
    goto LABEL_62;
  }
  id v26 = [v5 objectForKeyedSubscript:@"LastSelectedTab"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v27 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = NSNumber;
      uint64_t v29 = v27;
      uint64_t v30 = objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v26, "length"));
      int v89 = 136315394;
      v90 = "CKBAItemSetModifiedAttributes";
      __int16 v91 = 2114;
      v92 = v30;
      _os_log_impl(&dword_21C043000, v29, OS_LOG_TYPE_INFO, "@@ %s: Set last selected child ID to value of length: %{public}@", (uint8_t *)&v89, 0x16u);
    }
    uint64_t v31 = [v12 bookmarkIDForServerID:v26 excludeDeletedBookmarks:1];
  }
  else
  {
    v64 = [MEMORY[0x263EFF9D0] null];
    int v65 = [v26 isEqual:v64];

    if (!v65) {
      goto LABEL_62;
    }
    v66 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      int v89 = 136315138;
      v90 = "CKBAItemSetModifiedAttributes";
      _os_log_impl(&dword_21C043000, v66, OS_LOG_TYPE_INFO, "@@ %s: Set last selected child ID to null", (uint8_t *)&v89, 0xCu);
    }
    uint64_t v31 = 0x7FFFFFFFLL;
  }
  [v11 setLastSelectedChildID:v31];
LABEL_62:
  v67 = [v5 objectForKeyedSubscript:@"SymbolImageName"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v68 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    BOOL v69 = os_log_type_enabled(v68, OS_LOG_TYPE_INFO);
    v70 = v67;
    if (v69)
    {
      v71 = NSNumber;
      v72 = v68;
      v73 = objc_msgSend(v71, "numberWithUnsignedInteger:", objc_msgSend(v67, "length"));
      int v89 = 136315394;
      v90 = "CKBAItemSetModifiedAttributes";
      __int16 v91 = 2114;
      v92 = v73;
      _os_log_impl(&dword_21C043000, v72, OS_LOG_TYPE_INFO, "@@ %s: Set symbolImageName to value of length: %{public}@", (uint8_t *)&v89, 0x16u);

      v70 = v67;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_70;
    }
    v74 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      int v89 = 136315138;
      v90 = "CKBAItemSetModifiedAttributes";
      _os_log_impl(&dword_21C043000, v74, OS_LOG_TYPE_INFO, "@@ %s: Set symbolImageName to null", (uint8_t *)&v89, 0xCu);
    }
    v70 = 0;
  }
  [v11 setSymbolImageName:v70];
LABEL_70:
  v75 = [v5 objectForKeyedSubscript:@"ShowIconOnly"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v76 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
    {
      int v89 = 136315394;
      v90 = "CKBAItemSetModifiedAttributes";
      __int16 v91 = 2112;
      v92 = v75;
      _os_log_impl(&dword_21C043000, v76, OS_LOG_TYPE_INFO, "@@ %s: Set showIconOnly to value: %@", (uint8_t *)&v89, 0x16u);
    }
    uint64_t v77 = [v75 BOOLValue];
LABEL_78:
    [v11 setShowIconOnly:v77];
    goto LABEL_79;
  }
  v78 = [MEMORY[0x263EFF9D0] null];
  int v79 = [v75 isEqual:v78];

  if (v79)
  {
    v80 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      int v89 = 136315138;
      v90 = "CKBAItemSetModifiedAttributes";
      _os_log_impl(&dword_21C043000, v80, OS_LOG_TYPE_INFO, "@@ %s: Set showIconOnly to value: 0", (uint8_t *)&v89, 0xCu);
    }
    uint64_t v77 = 0;
    goto LABEL_78;
  }
LABEL_79:
  uint64_t v41 = [v5 objectForKeyedSubscript:@"IsSelectedFavoritesFolder"];

  if (v41)
  {
    v81 = [MEMORY[0x263EFF9D0] null];
    int v82 = [v41 isEqual:v81];

    if (!v82)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v83 = v11;
        v84 = v41;
      }
      else
      {
        v85 = [MEMORY[0x263EFF9D0] null];
        int v86 = [v41 isEqual:v85];

        if (!v86)
        {
          v13[2](v13);
          goto LABEL_90;
        }
        v83 = v11;
        v84 = 0;
      }
      [v83 setSelectedFavoritesFolder:v84];
      v13[2](v13);
      if ([v11 isInserted])
      {
        uint64_t v87 = [v41 BOOLValue];
        v88 = [v8 collection];
        objc_msgSend(v88, "updateSelectedFavoritesFolderWithBookmarkID:wasFavoritesFolder:isFavoritesFolder:", objc_msgSend(v11, "identifier"), v87 ^ 1, v87);
      }
LABEL_90:
      v63 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        int v89 = 136315138;
        v90 = "CKBAItemSetModifiedAttributes";
        goto LABEL_92;
      }
      goto LABEL_93;
    }
  }
  v13[2](v13);
  v63 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    int v89 = 136315138;
    v90 = "CKBAItemSetModifiedAttributes";
    goto LABEL_92;
  }
LABEL_93:
}

- (id)copyValueForKey:(id)a3 item:(void *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v30 = 136315650;
    uint64_t v31 = "CKBAItemCopyValueForKey";
    __int16 v32 = 2114;
    int v33 = a4;
    __int16 v34 = 2114;
    id v35 = v5;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@, key: %{public}@)", (uint8_t *)&v30, 0x20u);
  }
  id v7 = [a4 bookmark];
  if ([v5 isEqualToString:@"Title"])
  {
    int v8 = [v7 title];
    int v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[WBBookmarkDBAccess copyValueForKey:item:]();
    }
    uint64_t v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_52;
    }
    if (v8) {
      goto LABEL_8;
    }
    id v11 = @"(null)";
    goto LABEL_33;
  }
  if (![v7 isFolder])
  {
    if ([v5 isEqualToString:@"URL"])
    {
      uint64_t v10 = [v7 address];
      int v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[WBBookmarkDBAccess copyValueForKey:item:]();
      }
      uint64_t v14 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if (v10)
        {
          objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject length](v10, "length"));
          __int16 v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          __int16 v15 = @"(null)";
        }
        int v30 = 136315394;
        uint64_t v31 = "CKBAItemCopyValueForKey";
        __int16 v32 = 2114;
        int v33 = v15;
        _os_log_impl(&dword_21C043000, v14, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted; length: %{public}@",
          (uint8_t *)&v30,
          0x16u);
        if (v10) {
      }
        }
      __int16 v23 = v10;
      goto LABEL_51;
    }
    if (([v7 isReadingListItem] & 1) == 0)
    {
      uint64_t v20 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
LABEL_40:
        int v8 = 0;
        goto LABEL_53;
      }
      int v30 = 136315138;
      uint64_t v31 = "CKBAItemCopyValueForKey";
LABEL_39:
      _os_log_impl(&dword_21C043000, v20, OS_LOG_TYPE_INFO, "<- %s -> (null)", (uint8_t *)&v30, 0xCu);
      goto LABEL_40;
    }
    if ([v5 isEqualToString:@"DateAdded"])
    {
      int v17 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[WBBookmarkDBAccess copyValueForKey:item:].cold.4(v17);
      }
      uint64_t v18 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v30 = 136315138;
        uint64_t v31 = "CKBAItemCopyValueForKey";
        _os_log_impl(&dword_21C043000, v18, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted", (uint8_t *)&v30, 0xCu);
      }
      uint64_t v19 = [v7 dateAdded];
    }
    else if ([v5 isEqualToString:@"DateLastViewed"])
    {
      uint64_t v21 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[WBBookmarkDBAccess copyValueForKey:item:].cold.5(v21);
      }
      int v22 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v30 = 136315138;
        uint64_t v31 = "CKBAItemCopyValueForKey";
        _os_log_impl(&dword_21C043000, v22, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted", (uint8_t *)&v30, 0xCu);
      }
      uint64_t v19 = [v7 dateLastViewed];
    }
    else
    {
      if (![v5 isEqualToString:@"PreviewText"])
      {
        int v27 = [v5 isEqualToString:@"ImageURL"];
        uint64_t v28 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        uint64_t v20 = v28;
        if (!v27)
        {
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
            goto LABEL_40;
          }
          int v30 = 136315138;
          uint64_t v31 = "CKBAItemCopyValueForKey";
          goto LABEL_39;
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[WBBookmarkDBAccess copyValueForKey:item:].cold.7(v20);
        }
        uint64_t v29 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          int v30 = 136315138;
          uint64_t v31 = "CKBAItemCopyValueForKey";
          _os_log_impl(&dword_21C043000, v29, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted", (uint8_t *)&v30, 0xCu);
        }
        __int16 v23 = [v7 readingListIconURL];
        uint64_t v10 = v23;
LABEL_51:
        int v8 = bookmarkURLWithString(v23);
LABEL_52:

        goto LABEL_53;
      }
      uint64_t v25 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[WBBookmarkDBAccess copyValueForKey:item:].cold.6(v25);
      }
      id v26 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        int v30 = 136315138;
        uint64_t v31 = "CKBAItemCopyValueForKey";
        _os_log_impl(&dword_21C043000, v26, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted", (uint8_t *)&v30, 0xCu);
      }
      uint64_t v19 = [v7 previewText];
    }
    int v8 = (void *)v19;
    goto LABEL_53;
  }
  if (![v5 isEqualToString:@"IsSelectedFavoritesFolder"])
  {
    if ([v5 isEqualToString:@"SymbolImageName"])
    {
      int v8 = [v7 symbolImageName];
      uint64_t v16 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[WBBookmarkDBAccess copyValueForKey:item:]();
      }
      uint64_t v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_52;
      }
      if (v8)
      {
LABEL_8:
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
        id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
      id v11 = @"(null)";
LABEL_33:
      int v30 = 136315394;
      uint64_t v31 = "CKBAItemCopyValueForKey";
      __int16 v32 = 2114;
      int v33 = v11;
      _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted; length: %{public}@",
        (uint8_t *)&v30,
        0x16u);
      if (v8) {

      }
      goto LABEL_52;
    }
    uint64_t v20 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      goto LABEL_40;
    }
    int v30 = 136315138;
    uint64_t v31 = "CKBAItemCopyValueForKey";
    goto LABEL_39;
  }
  int v8 = [v7 isSelectedFavoritesFolder];
  id v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v30 = 136315394;
    uint64_t v31 = "CKBAItemCopyValueForKey";
    __int16 v32 = 2114;
    int v33 = v8;
    _os_log_impl(&dword_21C043000, v12, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v30, 0x16u);
  }
LABEL_53:

  return v8;
}

- (void)clearlAllLocalBookmarksForAutomatedTestingWithDatabase:(void *)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "CKBADatabaseClearAllLocalBookmarksForAutomatedTesting";
    __int16 v9 = 2114;
    uint64_t v10 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v7, 0x16u);
  }
  id v5 = a3;
  if ([v5 mergeWithBookmarksDictionary:MEMORY[0x263EFFA78] clearHidden:1 clearSyncData:0 error:0])objc_msgSend(v5, "postBookmarksDidReloadNotification"); {
  int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    int v8 = "CKBADatabaseClearAllLocalBookmarksForAutomatedTesting";
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v7, 0xCu);
  }
}

- (id)copySaveURLForAssetWithKey:(id)a3 item:(void *)a4
{
  if (![a3 isEqual:@"BackgroundImage"]) {
    return 0;
  }
  id v5 = [a4 bookmark];
  int v6 = [[WBTabGroup alloc] initWithBookmark:v5];
  int v7 = [(WBTabGroup *)v6 uuid];

  int v8 = [MEMORY[0x263F08850] defaultManager];
  __int16 v9 = objc_msgSend(v8, "safari_startPageBackgroundImageFileURLForIdentifier:", v7);

  return v9;
}

- (void)notifyForSaveOfAssetWithKey:(id)a3 item:(void *)a4
{
  if ([a3 isEqual:@"BackgroundImage"])
  {
    id v5 = [a4 bookmark];
    int v6 = [[WBTabGroup alloc] initWithBookmark:v5];
    int v7 = [(WBTabGroup *)v6 uuid];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__WBBookmarkDBAccess_notifyForSaveOfAssetWithKey_item___block_invoke;
    v10[3] = &unk_2643D9CF8;
    id v11 = v7;
    id v12 = v5;
    id v8 = v5;
    id v9 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

void __55__WBBookmarkDBAccess_notifyForSaveOfAssetWithKey_item___block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  [v4 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"backgroundImageIdentifier"];
  if ([*(id *)(a1 + 40) subtype] == 2) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"profileBackgroundImageIsDefined"];
  }
  v2 = [MEMORY[0x263F087C8] defaultCenter];
  v3 = (void *)[v4 copy];
  [v2 postNotificationName:@"nonGlobalStartPageBackgroundImageDidChangeRemotelyNotification" object:0 userInfo:v3 deliverImmediately:1];
}

- (int64_t)collectionType
{
  return self->_collectionType;
}

- (int64_t)storeOwner
{
  return self->_storeOwner;
}

- (void)clearChangesWithChangeToken:(uint64_t)a3 database:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)clearChangesWithChangeToken:(uint64_t)a3 database:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeItemWithServerId:(uint64_t)a3 database:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeItemWithServerId:(void *)a1 database:.cold.2(void *a1)
{
  id v2 = a1;
  v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_stringByRedactingBookmarkDAVServerID");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_21C043000, v4, v5, "XX %s: Client requested that we remove item with server ID \"%{public}@\" but it does not exist", v6, v7, v8, v9, 2u);
}

- (void)copyDeviceIdentifier
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_1(&dword_21C043000, v0, v1, "## %s(deviceIdentifier: %@)", v2, v3, v4, v5, 2u);
}

- (void)copyItemWithLocalID:(void *)a1 database:.cold.1(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_21C043000, v4, v5, "XX %s: CKBALocalID is an instance of %{public}@", v6, v7, v8, v9, 2u);
}

- (void)copyLocalIDsInFolderWithLocalID:database:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "CKBADatabaseCopyLocalIDsInFolderWithLocalID";
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_21C043000, v0, OS_LOG_TYPE_FAULT, "XX %s: Client requested server IDs of children of local ID \"%{public}@\" but it does not exist or is not a folder!", (uint8_t *)&v1, 0x16u);
}

- (void)copyLocalIDsInFolderWithLocalID:(void *)a1 database:.cold.2(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_21C043000, v4, v5, "XX %s: CKBALocalID is an instance of %{public}@", v6, v7, v8, v9, 2u);
}

- (void)addItem:(uint64_t)a1 underFolderWithServerId:(NSObject *)a2 database:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21C043000, a2, OS_LOG_TYPE_DEBUG, "Item was merged with %{private}@", (uint8_t *)&v2, 0xCu);
}

- (void)setDeletedBookmarkSyncData:(uint64_t)a3 change:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setDeletedBookmarkSyncData:(void *)a3 change:.cold.2(void *a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  int v6 = 136315650;
  uint64_t v7 = "CKBAChangeSetDeletedBookmarkSyncData";
  __int16 v8 = 1024;
  int v9 = [a2 changeType];
  __int16 v10 = 1024;
  int v11 = [a3 isInserted];
  _os_log_fault_impl(&dword_21C043000, v5, OS_LOG_TYPE_FAULT, "XX %s: Cannot set the sync data of a change that is not a Delete. Change type = %d, inserted = %d", (uint8_t *)&v6, 0x18u);
}

- (void)copyModifiedAttributesWithChange:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_1(&dword_21C043000, v0, v1, "## %s(%@)", v2, v3, v4, v5, 2u);
}

- (void)copyAttributesWithItem:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_1(&dword_21C043000, v0, v1, "## %s(%@)", v2, v3, v4, v5, 2u);
}

- (void)setModifiedAttributes:item:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_1(&dword_21C043000, v0, v1, "## %s(attributes: %@)", v2, v3, v4, v5, 2u);
}

- (void)copyValueForKey:item:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_1(&dword_21C043000, v0, v1, "## %s(value: %@)", v2, v3, v4, v5, 2u);
}

- (void)copyValueForKey:(void *)a1 item:.cold.4(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_6() dateAdded];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_21C043000, v1, v4, "## %s(value: %@)", (uint8_t *)v5);
}

- (void)copyValueForKey:(void *)a1 item:.cold.5(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_6() dateLastViewed];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_21C043000, v1, v4, "## %s(value: %@)", (uint8_t *)v5);
}

- (void)copyValueForKey:(void *)a1 item:.cold.6(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_6() previewText];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_21C043000, v1, v4, "## %s(value: %@)", (uint8_t *)v5);
}

- (void)copyValueForKey:(void *)a1 item:.cold.7(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_6() readingListIconURL];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_21C043000, v1, v4, "## %s(value: %@)", (uint8_t *)v5);
}

@end