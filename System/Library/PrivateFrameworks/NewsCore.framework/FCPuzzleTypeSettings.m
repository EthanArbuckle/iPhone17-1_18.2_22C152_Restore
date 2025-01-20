@interface FCPuzzleTypeSettings
+ (id)commandsToMergeLocalDataToCloud:(id)a3;
- (FCPuzzleTypeSettings)initWithStore:(id)a3 delegate:(id)a4;
- (id)_allEntriesInPuzzleTypeSettings;
- (id)_puzzleTypeSettingsEntryForPuzzleTypeID:(id *)a1;
- (id)allPuzzleTypeSettingsRecordNames;
- (id)allPuzzleTypeSettingsRecords;
- (id)lastSeenPuzzleIDsForPuzzleTypeID:(id)a3;
- (id)settingsDataForPuzzleTypeID:(id)a3;
- (void)handleSyncWithDeletedPuzzleTypeSettingsRecordName:(id)a3;
- (void)handleSyncWithPuzzleTypeSettingsRecord:(id)a3;
- (void)loadLocalCachesFromStore;
- (void)setLastSeenPuzzleIDs:(id)a3 puzzleTypeID:(id)a4;
- (void)setSettingsData:(id)a3 puzzleTypeID:(id)a4;
- (void)setSettingsData:(void *)a3 lastSeenPuzzleIDs:(void *)a4 puzzleTypeID:;
- (void)syncForPuzzleTypeID:(id)a3;
@end

@implementation FCPuzzleTypeSettings

void __48__FCPuzzleTypeSettings_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v23 = a1;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    objc_storeStrong((id *)(v3 + 16), v2);
  }

  v4 = *(void **)(a1 + 32);
  if (v4) {
    v4 = (void *)v4[3];
  }
  v5 = v4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v6 = [v5 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (([(id)objc_opt_class() isLocalStoreKeyInternal:v11] & 1) == 0)
        {
          objc_opt_class();
          v12 = [v5 objectForKey:v11];
          if (v12)
          {
            if (objc_opt_isKindOfClass()) {
              v13 = v12;
            }
            else {
              v13 = 0;
            }
          }
          else
          {
            v13 = 0;
          }
          id v14 = v13;

          if (v14)
          {
            uint64_t v15 = [v14 objectForKey:@"puzzleTypeID"];
            if (v15)
            {
              v16 = (void *)v15;
              v17 = [v14 objectForKey:@"settingsData"];
              if (v17)
              {

                goto LABEL_21;
              }
              v18 = [v14 objectForKey:@"lastSeenPuzzleIDs"];

              if (v18)
              {
LABEL_21:
                id v19 = -[FCPuzzleTypeSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCPuzzleTypeSettingsEntry alloc], v11, v14);
                if (v19)
                {
                  v20 = *(void **)(v23 + 32);
                  if (v20) {
                    v20 = (void *)v20[2];
                  }
                  v21 = v20;
                  v22 = [v19 puzzleTypeID];
                  [v21 setObject:v19 forKey:v22];
                }
              }
            }
          }

          continue;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }
}

