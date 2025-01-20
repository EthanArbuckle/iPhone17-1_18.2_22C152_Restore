@interface FCShortcutCategoryList
+ (BOOL)requiresBatchedSync;
+ (BOOL)requiresHighPriorityFirstSync;
+ (BOOL)requiresPushNotificationSupport;
+ (id)backingRecordIDs;
+ (id)backingRecordZoneIDs;
+ (id)commandStoreFileName;
+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4;
+ (id)localStoreFilename;
+ (int64_t)commandQueueUrgency;
+ (unint64_t)localStoreVersion;
- (BOOL)canHelpRestoreZoneName:(id)a3;
- (FCShortcutCategoryList)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5;
- (NSArray)blockedShortcutCategories;
- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3;
- (id)recordsForRestoringZoneName:(id)a3;
- (void)addShortcutCategory:(id)a3;
- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4;
- (void)loadLocalCachesFromStore;
- (void)removeAllShortcutCategories;
- (void)removeShortcutCategoryWithIdentifier:(id)a3;
@end

@implementation FCShortcutCategoryList

+ (unint64_t)localStoreVersion
{
  return 1;
}

+ (id)localStoreFilename
{
  return @"shortcut-category-list";
}

+ (id)commandStoreFileName
{
  return @"shortcut-category-list-commands";
}

+ (int64_t)commandQueueUrgency
{
  return 2;
}

- (FCShortcutCategoryList)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)FCShortcutCategoryList;
  v5 = [(FCPrivateDataController *)&v11 initWithContext:a3 pushNotificationCenter:a4 storeDirectory:a5];
  if (v5)
  {
    v6 = objc_alloc_init(FCMTWriterLock);
    itemsLock = v5->_itemsLock;
    v5->_itemsLock = v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    shortcutCategoriesByID = v5->_shortcutCategoriesByID;
    v5->_shortcutCategoriesByID = (NSMutableDictionary *)v8;
  }
  return v5;
}

- (NSArray)blockedShortcutCategories
{
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v14 = (id)[v3 initWithArray:MEMORY[0x1E4F1CBF0]];
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  v5 = itemsLock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__FCShortcutCategoryList_blockedShortcutCategories__block_invoke;
  v8[3] = &unk_1E5B4F3B0;
  v8[4] = self;
  v8[5] = &v9;
  [(FCMTWriterLock *)v5 performReadSync:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

uint64_t __51__FCShortcutCategoryList_blockedShortcutCategories__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[12];
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__FCShortcutCategoryList_blockedShortcutCategories__block_invoke_2;
  v3[3] = &unk_1E5B4F388;
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

void __51__FCShortcutCategoryList_blockedShortcutCategories__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (![v4 status]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
  }
}

- (void)addShortcutCategory:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    v23[0] = @"type";
    v5 = NSStringFromShortcutCategoryType((__CFString *)[v4 type]);
    *(void *)&long long buf = v5;
    v23[1] = @"categoryID";
    id v6 = [v4 identifier];
    *((void *)&buf + 1) = v6;
    v23[2] = @"dateAdded";
    v7 = [v4 dateAdded];
    v25 = v7;
    v23[3] = @"status";
    uint64_t v8 = NSStringFromShortcutCategoryStatus((__CFString *)[v4 status]);
    v26 = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:v23 count:4];

    if (self)
    {
LABEL_3:
      itemsLock = self->_itemsLock;
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (self) {
      goto LABEL_3;
    }
  }
  itemsLock = 0;
LABEL_4:
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__FCShortcutCategoryList_addShortcutCategory___block_invoke;
  v20[3] = &unk_1E5B4BE70;
  v20[4] = self;
  id v11 = v4;
  id v21 = v11;
  [(FCMTWriterLock *)itemsLock performWriteSync:v20];
  v12 = [(FCPrivateDataController *)self localStore];
  v13 = [v11 identifier];
  [v12 setObject:v9 forKey:v13];

  id v14 = (void *)FCShortcutCategoryListLog;
  if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = [v11 identifier];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "Adding shortcut category, identifier=<%{public}@>", (uint8_t *)&buf, 0xCu);
  }
  v17 = [FCModifyShortcutCategoryListCommand alloc];
  id v22 = v11;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v19 = [(FCModifyShortcutCategoryListCommand *)v17 initWithShortcutCategories:v18 merge:0];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v19];
}

