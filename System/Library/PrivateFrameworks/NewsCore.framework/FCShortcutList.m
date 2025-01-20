@interface FCShortcutList
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
- (BOOL)containsShortcut:(id)a3;
- (BOOL)moveShortcutWithIdentifier:(id)a3 toIndex:(unint64_t)a4;
- (FCShortcutList)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5;
- (NSOrderedSet)orderedShortcuts;
- (id)_allShortcuts;
- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3;
- (id)recordsForRestoringZoneName:(id)a3;
- (void)_addedShortcuts:(void *)a3 changedShortcuts:(void *)a4 removedShortcuts:;
- (void)_moveShortcut:(uint64_t)a3 toIndex:;
- (void)addObserver:(id)a3;
- (void)addShortcut:(id)a3;
- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4;
- (void)loadLocalCachesFromStore;
- (void)removeObserver:(id)a3;
- (void)removeShortcutWithIdentifier:(id)a3;
- (void)updateShortcutOrderForOrderedIdentifiers:(id)a3;
- (void)validateShortcuts;
@end

@implementation FCShortcutList

void __31__FCShortcutList__allShortcuts__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[12];
  }
  v3 = v2;
  id v7 = [v3 allValues];
  uint64_t v4 = [v7 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __42__FCShortcutList_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    objc_storeStrong((id *)(v3 + 96), v2);
  }

  uint64_t v4 = [*(id *)(a1 + 32) localStore];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [v4 allKeys];
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
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([(id)objc_opt_class() isLocalStoreKeyInternal:v10] & 1) == 0)
        {
          objc_opt_class();
          v11 = [v4 objectForKey:v10];
          if (v11)
          {
            if (objc_opt_isKindOfClass()) {
              v12 = v11;
            }
            else {
              v12 = 0;
            }
          }
          else
          {
            v12 = 0;
          }
          id v13 = v12;

          if (v13)
          {
            id v14 = -[FCShortcut initWithIdentifier:dictionaryRepresentation:]([FCShortcut alloc], v10, v13);
            if (v14)
            {
              v15 = *(void **)(a1 + 32);
              if (v15) {
                v15 = (void *)v15[12];
              }
              v16 = v15;
              v17 = [v14 identifier];
              [v16 setObject:v14 forKey:v17];
            }
          }
          else
          {
            v18 = (void *)FCDefaultLog;
            if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
            {
              v19 = v18;
              v20 = (objc_class *)objc_opt_class();
              v21 = NSStringFromClass(v20);
              *(_DWORD *)buf = 138412546;
              v27 = v21;
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

+ (unint64_t)localStoreVersion
{
  return 1;
}

+ (id)localStoreFilename
{
  return @"shortcut-list";
}

+ (id)commandStoreFileName
{
  return @"shortcut-list-commands";
}

+ (int64_t)commandQueueUrgency
{
  return 1;
}

- (void)validateShortcuts
{
  uint64_t v3 = [(FCPrivateDataController *)self context];
  uint64_t v4 = [v3 configurationManager];
  uint64_t v5 = [v4 configuration];
  unint64_t v6 = [v5 shortcutsMaxCount];

  uint64_t v7 = [(NSMutableDictionary *)self->_shortcutsByID allValues];
  unint64_t v8 = [v7 count];

  if (v8 > v6)
  {
    v9 = -[FCShortcutList _allShortcuts]((id *)&self->super.super.isa);
    v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_8];

    v11 = objc_msgSend(v10, "subarrayWithRange:", v6, objc_msgSend(v10, "count") - v6);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __35__FCShortcutList_validateShortcuts__block_invoke_2;
    v14[3] = &unk_1E5B4CE38;
    v14[4] = self;
    [v11 enumerateObjectsUsingBlock:v14];
  }
  v12 = (void *)[(NSMutableDictionary *)self->_shortcutsByID mutableCopy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __35__FCShortcutList_validateShortcuts__block_invoke_3;
  v13[3] = &unk_1E5B4CEA8;
  v13[4] = self;
  [v12 enumerateKeysAndObjectsUsingBlock:v13];
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
  v3[2] = __42__FCShortcutList_loadLocalCachesFromStore__block_invoke;
  v3[3] = &unk_1E5B4C018;
  v3[4] = self;
  [(FCMTWriterLock *)itemsLock performWriteSync:v3];
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 0;
}

- (NSOrderedSet)orderedShortcuts
{
  if (self)
  {
    v2 = (void *)MEMORY[0x1E4F1CAA0];
    uint64_t v3 = -[FCShortcutList _allShortcuts]((id *)&self->super.super.isa);
    uint64_t v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_56];
    uint64_t v5 = [v2 orderedSetWithArray:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (NSOrderedSet *)v5;
}

- (id)_allShortcuts
{
  v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    unint64_t v6 = &v5;
    uint64_t v7 = 0x3032000000;
    unint64_t v8 = __Block_byref_object_copy__4;
    v9 = __Block_byref_object_dispose__4;
    id v10 = 0;
    id v2 = a1[13];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __31__FCShortcutList__allShortcuts__block_invoke;
    v4[3] = &unk_1E5B4C258;
    v4[4] = v1;
    v4[5] = &v5;
    [v2 performReadSync:v4];

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

- (void)addObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FCShortcutList;
  [(FCPrivateDataController *)&v3 addObserver:a3];
}

- (FCShortcutList)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)FCShortcutList;
  uint64_t v5 = [(FCPrivateDataController *)&v11 initWithContext:a3 pushNotificationCenter:a4 storeDirectory:a5];
  if (v5)
  {
    unint64_t v6 = objc_alloc_init(FCMTWriterLock);
    itemsLock = v5->_itemsLock;
    v5->_itemsLock = v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    shortcutsByID = v5->_shortcutsByID;
    v5->_shortcutsByID = (NSMutableDictionary *)v8;
  }
  return v5;
}

- (void)addShortcut:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    v24[0] = @"dateAdded";
    uint64_t v5 = [v4 dateAdded];
    *(void *)&long long buf = v5;
    v24[1] = @"order";
    unint64_t v6 = [v4 order];
    *((void *)&buf + 1) = v6;
    v24[2] = @"type";
    uint64_t v7 = NSStringFromShortcutType((__CFString *)[v4 shortcutType]);
    v26 = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:v24 count:3];

    if (self)
    {
LABEL_3:
      itemsLock = self->_itemsLock;
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (self) {
      goto LABEL_3;
    }
  }
  itemsLock = 0;
LABEL_4:
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __30__FCShortcutList_addShortcut___block_invoke;
  v20[3] = &unk_1E5B4BE70;
  v20[4] = self;
  id v10 = v4;
  id v21 = v10;
  [(FCMTWriterLock *)itemsLock performWriteSync:v20];
  objc_super v11 = [(FCPrivateDataController *)self localStore];
  v12 = [v10 identifier];
  [v11 setObject:v8 forKey:v12];

  id v23 = v10;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  -[FCShortcutList _addedShortcuts:changedShortcuts:removedShortcuts:](self, v13, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0]);

  id v14 = (void *)FCShortcutListLog;
  if (os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = [v10 identifier];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "Adding favorites <%{public}@>", (uint8_t *)&buf, 0xCu);
  }
  v17 = [FCModifyShortcutsCommand alloc];
  id v22 = v10;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v19 = [(FCModifyShortcutsCommand *)v17 initWithShortcuts:v18 merge:0];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v19];
}