- (void)loadLocalCachesFromStore
{
  if (self) {
    entriesLock = self->_entriesLock;
  }
  else {
    entriesLock = 0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__FCPuzzleTypeSettings_loadLocalCachesFromStore__block_invoke;
  v3[3] = &unk_1E5B4C018;
  v3[4] = self;
  [(FCMTWriterLock *)entriesLock performWriteSync:v3];
}

- (FCPuzzleTypeSettings)initWithStore:(id)a3 delegate:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCPuzzleTypeSettings;
  uint64_t v9 = [(FCPuzzleTypeSettings *)&v16 init];
  if (v9)
  {
    if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "store");
      *(_DWORD *)buf = 136315906;
      v18 = "-[FCPuzzleTypeSettings initWithStore:delegate:]";
      __int16 v19 = 2080;
      v20 = "FCPuzzleTypeSettings.m";
      __int16 v21 = 1024;
      int v22 = 46;
      __int16 v23 = 2114;
      long long v24 = v15;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    objc_storeStrong((id *)&v9->_localStore, a3);
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10 = objc_alloc_init(FCMTWriterLock);
    entriesLock = v9->_entriesLock;
    v9->_entriesLock = v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    entriesByPuzzleTypeID = v9->_entriesByPuzzleTypeID;
    v9->_entriesByPuzzleTypeID = (NSMutableDictionary *)v12;
  }
  return v9;
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  __int16 v21 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v4 = [v3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([(id)objc_opt_class() isLocalStoreKeyInternal:v9] & 1) == 0)
        {
          objc_opt_class();
          v10 = [v3 objectForKey:v9];
          if (v10)
          {
            if (objc_opt_isKindOfClass()) {
              v11 = v10;
            }
            else {
              v11 = 0;
            }
          }
          else
          {
            v11 = 0;
          }
          id v12 = v11;

          if (v12)
          {
            uint64_t v13 = [v12 objectForKey:@"puzzleTypeID"];
            if (v13)
            {
              id v14 = (void *)v13;
              uint64_t v15 = [v12 objectForKey:@"settingsData"];
              if (v15)
              {

                goto LABEL_17;
              }
              objc_super v16 = [v12 objectForKey:@"lastSeenPuzzleIDs"];

              if (v16)
              {
LABEL_17:
                id v17 = -[FCPuzzleTypeSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCPuzzleTypeSettingsEntry alloc], v9, v12);
                [v21 addObject:v17];
              }
            }
          }

          continue;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  v18 = [[FCModifyPuzzleTypeSettingsCommand alloc] initWithPuzzleTypeSettingsEntries:v21 merge:1];
  long long v26 = v18;
  __int16 v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];

  return v19;
}

- (void)syncForPuzzleTypeID:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    p_isa = (id *)&self->super.isa;
    v4 = -[FCPuzzleTypeSettings _puzzleTypeSettingsEntryForPuzzleTypeID:]((id *)&self->super.isa, a3);
    if (v4)
    {
      uint64_t v5 = [FCModifyPuzzleTypeSettingsCommand alloc];
      v8[0] = v4;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
      uint64_t v7 = [(FCModifyPuzzleTypeSettingsCommand *)v5 initWithPuzzleTypeSettingsEntries:v6 merge:1];

      if (p_isa) {
        p_isa = (id *)objc_loadWeakRetained(p_isa + 4);
      }
      [p_isa addModifyPuzzleTypeSettingsCommandToCommandQueue:v7];
    }
  }
}

- (id)_puzzleTypeSettingsEntryForPuzzleTypeID:(id *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__72;
    uint64_t v15 = __Block_byref_object_dispose__72;
    id v16 = 0;
    if (v3)
    {
      id v5 = a1[1];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      void v8[2] = __64__FCPuzzleTypeSettings__puzzleTypeSettingsEntryForPuzzleTypeID___block_invoke;
      v8[3] = &unk_1E5B4C230;
      v10 = &v11;
      v8[4] = a1;
      id v9 = v4;
      [v5 performReadSync:v8];

      uint64_t v6 = (void *)v12[5];
    }
    else
    {
      uint64_t v6 = 0;
    }
    a1 = v6;
    _Block_object_dispose(&v11, 8);
  }
  return a1;
}

- (void)setSettingsData:(id)a3 puzzleTypeID:(id)a4
{
}