void __46__FCShortcutCategoryList_addShortcutCategory___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[12];
  }
  v2 = *(void **)(a1 + 40);
  id v3 = v1;
  id v4 = [v2 identifier];
  [v3 setObject:v2 forKey:v4];
}

- (void)removeShortcutCategoryWithIdentifier:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    if (self) {
      shortcutCategoriesByID = self->_shortcutCategoriesByID;
    }
    else {
      shortcutCategoriesByID = 0;
    }
    id v6 = shortcutCategoriesByID;
    v7 = [(NSMutableDictionary *)v6 objectForKey:v4];

    if (v7)
    {
      if (self) {
        itemsLock = self->_itemsLock;
      }
      else {
        itemsLock = 0;
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __63__FCShortcutCategoryList_removeShortcutCategoryWithIdentifier___block_invoke;
      v16[3] = &unk_1E5B4BE70;
      v16[4] = self;
      id v9 = v4;
      id v17 = v9;
      [(FCMTWriterLock *)itemsLock performWriteSync:v16];
      v10 = [(FCPrivateDataController *)self localStore];
      [v10 removeObjectForKey:v9];

      id v11 = FCShortcutCategoryListLog;
      if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        v20 = (const char *)v9;
        _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "Removing shortcut category <%{public}@>", buf, 0xCu);
      }
      v12 = [FCRemoveFromShortcutCategoryListCommand alloc];
      v18 = v7;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
      id v14 = [(FCRemoveFromShortcutCategoryListCommand *)v12 initWithShortcutCategories:v13];

      [(FCPrivateDataController *)self addCommandToCommandQueue:v14];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "shortcutCategory");
      *(_DWORD *)long long buf = 136315906;
      v20 = "-[FCShortcutCategoryList removeShortcutCategoryWithIdentifier:]";
      __int16 v21 = 2080;
      id v22 = "FCShortcutCategoryList.m";
      __int16 v23 = 1024;
      int v24 = 106;
      __int16 v25 = 2114;
      v26 = v15;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "identifier");
    *(_DWORD *)long long buf = 136315906;
    v20 = "-[FCShortcutCategoryList removeShortcutCategoryWithIdentifier:]";
    __int16 v21 = 2080;
    id v22 = "FCShortcutCategoryList.m";
    __int16 v23 = 1024;
    int v24 = 102;
    __int16 v25 = 2114;
    v26 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_14:
  }
}

uint64_t __63__FCShortcutCategoryList_removeShortcutCategoryWithIdentifier___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[12];
  }
  return [v1 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)removeAllShortcutCategories
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__16;
  id v17 = __Block_byref_object_dispose__16;
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v18 = (id)[v3 initWithArray:MEMORY[0x1E4F1CBF0]];
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  v5 = itemsLock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__FCShortcutCategoryList_removeAllShortcutCategories__block_invoke;
  v12[3] = &unk_1E5B4F3B0;
  v12[4] = self;
  v12[5] = &v13;
  [(FCMTWriterLock *)v5 performWriteSync:v12];

  id v6 = (void *)v14[5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__FCShortcutCategoryList_removeAllShortcutCategories__block_invoke_3;
  v11[3] = &unk_1E5B4E468;
  v11[4] = self;
  [v6 enumerateObjectsUsingBlock:v11];
  v7 = FCShortcutCategoryListLog;
  if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v14[5];
    *(_DWORD *)long long buf = 138543362;
    uint64_t v20 = v8;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "Removing shortcut categories <%{public}@>", buf, 0xCu);
  }
  id v9 = [FCRemoveFromShortcutCategoryListCommand alloc];
  v10 = [(FCRemoveFromShortcutCategoryListCommand *)v9 initWithShortcutCategories:v14[5]];
  [(FCPrivateDataController *)self addCommandToCommandQueue:v10];

  _Block_object_dispose(&v13, 8);
}

uint64_t __53__FCShortcutCategoryList_removeAllShortcutCategories__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    v2 = *(void **)(v1 + 96);
  }
  else {
    v2 = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__FCShortcutCategoryList_removeAllShortcutCategories__block_invoke_2;
  v5[3] = &unk_1E5B4F3D8;
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = v1;
  v5[5] = v3;
  return [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void __53__FCShortcutCategoryList_removeAllShortcutCategories__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  if (v5) {
    v5 = (void *)v5[12];
  }
  id v6 = v5;
  id v8 = a3;
  v7 = [v8 identifier];
  [v6 removeObjectForKey:v7];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
}

void __53__FCShortcutCategoryList_removeAllShortcutCategories__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 localStore];
  [v4 removeObjectForKey:v3];
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 0;
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 1;
}