void __30__FCShortcutList_addShortcut___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[12];
  }
  id v2 = *(void **)(a1 + 40);
  objc_super v3 = v1;
  id v4 = [v2 identifier];
  [v3 setObject:v2 forKey:v4];
}

- (void)_addedShortcuts:(void *)a3 changedShortcuts:(void *)a4 removedShortcuts:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_18;
  }
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "shortcutsAdded");
    *(_DWORD *)long long buf = 136315906;
    long long v25 = "-[FCShortcutList _addedShortcuts:changedShortcuts:removedShortcuts:]";
    __int16 v26 = 2080;
    uint64_t v27 = "FCShortcutList.m";
    __int16 v28 = 1024;
    int v29 = 467;
    __int16 v30 = 2114;
    uint64_t v31 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v8)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "shortcutsChanged");
        *(_DWORD *)long long buf = 136315906;
        long long v25 = "-[FCShortcutList _addedShortcuts:changedShortcuts:removedShortcuts:]";
        __int16 v26 = 2080;
        uint64_t v27 = "FCShortcutList.m";
        __int16 v28 = 1024;
        int v29 = 468;
        __int16 v30 = 2114;
        uint64_t v31 = v17;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
  }
  else if (!v8)
  {
    goto LABEL_5;
  }
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "shortcutsRemoved");
    *(_DWORD *)long long buf = 136315906;
    long long v25 = "-[FCShortcutList _addedShortcuts:changedShortcuts:removedShortcuts:]";
    __int16 v26 = 2080;
    uint64_t v27 = "FCShortcutList.m";
    __int16 v28 = 1024;
    int v29 = 469;
    __int16 v30 = 2114;
    uint64_t v31 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = [a1 observers];
  objc_super v11 = (void *)[v10 copy];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v15++) shortcutList:a1 didAddShortcuts:v7 changedShortcuts:v8 removedShortcuts:v9];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