- (void)setSettingsData:(void *)a3 lastSeenPuzzleIDs:(void *)a4 puzzleTypeID:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    if (v9)
    {
      v10 = [NSString stringWithFormat:@"ps-%@", v9];
      uint64_t v11 = [*(id *)(a1 + 24) objectForKey:v10];
      id v12 = v11;
      if (v11)
      {
        uint64_t v13 = (void *)[v11 mutableCopy];
        id v14 = v13;
        if (v7) {
          [v13 setObject:v7 forKeyedSubscript:@"settingsData"];
        }
        if (v8) {
          [v14 setObject:v8 forKeyedSubscript:@"lastSeenPuzzleIDs"];
        }
        uint64_t v15 = (FCPuzzleTypeSettingsEntry *)-[FCPuzzleTypeSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCPuzzleTypeSettingsEntry alloc], v10, v14);

        if (v15) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v15 = [[FCPuzzleTypeSettingsEntry alloc] initWithEntryID:v10 puzzleTypeID:v9 settingsData:v7 lastSeenPuzzleIDs:v8];
        if (v15)
        {
LABEL_9:
          id v16 = [(FCPuzzleTypeSettingsEntry *)v15 puzzleTypeID];

          if (!v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v31 = (void *)[[NSString alloc] initWithFormat:@"puzzleTypeSettingsEntry must have a puzzleTypeID"];
            *(_DWORD *)buf = 136315906;
            v37 = "-[FCPuzzleTypeSettingsEntry(FCPuzzleTypeSettings) dictionaryRepresentation]";
            __int16 v38 = 2080;
            v39 = "FCPuzzleTypeSettings.m";
            __int16 v40 = 1024;
            int v41 = 341;
            __int16 v42 = 2114;
            v43 = v31;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          id v17 = [MEMORY[0x1E4F1CA60] dictionary];
          v18 = [(FCPuzzleTypeSettingsEntry *)v15 puzzleTypeID];

          if (v18)
          {
            __int16 v19 = [(FCPuzzleTypeSettingsEntry *)v15 puzzleTypeID];
            [v17 setObject:v19 forKey:@"puzzleTypeID"];
          }
          v20 = [(FCPuzzleTypeSettingsEntry *)v15 settingsData];

          if (v20)
          {
            __int16 v21 = [(FCPuzzleTypeSettingsEntry *)v15 settingsData];
            [v17 setObject:v21 forKey:@"settingsData"];
          }
          long long v22 = [(FCPuzzleTypeSettingsEntry *)v15 lastSeenPuzzleIDs];

          if (v22)
          {
            long long v23 = [(FCPuzzleTypeSettingsEntry *)v15 lastSeenPuzzleIDs];
            [v17 setObject:v23 forKey:@"lastSeenPuzzleIDs"];
          }
          [*(id *)(a1 + 24) setObject:v17 forKey:v10];
          long long v24 = *(void **)(a1 + 8);
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __71__FCPuzzleTypeSettings_setSettingsData_lastSeenPuzzleIDs_puzzleTypeID___block_invoke;
          v32[3] = &unk_1E5B4C738;
          v32[4] = a1;
          long long v25 = v15;
          v33 = v25;
          id v34 = v9;
          [v24 performWriteSync:v32];
          long long v26 = [FCModifyPuzzleTypeSettingsCommand alloc];
          v35 = v25;
          long long v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
          uint64_t v28 = [(FCModifyPuzzleTypeSettingsCommand *)v26 initWithPuzzleTypeSettingsEntries:v27 merge:1];

          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
          [WeakRetained addModifyPuzzleTypeSettingsCommandToCommandQueue:v28];

LABEL_24:
          goto LABEL_25;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "entry");
        *(_DWORD *)buf = 136315906;
        v37 = "-[FCPuzzleTypeSettings setSettingsData:lastSeenPuzzleIDs:puzzleTypeID:]";
        __int16 v38 = 2080;
        v39 = "FCPuzzleTypeSettings.m";
        __int16 v40 = 1024;
        int v41 = 171;
        __int16 v42 = 2114;
        v43 = v30;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      goto LABEL_24;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleTypeID != nil");
      *(_DWORD *)buf = 136315906;
      v37 = "-[FCPuzzleTypeSettings setSettingsData:lastSeenPuzzleIDs:puzzleTypeID:]";
      __int16 v38 = 2080;
      v39 = "FCPuzzleTypeSettings.m";
      __int16 v40 = 1024;
      int v41 = 138;
      __int16 v42 = 2114;
      v43 = v10;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_25:
    }
  }
}

- (void)setLastSeenPuzzleIDs:(id)a3 puzzleTypeID:(id)a4
{
}

uint64_t __71__FCPuzzleTypeSettings_setSettingsData_lastSeenPuzzleIDs_puzzleTypeID___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  if (v1) {
    v1 = (void *)v1[2];
  }
  return [v1 setObject:a1[5] forKey:a1[6]];
}

- (id)settingsDataForPuzzleTypeID:(id)a3
{
  id v3 = -[FCPuzzleTypeSettings _puzzleTypeSettingsEntryForPuzzleTypeID:]((id *)&self->super.isa, a3);
  v4 = [v3 settingsData];

  return v4;
}