+ (id)backingRecordZoneIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v7 = [v5 allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([a1 isLocalStoreKeyInternal:v12] & 1) == 0)
        {
          uint64_t v13 = [v5 objectForKey:v12];
          id v14 = -[FCShortcutCategory initWithIdentifier:dictionaryRepresentation:]([FCShortcutCategory alloc], v12, v13);
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v9);
  }

  uint64_t v15 = FCShortcutCategoryListLog;
  if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "Merging shortcut category list data to icloud", v19, 2u);
  }
  v16 = [[FCModifyShortcutCategoryListCommand alloc] initWithShortcutCategories:v6 merge:1];
  int v24 = v16;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];

  return v17;
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v8 = [(FCPrivateDataController *)self localStore];
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = v9;
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__FCShortcutCategoryList_handleSyncWithChangedRecords_deletedRecordNames___block_invoke;
  v16[3] = &unk_1E5B4DC70;
  id v17 = v6;
  id v18 = self;
  id v19 = v9;
  id v20 = v8;
  id v21 = v7;
  id v12 = v7;
  id v13 = v8;
  id v14 = v10;
  id v15 = v6;
  [(FCMTWriterLock *)itemsLock performWriteSync:v16];
}

void __74__FCShortcutCategoryList_handleSyncWithChangedRecords_deletedRecordNames___block_invoke(uint64_t a1)
{
  v66[2] = *MEMORY[0x1E4F143B8];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v1 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v1)
  {
    uint64_t v3 = v1;
    uint64_t v45 = *(void *)v57;
    *(void *)&long long v2 = 136315906;
    long long v43 = v2;
    do
    {
      uint64_t v4 = 0;
      uint64_t v46 = v3;
      do
      {
        if (*(void *)v57 != v45) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v56 + 1) + 8 * v4);
        uint64_t v6 = *(void *)(a1 + 40);
        id v7 = *(void **)(a1 + 56);
        id v50 = *(id *)(a1 + 48);
        id v8 = v7;
        if (v6)
        {
          uint64_t v48 = v6;
          id v9 = v5;
          uint64_t v10 = [v9 recordID];
          id v11 = [v10 recordName];

          id v12 = [v8 objectForKey:v11];
          uint64_t v13 = [v9 objectForKeyedSubscript:@"dateAdded"];
          id v14 = [v9 objectForKeyedSubscript:@"type"];
          id v15 = [v9 objectForKeyedSubscript:@"categoryID"];
          v16 = [v9 objectForKeyedSubscript:@"status"];

          v49 = v8;
          if (v12)
          {
            v47 = v12;
            id v17 = (void *)[v12 mutableCopy];
            objc_msgSend(v17, "fc_safelySetObjectAllowingNil:forKey:", v13, @"dateAdded");
            objc_msgSend(v17, "fc_safelySetObjectAllowingNil:forKey:", v14, @"type");
            objc_msgSend(v17, "fc_safelySetObjectAllowingNil:forKey:", v15, @"categoryID");
            objc_msgSend(v17, "fc_safelySetObjectAllowingNil:forKey:", v16, @"status");
            [v8 setObject:v17 forKey:v11];
            if (v11)
            {
              id v18 = -[FCShortcutCategory initWithIdentifier:dictionaryRepresentation:]([FCShortcutCategory alloc], v11, v17);
              [*(id *)(v48 + 96) setObject:v18 forKey:v11];
              [v50 addObject:v18];
              id v19 = FCShortcutCategoryListLog;
              if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138543362;
                *(void *)&uint8_t buf[4] = v11;
                _os_log_impl(&dword_1A460D000, v19, OS_LOG_TYPE_DEFAULT, "Modifying shortcut category when handling sync <%{public}@>", buf, 0xCu);
              }
            }
            uint64_t v3 = v46;
            id v20 = (void *)v13;
            id v21 = v47;
LABEL_13:

            id v8 = v49;
            goto LABEL_14;
          }
          if (!v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v26 = (void *)[[NSString alloc] initWithFormat:@"should never have a shortcut category without an item ID"];
            *(_DWORD *)long long buf = v43;
            *(void *)&uint8_t buf[4] = "-[FCShortcutCategoryList _syncShortcutCategories:localStore:record:]";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "FCShortcutCategoryList.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v66[0]) = 317;
            WORD2(v66[0]) = 2114;
            *(void *)((char *)v66 + 6) = v26;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          uint64_t v3 = v46;
          id v20 = (void *)v13;
          if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v27 = (void *)[[NSString alloc] initWithFormat:@"should never have a shortcut category without a date added"];
            *(_DWORD *)long long buf = v43;
            *(void *)&uint8_t buf[4] = "-[FCShortcutCategoryList _syncShortcutCategories:localStore:record:]";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "FCShortcutCategoryList.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v66[0]) = 318;
            WORD2(v66[0]) = 2114;
            *(void *)((char *)v66 + 6) = v27;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          id v21 = 0;
          if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v28 = (void *)[[NSString alloc] initWithFormat:@"should never have a shortcut category without a category type value"];
            *(_DWORD *)long long buf = v43;
            *(void *)&uint8_t buf[4] = "-[FCShortcutCategoryList _syncShortcutCategories:localStore:record:]";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "FCShortcutCategoryList.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v66[0]) = 319;
            WORD2(v66[0]) = 2114;
            *(void *)((char *)v66 + 6) = v28;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

            if (!v15) {
              goto LABEL_25;
            }
          }
          else if (!v15)
          {
LABEL_25:
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              v29 = (void *)[[NSString alloc] initWithFormat:@"should never have a shortcut category without a category id value"];
              *(_DWORD *)long long buf = v43;
              *(void *)&uint8_t buf[4] = "-[FCShortcutCategoryList _syncShortcutCategories:localStore:record:]";
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "FCShortcutCategoryList.m";
              *(_WORD *)&buf[22] = 1024;
              LODWORD(v66[0]) = 320;
              WORD2(v66[0]) = 2114;
              *(void *)((char *)v66 + 6) = v29;
              _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
            }
          }
          if (v16)
          {
            if (v11 && v20 && v14 && v15)
            {
              v64[0] = @"dateAdded";
              v64[1] = @"type";
              *(void *)long long buf = v20;
              *(void *)&buf[8] = v14;
              v64[2] = @"categoryID";
              v64[3] = @"status";
              *(void *)&buf[16] = v15;
              v66[0] = v16;
              long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v64 count:4];
              id v23 = -[FCShortcutCategory initWithIdentifier:dictionaryRepresentation:]([FCShortcutCategory alloc], v11, v22);
              [*(id *)(v48 + 96) setObject:v23 forKey:v11];
              [v49 setObject:v22 forKey:v11];
              [v50 addObject:v23];
              int v24 = FCShortcutCategoryListLog;
              if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v62 = 138543362;
                v63 = v11;
                _os_log_impl(&dword_1A460D000, v24, OS_LOG_TYPE_DEFAULT, "Adding shortcut category when handling sync <%{public}@>", v62, 0xCu);
              }

              uint64_t v3 = v46;
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            __int16 v25 = (void *)[[NSString alloc] initWithFormat:@"should never have a shortcut category without a category status value"];
            *(_DWORD *)long long buf = v43;
            *(void *)&uint8_t buf[4] = "-[FCShortcutCategoryList _syncShortcutCategories:localStore:record:]";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "FCShortcutCategoryList.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v66[0]) = 321;
            WORD2(v66[0]) = 2114;
            *(void *)((char *)v66 + 6) = v25;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          goto LABEL_13;
        }