LABEL_18:
}

- (void)removeShortcutWithIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    if (self) {
      shortcutsByID = self->_shortcutsByID;
    }
    else {
      shortcutsByID = 0;
    }
    unint64_t v6 = shortcutsByID;
    id v7 = [(NSMutableDictionary *)v6 objectForKey:v4];

    if (v7)
    {
      if (self) {
        itemsLock = self->_itemsLock;
      }
      else {
        itemsLock = 0;
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __47__FCShortcutList_removeShortcutWithIdentifier___block_invoke;
      v17[3] = &unk_1E5B4BE70;
      v17[4] = self;
      id v9 = v4;
      id v18 = v9;
      [(FCMTWriterLock *)itemsLock performWriteSync:v17];
      id v10 = [(FCPrivateDataController *)self localStore];
      [v10 removeObjectForKey:v9];

      objc_super v11 = [(FCShortcutList *)self orderedShortcuts];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __47__FCShortcutList_removeShortcutWithIdentifier___block_invoke_2;
      v16[3] = &unk_1E5B4CE38;
      v16[4] = self;
      [v11 enumerateObjectsUsingBlock:v16];

      long long v19 = v7;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      -[FCShortcutList _addedShortcuts:changedShortcuts:removedShortcuts:](self, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], v12);

      uint64_t v13 = FCShortcutListLog;
      if (os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        long long v21 = (const char *)v9;
        _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "Removing favorite <%{public}@>", buf, 0xCu);
      }
      uint64_t v14 = [[FCRemoveShortcutCommand alloc] initWithShortcutID:v9];
      [(FCPrivateDataController *)self addCommandToCommandQueue:v14];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "shortcut");
      *(_DWORD *)long long buf = 136315906;
      long long v21 = "-[FCShortcutList removeShortcutWithIdentifier:]";
      __int16 v22 = 2080;
      id v23 = "FCShortcutList.m";
      __int16 v24 = 1024;
      int v25 = 94;
      __int16 v26 = 2114;
      uint64_t v27 = v15;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "identifier != nil");
    *(_DWORD *)long long buf = 136315906;
    long long v21 = "-[FCShortcutList removeShortcutWithIdentifier:]";
    __int16 v22 = 2080;
    id v23 = "FCShortcutList.m";
    __int16 v24 = 1024;
    int v25 = 90;
    __int16 v26 = 2114;
    uint64_t v27 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_14:
  }
}

uint64_t __47__FCShortcutList_removeShortcutWithIdentifier___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[12];
  }
  return [v1 removeObjectForKey:*(void *)(a1 + 40)];
}