- (id)lastSeenPuzzleIDsForPuzzleTypeID:(id)a3
{
  id v3 = -[FCPuzzleTypeSettings _puzzleTypeSettingsEntryForPuzzleTypeID:]((id *)&self->super.isa, a3);
  v4 = [v3 lastSeenPuzzleIDs];

  return v4;
}

- (void)handleSyncWithPuzzleTypeSettingsRecord:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"puzzleTypeID"];
  long long v26 = [v4 objectForKeyedSubscript:@"settingsData"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"lastSeenPuzzleIDs"];
  if (self) {
    localStore = self->_localStore;
  }
  else {
    localStore = 0;
  }
  id v8 = localStore;
  id v9 = [v4 recordID];

  v10 = [v9 recordName];

  uint64_t v11 = [(FCKeyValueStore *)v8 objectForKey:v10];
  id v12 = v11;
  if (v11)
  {
    uint64_t v13 = (void *)[v11 mutableCopy];
    id v14 = v13;
    if (v26) {
      [v13 setObject:v26 forKeyedSubscript:@"settingsData"];
    }
    if (v6) {
      [v14 setObject:v6 forKeyedSubscript:@"lastSeenPuzzleIDs"];
    }
    [(FCKeyValueStore *)v8 setObject:v14 forKey:v10];
    if (v5)
    {
      id v15 = -[FCPuzzleTypeSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCPuzzleTypeSettingsEntry alloc], v10, v14);
      id v16 = v15;
      if (self) {
        entriesLock = self->_entriesLock;
      }
      else {
        entriesLock = 0;
      }
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __63__FCPuzzleTypeSettings_handleSyncWithPuzzleTypeSettingsRecord___block_invoke_2;
      v27[3] = &unk_1E5B4C738;
      v27[4] = self;
      id v28 = v15;
      id v29 = v5;
      id v18 = v16;
      [(FCMTWriterLock *)entriesLock performWriteSync:v27];
    }
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    }
    else {
      id WeakRetained = 0;
    }
    [WeakRetained settingsDataDidChangeForPuzzleTypeID:v5];
LABEL_25:

    goto LABEL_26;
  }
  if (v5)
  {
    id v14 = [MEMORY[0x1E4F1CA60] dictionary];
    [v14 setObject:v5 forKey:@"puzzleTypeID"];
    if (v26) {
      [v14 setObject:v26 forKey:@"settingsData"];
    }
    if (v6) {
      [v14 setObject:v6 forKey:@"lastSeenPuzzleIDs"];
    }
    v20 = [FCPuzzleTypeSettingsEntry alloc];
    __int16 v21 = (void *)[v14 copy];
    id v22 = -[FCPuzzleTypeSettingsEntry initWithEntryID:dictionaryRepresentation:](v20, v10, v21);

    if (self) {
      long long v23 = self->_entriesLock;
    }
    else {
      long long v23 = 0;
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __63__FCPuzzleTypeSettings_handleSyncWithPuzzleTypeSettingsRecord___block_invoke;
    v30[3] = &unk_1E5B4C738;
    v30[4] = self;
    id WeakRetained = v22;
    id v31 = WeakRetained;
    id v24 = v5;
    id v32 = v24;
    [(FCMTWriterLock *)v23 performWriteSync:v30];
    if (self) {
      self = (FCPuzzleTypeSettings *)objc_loadWeakRetained((id *)&self->_delegate);
    }
    [(FCPuzzleTypeSettings *)self settingsDataDidChangeForPuzzleTypeID:v24];

    [(FCKeyValueStore *)v8 setObject:v14 forKey:v10];
    goto LABEL_25;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v25 = (void *)[[NSString alloc] initWithFormat:@"should never have a puzzleTypeSettings entry without a puzzleTypeID"];
    *(_DWORD *)buf = 136315906;
    id v34 = "-[FCPuzzleTypeSettings handleSyncWithPuzzleTypeSettingsRecord:]";
    __int16 v35 = 2080;
    v36 = "FCPuzzleTypeSettings.m";
    __int16 v37 = 1024;
    int v38 = 211;
    __int16 v39 = 2114;
    __int16 v40 = v25;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_26:
}

uint64_t __63__FCPuzzleTypeSettings_handleSyncWithPuzzleTypeSettingsRecord___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  if (v1) {
    v1 = (void *)v1[2];
  }
  return [v1 setObject:a1[5] forKey:a1[6]];
}