LABEL_14:

        ++v4;
      }
      while (v3 != v4);
      uint64_t v30 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
      uint64_t v3 = v30;
    }
    while (v30);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v31 = *(id *)(a1 + 64);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v53;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v53 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v52 + 1) + 8 * v35);
        v37 = objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v36, v43);
        if (v37)
        {
          id v38 = -[FCShortcutCategory initWithIdentifier:dictionaryRepresentation:]([FCShortcutCategory alloc], v36, v37);
          uint64_t v39 = *(void *)(a1 + 40);
          if (v39) {
            v40 = *(void **)(v39 + 96);
          }
          else {
            v40 = 0;
          }
          [v40 removeObjectForKey:v36];
          [*(id *)(a1 + 56) removeObjectForKey:v36];
          [*(id *)(a1 + 48) addObject:v38];
          v41 = FCShortcutCategoryListLog;
          if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            *(void *)&uint8_t buf[4] = v36;
            _os_log_impl(&dword_1A460D000, v41, OS_LOG_TYPE_DEFAULT, "Removing shortcut category when handling sync <%{public}@>", buf, 0xCu);
          }
        }
        ++v35;
      }
      while (v33 != v35);
      uint64_t v42 = [v31 countByEnumeratingWithState:&v52 objects:v60 count:16];
      uint64_t v33 = v42;
    }
    while (v42);
  }
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3);
  if (self) {
    shortcutCategoriesByID = self->_shortcutCategoriesByID;
  }
  else {
    shortcutCategoriesByID = 0;
  }
  id v5 = [(NSMutableDictionary *)shortcutCategoriesByID allValues];
  uint64_t v6 = objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_25);

  return v6;
}