void __47__FCShortcutList_removeShortcutWithIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
}

- (void)_moveShortcut:(uint64_t)a3 toIndex:
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    unint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
    id v7 = [v5 order];

    if (v6 != v7)
    {
      id v8 = [a1 localStore];
      id v9 = [v5 identifier];
      id v10 = [v8 objectForKey:v9];
      objc_super v11 = (void *)[v10 mutableCopy];

      uint64_t v12 = [v5 dateAdded];
      objc_msgSend(v11, "fc_safelySetObjectAllowingNil:forKey:", v12, @"dateAdded");

      objc_msgSend(v11, "fc_safelySetObjectAllowingNil:forKey:", v6, @"order");
      uint64_t v13 = NSStringFromShortcutType((__CFString *)[v5 shortcutType]);
      objc_msgSend(v11, "fc_safelySetObjectAllowingNil:forKey:", v13, @"type");

      uint64_t v14 = [v5 identifier];
      [v8 setObject:v11 forKey:v14];

      uint64_t v15 = [FCShortcut alloc];
      v16 = [v5 identifier];
      id v17 = -[FCShortcut initWithIdentifier:dictionaryRepresentation:](v15, v16, v11);

      id v18 = (void *)a1[13];
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      __int16 v26 = __40__FCShortcutList__moveShortcut_toIndex___block_invoke;
      uint64_t v27 = &unk_1E5B4C738;
      uint64_t v28 = a1;
      id v29 = v17;
      id v30 = v5;
      id v19 = v17;
      [v18 performWriteSync:&v24];
      long long v20 = [FCModifyShortcutsCommand alloc];
      v32[0] = v19;
      long long v21 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v32, 1, v24, v25, v26, v27, v28);
      __int16 v22 = [(FCModifyShortcutsCommand *)v20 initWithShortcuts:v21 merge:0];

      [a1 addCommandToCommandQueue:v22];
      id v31 = v19;
      id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      -[FCShortcutList _addedShortcuts:changedShortcuts:removedShortcuts:](a1, MEMORY[0x1E4F1CBF0], v23, MEMORY[0x1E4F1CBF0]);
    }
  }
}

- (BOOL)moveShortcutWithIdentifier:(id)a3 toIndex:(unint64_t)a4
{
  unint64_t v6 = (void *)MEMORY[0x1E4F29060];
  id v7 = a3;
  [v6 isMainThread];
  if (self) {
    shortcutsByID = self->_shortcutsByID;
  }
  else {
    shortcutsByID = 0;
  }
  id v9 = [(NSMutableDictionary *)shortcutsByID objectForKey:v7];

  id v10 = -[FCShortcutList _allShortcuts]((id *)&self->super.super.isa);
  if ([v10 count] <= a4 || !v9)
  {

    goto LABEL_8;
  }
  objc_super v11 = [v9 order];
  [v11 floatValue];
  float v13 = v12;

  if (v13 == (float)a4)
  {
LABEL_8:
    BOOL v16 = 0;
    goto LABEL_9;
  }
  uint64_t v14 = [(FCShortcutList *)self orderedShortcuts];
  uint64_t v15 = (void *)[v14 mutableCopy];

  [v15 removeObject:v9];
  [v15 insertObject:v9 atIndex:a4];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__FCShortcutList_moveShortcutWithIdentifier_toIndex___block_invoke;
  v18[3] = &unk_1E5B4CE38;
  v18[4] = self;
  [v15 enumerateObjectsUsingBlock:v18];

  BOOL v16 = 1;
LABEL_9:

  return v16;
}

void __53__FCShortcutList_moveShortcutWithIdentifier_toIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
}