uint64_t __63__FCPuzzleTypeSettings_handleSyncWithPuzzleTypeSettingsRecord___block_invoke_2(void *a1)
{
  v1 = (void *)a1[4];
  if (v1) {
    v1 = (void *)v1[2];
  }
  return [v1 setObject:a1[5] forKey:a1[6]];
}

- (void)handleSyncWithDeletedPuzzleTypeSettingsRecordName:(id)a3
{
  id v4 = a3;
  if (self) {
    localStore = self->_localStore;
  }
  else {
    localStore = 0;
  }
  uint64_t v6 = [(FCKeyValueStore *)localStore objectForKey:v4];
  if (v6)
  {
    if (self) {
      id v7 = self->_localStore;
    }
    else {
      id v7 = 0;
    }
    [(FCKeyValueStore *)v7 removeObjectForKey:v4];
    id v8 = [v6 objectForKeyedSubscript:@"puzzleTypeID"];
    id v9 = v8;
    if (v8)
    {
      if (self) {
        entriesLock = self->_entriesLock;
      }
      else {
        entriesLock = 0;
      }
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      id v14 = __74__FCPuzzleTypeSettings_handleSyncWithDeletedPuzzleTypeSettingsRecordName___block_invoke;
      id v15 = &unk_1E5B4BE70;
      id v16 = self;
      id v11 = v8;
      id v17 = v11;
      [(FCMTWriterLock *)entriesLock performWriteSync:&v12];
      if (self) {
        self = (FCPuzzleTypeSettings *)objc_loadWeakRetained((id *)&self->_delegate);
      }
      -[FCPuzzleTypeSettings settingsDataDidChangeForPuzzleTypeID:](self, "settingsDataDidChangeForPuzzleTypeID:", v11, v12, v13, v14, v15, v16);
    }
  }
}

uint64_t __74__FCPuzzleTypeSettings_handleSyncWithDeletedPuzzleTypeSettingsRecordName___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[2];
  }
  return objc_msgSend(v1, "fc_safelySetObject:forKey:", 0, *(void *)(a1 + 40));
}

- (id)allPuzzleTypeSettingsRecordNames
{
  v2 = -[FCPuzzleTypeSettings _allEntriesInPuzzleTypeSettings]((id *)&self->super.isa);
  id v3 = objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_165);

  return v3;
}

- (id)_allEntriesInPuzzleTypeSettings
{
  v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = &v5;
    uint64_t v7 = 0x3032000000;
    id v8 = __Block_byref_object_copy__72;
    id v9 = __Block_byref_object_dispose__72;
    id v10 = 0;
    id v2 = a1[1];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__FCPuzzleTypeSettings__allEntriesInPuzzleTypeSettings__block_invoke;
    v4[3] = &unk_1E5B4C258;
    v4[4] = v1;
    v4[5] = &v5;
    [v2 performReadSync:v4];

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

uint64_t __56__FCPuzzleTypeSettings_allPuzzleTypeSettingsRecordNames__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)allPuzzleTypeSettingsRecords
{
  id v2 = -[FCPuzzleTypeSettings _allEntriesInPuzzleTypeSettings]((id *)&self->super.isa);
  id v3 = objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_24);

  return v3;
}

uint64_t __52__FCPuzzleTypeSettings_allPuzzleTypeSettingsRecords__block_invoke(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
}

void __64__FCPuzzleTypeSettings__puzzleTypeSettingsEntryForPuzzleTypeID___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2) {
    id v2 = (void *)v2[2];
  }
  uint64_t v3 = a1[5];
  uint64_t v7 = v2;
  uint64_t v4 = [v7 objectForKey:v3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __55__FCPuzzleTypeSettings__allEntriesInPuzzleTypeSettings__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[2];
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_entriesByPuzzleTypeID, 0);
  objc_storeStrong((id *)&self->_entriesLock, 0);
}

@end