uint64_t __68__FCShortcutCategoryList_allKnownRecordNamesWithinRecordZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)loadLocalCachesFromStore
{
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__FCShortcutCategoryList_loadLocalCachesFromStore__block_invoke;
  v3[3] = &unk_1E5B4C018;
  v3[4] = self;
  [(FCMTWriterLock *)itemsLock performWriteSync:v3];
}

void __50__FCShortcutCategoryList_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    objc_storeStrong((id *)(v3 + 96), v2);
  }

  uint64_t v4 = [*(id *)(a1 + 32) localStore];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = [v4 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([(id)objc_opt_class() isLocalStoreKeyInternal:v10] & 1) == 0)
        {
          objc_opt_class();
          id v11 = [v4 objectForKey:v10];
          if (v11)
          {
            if (objc_opt_isKindOfClass()) {
              id v12 = v11;
            }
            else {
              id v12 = 0;
            }
          }
          else
          {
            id v12 = 0;
          }
          id v13 = v12;

          if (v13)
          {
            id v14 = -[FCShortcutCategory initWithIdentifier:dictionaryRepresentation:]([FCShortcutCategory alloc], v10, v13);
            if (v14)
            {
              id v15 = *(void **)(a1 + 32);
              if (v15) {
                id v15 = (void *)v15[12];
              }
              v16 = v15;
              id v17 = [v14 identifier];
              [v16 setObject:v14 forKey:v17];
            }
          }
          else
          {
            id v18 = (void *)FCDefaultLog;
            if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
            {
              id v19 = v18;
              id v20 = (objc_class *)objc_opt_class();
              id v21 = NSStringFromClass(v20);
              *(_DWORD *)long long buf = 138412546;
              uint64_t v27 = v21;
              __int16 v28 = 2114;
              v29 = v10;
              _os_log_error_impl(&dword_1A460D000, v19, OS_LOG_TYPE_ERROR, "ERROR: Object of type %@ is not dictionary for key %{public}@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v7);
  }
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return [a3 isEqualToString:@"ShortcutCategories"];
}

- (id)recordsForRestoringZoneName:(id)a3
{
  uint64_t v3 = self;
  if (self)
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x3032000000;
    id v11 = __Block_byref_object_copy__16;
    id v12 = __Block_byref_object_dispose__16;
    id v13 = 0;
    uint64_t v4 = self->_itemsLock;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__FCShortcutCategoryList__allShortcutCategories__block_invoke;
    v7[3] = &unk_1E5B4C258;
    v7[4] = v3;
    v7[5] = &v8;
    [(FCMTWriterLock *)v4 performReadSync:v7];

    uint64_t v3 = (FCShortcutCategoryList *)(id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  id v5 = [(FCShortcutCategoryList *)v3 fc_arrayByTransformingWithBlock:&__block_literal_global_25];

  return v5;
}

uint64_t __54__FCShortcutCategoryList_recordsForRestoringZoneName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
}

void __48__FCShortcutCategoryList__allShortcutCategories__block_invoke(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  if (v2) {
    long long v2 = (void *)v2[12];
  }
  uint64_t v3 = v2;
  id v7 = [v3 allValues];
  uint64_t v4 = [v7 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_shortcutCategoriesByID, 0);
}

@end