- (void)updateShortcutOrderForOrderedIdentifiers:(id)a3
{
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__4;
  v40 = __Block_byref_object_dispose__4;
  id v41 = 0;
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  unint64_t v6 = itemsLock;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  void v32[2] = __59__FCShortcutList_updateShortcutOrderForOrderedIdentifiers___block_invoke;
  v32[3] = &unk_1E5B4C230;
  v35 = &v36;
  id v27 = v4;
  id v33 = v27;
  v34 = self;
  [(FCMTWriterLock *)v6 performReadSync:v32];

  for (unint64_t i = 0; i < [(id)v37[5] count]; ++i)
  {
    id v8 = [(id)v37[5] objectAtIndexedSubscript:i];
    id v9 = [v8 order];
    uint64_t v10 = [v9 unsignedIntegerValue];

    if (i != v10)
    {
      objc_super v11 = [(FCPrivateDataController *)self localStore];
      float v12 = [v8 identifier];
      float v13 = [v11 objectForKey:v12];
      uint64_t v14 = (void *)[v13 mutableCopy];

      uint64_t v15 = [v8 dateAdded];
      objc_msgSend(v14, "fc_safelySetObjectAllowingNil:forKey:", v15, @"dateAdded");

      BOOL v16 = [NSNumber numberWithUnsignedInteger:i];
      objc_msgSend(v14, "fc_safelySetObjectAllowingNil:forKey:", v16, @"order");

      id v17 = NSStringFromShortcutType((__CFString *)[v8 shortcutType]);
      objc_msgSend(v14, "fc_safelySetObjectAllowingNil:forKey:", v17, @"type");

      id v18 = [(FCPrivateDataController *)self localStore];
      id v19 = [v8 identifier];
      [v18 setObject:v14 forKey:v19];

      long long v20 = [FCShortcut alloc];
      long long v21 = [v8 identifier];
      id v22 = -[FCShortcut initWithIdentifier:dictionaryRepresentation:](v20, v21, v14);

      [v28 addObject:v22];
    }
  }
  if ([v28 count])
  {
    if (self) {
      id v23 = self->_itemsLock;
    }
    else {
      id v23 = 0;
    }
    uint64_t v24 = v23;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __59__FCShortcutList_updateShortcutOrderForOrderedIdentifiers___block_invoke_3;
    v29[3] = &unk_1E5B4BE70;
    id v25 = v28;
    id v30 = v25;
    id v31 = self;
    [(FCMTWriterLock *)v24 performWriteSync:v29];

    __int16 v26 = [[FCModifyShortcutsCommand alloc] initWithShortcuts:v25 merge:0];
    [(FCPrivateDataController *)self addCommandToCommandQueue:v26];
    -[FCShortcutList _addedShortcuts:changedShortcuts:removedShortcuts:](self, MEMORY[0x1E4F1CBF0], v25, MEMORY[0x1E4F1CBF0]);
  }
  _Block_object_dispose(&v36, 8);
}

void __59__FCShortcutList_updateShortcutOrderForOrderedIdentifiers___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__FCShortcutList_updateShortcutOrderForOrderedIdentifiers___block_invoke_2;
  v6[3] = &unk_1E5B4CE60;
  v6[4] = a1[5];
  uint64_t v3 = objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", v6);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __59__FCShortcutList_updateShortcutOrderForOrderedIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 96);
  }
  else {
    uint64_t v3 = 0;
  }
  return [v3 objectForKey:a2];
}

void __59__FCShortcutList_updateShortcutOrderForOrderedIdentifiers___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        id v8 = *(void **)(a1 + 40);
        if (v8) {
          id v8 = (void *)v8[12];
        }
        id v9 = v8;
        uint64_t v10 = objc_msgSend(v7, "identifier", (void)v11);
        [v9 setObject:v7 forKey:v10];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (BOOL)containsShortcut:(id)a3
{
  if (self) {
    self = (FCShortcutList *)self->_shortcutsByID;
  }
  uint64_t v3 = [(FCShortcutList *)self objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

BOOL __35__FCShortcutList_validateShortcuts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 dateAdded];
  uint64_t v6 = [v4 dateAdded];

  BOOL v7 = [v5 compare:v6] == -1;
  return v7;
}

void __35__FCShortcutList_validateShortcuts__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 removeShortcutWithIdentifier:v3];
}

void __35__FCShortcutList_validateShortcuts__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isDeprecated])
  {
    uint64_t v5 = (void *)FCShortcutListLog;
    if (!os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = objc_msgSend(v4, "identifier", *(_OWORD *)v14);
      [v9 removeShortcutWithIdentifier:v10];
      goto LABEL_6;
    }
    uint64_t v6 = v5;
    BOOL v7 = [v4 identifier];
    *(_DWORD *)long long v14 = 138543362;
    *(void *)&v14[4] = v7;
    id v8 = "Removing deprecated favorite: <%{public}@>";
LABEL_4:
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, v8, v14, 0xCu);

    goto LABEL_5;
  }
  if ([v4 shortcutType]) {
    goto LABEL_8;
  }
  uint64_t v10 = [v4 identifier];
  if (!objc_msgSend(v10, "fc_isValidTagID"))
  {
    long long v11 = [v4 identifier];
    char v12 = objc_msgSend(v11, "fc_isValidPuzzleTypeID");

    if (v12) {
      goto LABEL_8;
    }
    long long v13 = (void *)FCShortcutListLog;
    if (!os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    uint64_t v6 = v13;
    BOOL v7 = [v4 identifier];
    *(_DWORD *)long long v14 = 138543362;
    *(void *)&v14[4] = v7;
    id v8 = "Removing favorite of type FCShortcutTypeTag with invalid tagID: <%{public}@>";
    goto LABEL_4;
  }
LABEL_6:

LABEL_8:
}

- (void)removeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FCShortcutList;
  [(FCPrivateDataController *)&v3 removeObserver:a3];
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return [a3 isEqualToString:@"Shortcuts"];
}

- (id)recordsForRestoringZoneName:(id)a3
{
  objc_super v3 = -[FCShortcutList _allShortcuts]((id *)&self->super.super.isa);
  id v4 = objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_33_0);

  return v4;
}

uint64_t __46__FCShortcutList_recordsForRestoringZoneName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 0;
}

+ (id)backingRecordZoneIDs
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1A320]);
  objc_super v3 = (void *)[v2 initWithZoneName:@"Shortcuts" ownerName:*MEMORY[0x1E4F19C08]];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  BOOL v7 = [v5 allKeys];
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
        char v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([a1 isLocalStoreKeyInternal:v12] & 1) == 0)
        {
          long long v13 = [v5 objectForKey:v12];
          id v14 = -[FCShortcut initWithIdentifier:dictionaryRepresentation:]([FCShortcut alloc], v12, v13);
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v9);
  }

  uint64_t v15 = FCShortcutListLog;
  if (os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v19 = 0;
    _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "Merging favorite data to icloud", v19, 2u);
  }
  uint64_t v16 = [[FCModifyShortcutsCommand alloc] initWithShortcuts:v6 merge:1];
  uint64_t v24 = v16;
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
  uint64_t v10 = objc_opt_new();
  long long v11 = objc_opt_new();
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__FCShortcutList_handleSyncWithChangedRecords_deletedRecordNames___block_invoke;
  v19[3] = &unk_1E5B4CEF0;
  id v20 = v6;
  id v21 = v8;
  long long v22 = self;
  id v23 = v9;
  id v24 = v10;
  id v25 = v7;
  id v26 = v11;
  id v13 = v11;
  id v14 = v7;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  id v18 = v6;
  [(FCMTWriterLock *)itemsLock performWriteSync:v19];
  -[FCShortcutList _addedShortcuts:changedShortcuts:removedShortcuts:](self, v16, v15, v13);
  [(FCShortcutList *)self validateShortcuts];
}

void __66__FCShortcutList_handleSyncWithChangedRecords_deletedRecordNames___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v63 objects:v78 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    id v5 = @"dateAdded";
    uint64_t v55 = *(void *)v64;
    *(void *)&long long v3 = 136315906;
    long long v53 = v3;
    uint64_t v58 = v1;
    do
    {
      uint64_t v6 = 0;
      uint64_t v57 = v4;
      do
      {
        if (*(void *)v64 != v55) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v63 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(v7, "recordID", v53);
        uint64_t v9 = [v8 recordName];

        uint64_t v10 = [*(id *)(v1 + 40) objectForKey:v9];
        long long v11 = [v7 objectForKeyedSubscript:v5];
        uint64_t v12 = [v7 objectForKeyedSubscript:@"order"];
        id v13 = v7;
        id v14 = v10;
        [v13 objectForKeyedSubscript:@"type"];
        v16 = id v15 = v5;
        if (v10)
        {
          id v17 = (void *)[v10 mutableCopy];
          id v18 = v11;
          id v19 = v17;
          v56 = v18;
          objc_msgSend(v17, "fc_safelySetObjectAllowingNil:forKey:");
          objc_msgSend(v19, "fc_safelySetObjectAllowingNil:forKey:", v12, @"order");
          objc_msgSend(v19, "fc_safelySetObjectAllowingNil:forKey:", v16, @"type");
          [*(id *)(v1 + 40) setObject:v19 forKey:v9];
          id v20 = (void *)v16;
          uint64_t v21 = v57;
          id v5 = v15;
          if (v9)
          {
            id v22 = -[FCShortcut initWithIdentifier:dictionaryRepresentation:]([FCShortcut alloc], v9, v19);
            uint64_t v23 = *(void *)(v58 + 48);
            if (v23) {
              id v24 = *(void **)(v23 + 96);
            }
            else {
              id v24 = 0;
            }
            [v24 setObject:v22 forKey:v9];
            [*(id *)(v58 + 64) addObject:v22];
            id v25 = FCShortcutListLog;
            if (os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138543362;
              v71 = (const char *)v9;
              _os_log_impl(&dword_1A460D000, v25, OS_LOG_TYPE_DEFAULT, "Modifying favorite when handling sync <%{public}@>", buf, 0xCu);
            }

            uint64_t v21 = v57;
            id v5 = @"dateAdded";
          }

          id v26 = (void *)v12;
          long long v11 = v56;
          goto LABEL_14;
        }
        if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          id v33 = v11;
          v34 = (void *)[[NSString alloc] initWithFormat:@"should never have a shortcut list shortcut without an item ID"];
          *(_DWORD *)long long buf = v53;
          v71 = "-[FCShortcutList handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke";
          __int16 v72 = 2080;
          v73 = "FCShortcutList.m";
          __int16 v74 = 1024;
          int v75 = 354;
          __int16 v76 = 2114;
          v77 = v34;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          long long v11 = v33;
        }
        id v20 = (void *)v16;
        uint64_t v21 = v57;
        id v5 = v15;
        if (!v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v35 = (void *)[[NSString alloc] initWithFormat:@"should never have a shortcut list shortcut without a date added"];
          *(_DWORD *)long long buf = v53;
          v71 = "-[FCShortcutList handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke";
          __int16 v72 = 2080;
          v73 = "FCShortcutList.m";
          __int16 v74 = 1024;
          int v75 = 355;
          __int16 v76 = 2114;
          v77 = v35;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          long long v11 = 0;
        }
        id v26 = (void *)v12;
        if (!v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          uint64_t v36 = v11;
          v37 = (void *)[[NSString alloc] initWithFormat:@"should never have a shortcut list shortcut without an order value"];
          *(_DWORD *)long long buf = v53;
          v71 = "-[FCShortcutList handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke";
          __int16 v72 = 2080;
          v73 = "FCShortcutList.m";
          __int16 v74 = 1024;
          int v75 = 356;
          __int16 v76 = 2114;
          v77 = v37;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          long long v11 = v36;
          if (v20)
          {
LABEL_25:
            if (v9 && v11 && v12)
            {
              v68[0] = v5;
              v68[1] = @"order";
              id v27 = v11;
              v69[0] = v11;
              v69[1] = v12;
              v68[2] = @"type";
              v69[2] = v20;
              id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:3];
              id v29 = -[FCShortcut initWithIdentifier:dictionaryRepresentation:]([FCShortcut alloc], v9, v28);
              uint64_t v30 = *(void *)(v58 + 48);
              if (v30) {
                id v31 = *(void **)(v30 + 96);
              }
              else {
                id v31 = 0;
              }
              [v31 setObject:v29 forKey:v9];
              [*(id *)(v58 + 40) setObject:v28 forKey:v9];
              [*(id *)(v58 + 56) addObject:v29];
              uint64_t v32 = FCShortcutListLog;
              if (os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138543362;
                v71 = (const char *)v9;
                _os_log_impl(&dword_1A460D000, v32, OS_LOG_TYPE_DEFAULT, "Adding favorite when handling sync <%{public}@>", buf, 0xCu);
              }

              uint64_t v21 = v57;
              id v5 = @"dateAdded";
              long long v11 = v27;
              id v14 = 0;
            }
            goto LABEL_14;
          }
        }
        else if (v20)
        {
          goto LABEL_25;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          uint64_t v38 = v11;
          v39 = (void *)[[NSString alloc] initWithFormat:@"should never have a shortcut list shortcut without a type"];
          *(_DWORD *)long long buf = v53;
          v71 = "-[FCShortcutList handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke";
          __int16 v72 = 2080;
          v73 = "FCShortcutList.m";
          __int16 v74 = 1024;
          int v75 = 357;
          __int16 v76 = 2114;
          v77 = v39;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          long long v11 = v38;
        }
LABEL_14:

        ++v6;
        uint64_t v1 = v58;
      }
      while (v21 != v6);
      uint64_t v40 = [obj countByEnumeratingWithState:&v63 objects:v78 count:16];
      uint64_t v4 = v40;
    }
    while (v40);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v41 = *(id *)(v1 + 72);
  uint64_t v42 = [v41 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v60;
    do
    {
      uint64_t v45 = 0;
      do
      {
        if (*(void *)v60 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = *(void **)(*((void *)&v59 + 1) + 8 * v45);
        v47 = [*(id *)(v1 + 40) objectForKey:v46];
        if (v47)
        {
          id v48 = -[FCShortcut initWithIdentifier:dictionaryRepresentation:]([FCShortcut alloc], v46, v47);
          uint64_t v49 = *(void *)(v1 + 48);
          if (v49) {
            v50 = *(void **)(v49 + 96);
          }
          else {
            v50 = 0;
          }
          [v50 removeObjectForKey:v46];
          [*(id *)(v1 + 40) removeObjectForKey:v46];
          [*(id *)(v1 + 80) addObject:v48];
          v51 = FCShortcutListLog;
          if (os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            v71 = (const char *)v46;
            _os_log_impl(&dword_1A460D000, v51, OS_LOG_TYPE_DEFAULT, "Removing favorite when handling sync <%{public}@>", buf, 0xCu);
          }
        }
        ++v45;
      }
      while (v43 != v45);
      uint64_t v52 = [v41 countByEnumeratingWithState:&v59 objects:v67 count:16];
      uint64_t v43 = v52;
    }
    while (v52);
  }
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3);
  if (self) {
    shortcutsByID = self->_shortcutsByID;
  }
  else {
    shortcutsByID = 0;
  }
  id v5 = [(NSMutableDictionary *)shortcutsByID allValues];
  uint64_t v6 = objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_50_0);

  return v6;
}

uint64_t __60__FCShortcutList_allKnownRecordNamesWithinRecordZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __40__FCShortcutList__moveShortcut_toIndex___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  if (v1) {
    uint64_t v1 = (void *)v1[12];
  }
  uint64_t v2 = a1[5];
  long long v3 = (void *)a1[6];
  uint64_t v4 = v1;
  id v5 = [v3 identifier];
  [v4 setObject:v2 forKey:v5];
}

uint64_t __35__FCShortcutList__orderedShortcuts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 order];
  uint64_t v6 = [v4 order];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_shortcutsByID, 0);
}

@end