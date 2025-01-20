@interface FCTagSettings
+ (id)commandsToMergeLocalDataToCloud:(id)a3;
- (FCTagSettings)initWithStore:(id)a3 tagSettingsDelegate:(id)a4;
- (id)accessTokenForTagID:(id)a3;
- (id)allTagSettingsRecordNames;
- (id)allTagSettingsRecords;
- (id)authenticatedAccessTokensByTagID;
- (id)contentScaleForTagID:(id)a3;
- (id)fontSizeForTagID:(id)a3;
- (id)webAccessOptedInTagIDs;
- (void)handleSyncWithDeletedTagSettingsRecordName:(id)a3;
- (void)handleSyncWithTagSettingsRecord:(id)a3;
- (void)loadLocalCachesFromStore;
- (void)setAccessTokenForTagID:(id)a3 accessToken:(id)a4 userInitiated:(BOOL)a5;
- (void)setContentScaleForTagID:(id)a3 contentScale:(id)a4;
- (void)setFontSizeForTagID:(id)a3 fontSize:(id)a4;
- (void)setWebAccessOptInForTagID:(id)a3 webAccessOptIn:(BOOL)a4;
- (void)syncForTagID:(id)a3;
@end

@implementation FCTagSettings

- (void)loadLocalCachesFromStore
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  if (self)
  {
    objc_storeStrong((id *)&self->_tagSettingsEntriesByTagID, v3);

    localStore = self->_localStore;
  }
  else
  {

    localStore = 0;
  }
  v6 = localStore;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v7 = [(FCKeyValueStore *)v6 allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    v11 = @"tagID";
    do
    {
      uint64_t v12 = 0;
      uint64_t v32 = v9;
      do
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * v12);
        if (([(id)objc_opt_class() isLocalStoreKeyInternal:v13] & 1) == 0)
        {
          objc_opt_class();
          v14 = [(FCKeyValueStore *)v6 objectForKey:v13];
          if (v14)
          {
            if (objc_opt_isKindOfClass()) {
              v15 = v14;
            }
            else {
              v15 = 0;
            }
          }
          else
          {
            v15 = 0;
          }
          id v16 = v15;

          if (!v16) {
            goto LABEL_27;
          }
          uint64_t v17 = [v16 objectForKey:v11];
          if (!v17) {
            goto LABEL_27;
          }
          v18 = (void *)v17;
          v19 = [v16 objectForKey:@"fontMultiplier"];
          if (v19
            || ([v16 objectForKey:@"fontMultiplierMacOS"],
                (v19 = objc_claimAutoreleasedReturnValue()) != 0)
            || ([v16 objectForKey:@"contentScale"],
                (v19 = objc_claimAutoreleasedReturnValue()) != 0))
          {
LABEL_21:
          }
          else
          {
            v20 = [v16 objectForKey:@"contentScaleMacOS"];
            if (v20)
            {

              v19 = 0;
              goto LABEL_21;
            }
            v30 = [v16 objectForKey:@"accessToken"];

            if (!v30)
            {
LABEL_27:

              goto LABEL_28;
            }
          }
          id v21 = -[FCTagSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCTagSettingsEntry alloc], v16);
          if (v21)
          {
            uint64_t v22 = v10;
            v23 = v11;
            v24 = v7;
            v25 = v6;
            if (self)
            {
              v26 = self;
              tagSettingsEntriesByTagID = self->_tagSettingsEntriesByTagID;
            }
            else
            {
              v26 = 0;
              tagSettingsEntriesByTagID = 0;
            }
            v28 = tagSettingsEntriesByTagID;
            v29 = [v21 tagID];
            [(NSMutableDictionary *)v28 setObject:v21 forKey:v29];

            self = v26;
            v6 = v25;
            v7 = v24;
            v11 = v23;
            uint64_t v10 = v22;
            uint64_t v9 = v32;
          }

          goto LABEL_27;
        }
LABEL_28:
        ++v12;
      }
      while (v9 != v12);
      uint64_t v31 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
      uint64_t v9 = v31;
    }
    while (v31);
  }
}

- (id)webAccessOptedInTagIDs
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  if (self) {
    self = (FCTagSettings *)self->_tagSettingsEntriesByTagID;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__FCTagSettings_webAccessOptedInTagIDs__block_invoke;
  v6[3] = &unk_1E5B55700;
  id v4 = v3;
  id v7 = v4;
  [(FCTagSettings *)self enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

- (FCTagSettings)initWithStore:(id)a3 tagSettingsDelegate:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCTagSettings;
  uint64_t v9 = [(FCTagSettings *)&v12 init];
  if (v9)
  {
    if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "store");
      *(_DWORD *)buf = 136315906;
      v14 = "-[FCTagSettings initWithStore:tagSettingsDelegate:]";
      __int16 v15 = 2080;
      id v16 = "FCTagSettings.m";
      __int16 v17 = 1024;
      int v18 = 43;
      __int16 v19 = 2114;
      v20 = v11;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    objc_storeStrong((id *)&v9->_localStore, a3);
    objc_storeWeak((id *)&v9->_delegate, v8);
  }

  return v9;
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
  v23 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = [v3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * v8);
        if (([(id)objc_opt_class() isLocalStoreKeyInternal:v9] & 1) == 0)
        {
          objc_opt_class();
          uint64_t v10 = [v3 objectForKey:v9];
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

          if (!v12) {
            goto LABEL_23;
          }
          uint64_t v13 = [v12 objectForKey:@"tagID"];
          if (!v13) {
            goto LABEL_23;
          }
          v14 = (void *)v13;
          __int16 v15 = [v12 objectForKey:@"fontMultiplier"];
          if (v15
            || ([v12 objectForKey:@"fontMultiplierMacOS"],
                (__int16 v15 = objc_claimAutoreleasedReturnValue()) != 0)
            || ([v12 objectForKey:@"contentScale"],
                (__int16 v15 = objc_claimAutoreleasedReturnValue()) != 0))
          {
LABEL_19:
          }
          else
          {
            id v16 = [v12 objectForKey:@"contentScaleMacOS"];
            if (v16)
            {

              __int16 v15 = 0;
              goto LABEL_19;
            }
            int v18 = [v12 objectForKey:@"accessToken"];

            if (!v18)
            {
LABEL_23:

              goto LABEL_24;
            }
          }
          id v17 = -[FCTagSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCTagSettingsEntry alloc], v12);
          if (v17) {
            [v23 addObject:v17];
          }

          goto LABEL_23;
        }
LABEL_24:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v19 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v6 = v19;
    }
    while (v19);
  }

  v20 = [[FCModifyTagSettingsCommand alloc] initWithTagSettingsEntries:v23 merge:1];
  [v22 addObject:v20];

  return v22;
}

- (void)syncForTagID:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    p_isa = (id *)&self->super.isa;
    if (self) {
      tagSettingsEntriesByTagID = self->_tagSettingsEntriesByTagID;
    }
    else {
      tagSettingsEntriesByTagID = 0;
    }
    uint64_t v6 = tagSettingsEntriesByTagID;
    uint64_t v7 = [(NSMutableDictionary *)v6 objectForKey:a3];

    if (v7)
    {
      uint64_t v8 = [FCModifyTagSettingsCommand alloc];
      v11[0] = v7;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      uint64_t v10 = [(FCModifyTagSettingsCommand *)v8 initWithTagSettingsEntries:v9 merge:1];

      if (p_isa) {
        p_isa = (id *)objc_loadWeakRetained(p_isa + 3);
      }
      [p_isa addModifyTagSettingsCommandToCommandQueue:v10];
    }
  }
}

- (void)setFontSizeForTagID:(id)a3 fontSize:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v6)
  {
    uint64_t v8 = [NSString stringWithFormat:@"ts-%@", v6];
    if (self) {
      localStore = self->_localStore;
    }
    else {
      localStore = 0;
    }
    uint64_t v10 = [(FCKeyValueStore *)localStore objectForKey:v8];
    v11 = v10;
    if (v10)
    {
      id v12 = (void *)[v10 mutableCopy];
      uint64_t v13 = v12;
      if (v7) {
        [v12 setObject:v7 forKeyedSubscript:@"fontMultiplier"];
      }
      else {
        [v12 removeObjectForKey:@"fontMultiplier"];
      }
      __int16 v15 = (FCTagSettingsEntry *)-[FCTagSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCTagSettingsEntry alloc], v13);
    }
    else
    {
      v14 = [FCTagSettingsEntry alloc];
      uint64_t v13 = [NSString stringWithFormat:@"ts-%@", v6];
      LOBYTE(v20) = 0;
      __int16 v15 = [(FCTagSettingsEntry *)v14 initWithEntryID:v13 tagID:v6 fontMultiplier:v7 fontMultiplierMacOS:0 contentScale:0 contentScaleMacOS:0 accessToken:0 webAccessOptIn:v20];
    }
    id v16 = v15;

    if (v16)
    {
      id v17 = -[FCTagSettingsEntry dictionaryRepresentation](v16);
      if (self)
      {
        [(FCKeyValueStore *)self->_localStore setObject:v17 forKey:v8];
        tagSettingsEntriesByTagID = self->_tagSettingsEntriesByTagID;
      }
      else
      {
        [0 setObject:v17 forKey:v8];
        tagSettingsEntriesByTagID = 0;
      }
      [(NSMutableDictionary *)tagSettingsEntriesByTagID setObject:v16 forKey:v6];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "entry");
      *(_DWORD *)buf = 136315906;
      uint64_t v22 = "-[FCTagSettings setFontSizeForTagID:fontSize:]";
      __int16 v23 = 2080;
      long long v24 = "FCTagSettings.m";
      __int16 v25 = 1024;
      int v26 = 188;
      __int16 v27 = 2114;
      v28 = v19;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v22 = "-[FCTagSettings setFontSizeForTagID:fontSize:]";
    __int16 v23 = 2080;
    long long v24 = "FCTagSettings.m";
    __int16 v25 = 1024;
    int v26 = 135;
    __int16 v27 = 2114;
    v28 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_19:
  }
}

- (id)fontSizeForTagID:(id)a3
{
  if (self) {
    self = (FCTagSettings *)self->_tagSettingsEntriesByTagID;
  }
  id v3 = [(FCTagSettings *)self objectForKey:a3];
  id v4 = [v3 fontMultiplier];

  return v4;
}

- (void)setContentScaleForTagID:(id)a3 contentScale:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v6)
  {
    uint64_t v8 = [NSString stringWithFormat:@"ts-%@", v6];
    if (self) {
      localStore = self->_localStore;
    }
    else {
      localStore = 0;
    }
    uint64_t v10 = [(FCKeyValueStore *)localStore objectForKey:v8];
    v11 = v10;
    if (v10)
    {
      id v12 = (void *)[v10 mutableCopy];
      uint64_t v13 = v12;
      if (v7) {
        [v12 setObject:v7 forKeyedSubscript:@"contentScale"];
      }
      else {
        [v12 removeObjectForKey:@"contentScale"];
      }
      __int16 v15 = (FCTagSettingsEntry *)-[FCTagSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCTagSettingsEntry alloc], v13);
    }
    else
    {
      v14 = [FCTagSettingsEntry alloc];
      uint64_t v13 = [NSString stringWithFormat:@"ts-%@", v6];
      LOBYTE(v20) = 0;
      __int16 v15 = [(FCTagSettingsEntry *)v14 initWithEntryID:v13 tagID:v6 fontMultiplier:0 fontMultiplierMacOS:0 contentScale:v7 contentScaleMacOS:0 accessToken:0 webAccessOptIn:v20];
    }
    id v16 = v15;

    if (v16)
    {
      id v17 = -[FCTagSettingsEntry dictionaryRepresentation](v16);
      if (self)
      {
        [(FCKeyValueStore *)self->_localStore setObject:v17 forKey:v8];
        tagSettingsEntriesByTagID = self->_tagSettingsEntriesByTagID;
      }
      else
      {
        [0 setObject:v17 forKey:v8];
        tagSettingsEntriesByTagID = 0;
      }
      [(NSMutableDictionary *)tagSettingsEntriesByTagID setObject:v16 forKey:v6];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "entry");
      *(_DWORD *)buf = 136315906;
      uint64_t v22 = "-[FCTagSettings setContentScaleForTagID:contentScale:]";
      __int16 v23 = 2080;
      long long v24 = "FCTagSettings.m";
      __int16 v25 = 1024;
      int v26 = 266;
      __int16 v27 = 2114;
      v28 = v19;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v22 = "-[FCTagSettings setContentScaleForTagID:contentScale:]";
    __int16 v23 = 2080;
    long long v24 = "FCTagSettings.m";
    __int16 v25 = 1024;
    int v26 = 213;
    __int16 v27 = 2114;
    v28 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_19:
  }
}

- (id)contentScaleForTagID:(id)a3
{
  if (self) {
    self = (FCTagSettings *)self->_tagSettingsEntriesByTagID;
  }
  id v3 = [(FCTagSettings *)self objectForKey:a3];
  id v4 = [v3 contentScale];

  return v4;
}

- (void)setAccessTokenForTagID:(id)a3 accessToken:(id)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v8)
  {
    uint64_t v10 = [NSString stringWithFormat:@"ts-%@", v8];
    if (self) {
      localStore = self->_localStore;
    }
    else {
      localStore = 0;
    }
    id v12 = [(FCKeyValueStore *)localStore objectForKey:v10];
    uint64_t v13 = v12;
    if (v12)
    {
      v14 = (void *)[v12 mutableCopy];
      __int16 v15 = v14;
      if (v9) {
        [v14 setObject:v9 forKeyedSubscript:@"accessToken"];
      }
      else {
        [v14 removeObjectForKey:@"accessToken"];
      }
      int v18 = (FCTagSettingsEntry *)-[FCTagSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCTagSettingsEntry alloc], v15);
    }
    else
    {
      id v17 = [FCTagSettingsEntry alloc];
      __int16 v15 = [NSString stringWithFormat:@"ts-%@", v8];
      LOBYTE(v26) = 0;
      int v18 = [(FCTagSettingsEntry *)v17 initWithEntryID:v15 tagID:v8 fontMultiplier:0 fontMultiplierMacOS:0 contentScale:0 contentScaleMacOS:0 accessToken:v9 webAccessOptIn:v26];
    }
    uint64_t v19 = v18;

    if (v19)
    {
      uint64_t v20 = -[FCTagSettingsEntry dictionaryRepresentation](v19);
      if (self)
      {
        [(FCKeyValueStore *)self->_localStore setObject:v20 forKey:v10];
        tagSettingsEntriesByTagID = self->_tagSettingsEntriesByTagID;
      }
      else
      {
        [0 setObject:v20 forKey:v10];
        tagSettingsEntriesByTagID = 0;
      }
      [(NSMutableDictionary *)tagSettingsEntriesByTagID setObject:v19 forKey:v8];
      uint64_t v22 = [FCModifyTagSettingsCommand alloc];
      __int16 v27 = v19;
      __int16 v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      long long v24 = [(FCModifyTagSettingsCommand *)v22 initWithTagSettingsEntries:v23 merge:1];

      if (self) {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      }
      else {
        id WeakRetained = 0;
      }
      [WeakRetained addModifyTagSettingsCommandToCommandQueue:v24];
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      uint64_t v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "entry");
      *(_DWORD *)buf = 136315906;
      uint64_t v29 = "-[FCTagSettings setAccessTokenForTagID:accessToken:userInitiated:]";
      __int16 v30 = 2080;
      uint64_t v31 = "FCTagSettings.m";
      __int16 v32 = 1024;
      int v33 = 326;
      __int16 v34 = 2114;
      long long v35 = v20;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }

LABEL_20:
    if (!v9)
    {
      if (self) {
        self = (FCTagSettings *)objc_loadWeakRetained((id *)&self->_delegate);
      }
      [(FCTagSettings *)self accessTokenRemovedForTagID:v8 userInitiated:v5];
    }
    goto LABEL_25;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v29 = "-[FCTagSettings setAccessTokenForTagID:accessToken:userInitiated:]";
    __int16 v30 = 2080;
    uint64_t v31 = "FCTagSettings.m";
    __int16 v32 = 1024;
    int v33 = 291;
    __int16 v34 = 2114;
    long long v35 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_25:
}

- (id)accessTokenForTagID:(id)a3
{
  if (self) {
    self = (FCTagSettings *)self->_tagSettingsEntriesByTagID;
  }
  id v3 = [(FCTagSettings *)self objectForKey:a3];
  id v4 = [v3 accessToken];

  return v4;
}

- (id)authenticatedAccessTokensByTagID
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self) {
    self = (FCTagSettings *)self->_tagSettingsEntriesByTagID;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__FCTagSettings_authenticatedAccessTokensByTagID__block_invoke;
  v7[3] = &unk_1E5B55700;
  id v8 = v3;
  id v4 = v3;
  [(FCTagSettings *)self enumerateKeysAndObjectsUsingBlock:v7];
  BOOL v5 = (void *)[v4 copy];

  return v5;
}

void __49__FCTagSettings_authenticatedAccessTokensByTagID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v5 accessToken];

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v5 accessToken];
    [v7 setObject:v9 forKey:v8];
  }
}

- (void)setWebAccessOptInForTagID:(id)a3 webAccessOptIn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v6)
  {
    id v7 = [NSString stringWithFormat:@"ts-%@", v6];
    if (self) {
      localStore = self->_localStore;
    }
    else {
      localStore = 0;
    }
    id v9 = [(FCKeyValueStore *)localStore objectForKey:v7];
    uint64_t v10 = v9;
    if (v9)
    {
      v11 = (void *)[v9 mutableCopy];
      id v12 = v11;
      if (v4)
      {
        uint64_t v13 = [NSNumber numberWithBool:1];
        [v12 setObject:v13 forKeyedSubscript:@"webAccessOptIn"];
      }
      else
      {
        [v11 removeObjectForKey:@"webAccessOptIn"];
      }
      __int16 v15 = (FCTagSettingsEntry *)-[FCTagSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCTagSettingsEntry alloc], v12);
    }
    else
    {
      v14 = [FCTagSettingsEntry alloc];
      id v12 = [NSString stringWithFormat:@"ts-%@", v6];
      LOBYTE(v23) = v4;
      __int16 v15 = [(FCTagSettingsEntry *)v14 initWithEntryID:v12 tagID:v6 fontMultiplier:0 fontMultiplierMacOS:0 contentScale:0 contentScaleMacOS:0 accessToken:0 webAccessOptIn:v23];
    }
    id v16 = v15;

    if (v16)
    {
      id v17 = -[FCTagSettingsEntry dictionaryRepresentation](v16);
      if (self)
      {
        [(FCKeyValueStore *)self->_localStore setObject:v17 forKey:v7];
        tagSettingsEntriesByTagID = self->_tagSettingsEntriesByTagID;
      }
      else
      {
        [0 setObject:v17 forKey:v7];
        tagSettingsEntriesByTagID = 0;
      }
      [(NSMutableDictionary *)tagSettingsEntriesByTagID setObject:v16 forKey:v6];
      uint64_t v19 = [FCModifyTagSettingsCommand alloc];
      long long v24 = v16;
      uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      uint64_t v21 = [(FCModifyTagSettingsCommand *)v19 initWithTagSettingsEntries:v20 merge:1];

      if (self) {
        self = (FCTagSettings *)objc_loadWeakRetained((id *)&self->_delegate);
      }
      [(FCTagSettings *)self addModifyTagSettingsCommandToCommandQueue:v21];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "entry");
      *(_DWORD *)buf = 136315906;
      uint64_t v26 = "-[FCTagSettings setWebAccessOptInForTagID:webAccessOptIn:]";
      __int16 v27 = 2080;
      v28 = "FCTagSettings.m";
      __int16 v29 = 1024;
      int v30 = 404;
      __int16 v31 = 2114;
      __int16 v32 = v22;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v26 = "-[FCTagSettings setWebAccessOptInForTagID:webAccessOptIn:]";
    __int16 v27 = 2080;
    v28 = "FCTagSettings.m";
    __int16 v29 = 1024;
    int v30 = 369;
    __int16 v31 = 2114;
    __int16 v32 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_21:
  }
}

void __39__FCTagSettings_webAccessOptedInTagIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if ([v6 webAccessOptIn])
  {
    BOOL v4 = *(void **)(a1 + 32);
    id v5 = [v6 tagID];
    [v4 addObject:v5];
  }
}

- (void)handleSyncWithTagSettingsRecord:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 recordID];
  uint64_t v38 = [v5 recordName];

  v37 = self;
  if (self) {
    localStore = self->_localStore;
  }
  else {
    localStore = 0;
  }
  id v7 = localStore;
  uint64_t v8 = [v4 objectForKeyedSubscript:@"tagID"];
  id v9 = [v4 objectForKeyedSubscript:@"fontMultiplier"];
  uint64_t v34 = [v4 objectForKeyedSubscript:@"fontMultiplierMacOS"];
  uint64_t v33 = [v4 objectForKeyedSubscript:@"contentScale"];
  uint64_t v32 = [v4 objectForKeyedSubscript:@"contentScaleMacOS"];
  uint64_t v36 = objc_msgSend(v4, "objectForKeyedSubscript:");
  uint64_t v35 = objc_msgSend(v4, "objectForKeyedSubscript:");

  uint64_t v10 = v7;
  v11 = [(FCKeyValueStore *)v7 objectForKey:v38];
  id v12 = v11;
  if (v11)
  {
    __int16 v31 = v11;
    uint64_t v13 = (void *)[v11 mutableCopy];
    v14 = v13;
    if (v9) {
      [v13 setObject:v9 forKeyedSubscript:@"fontMultiplier"];
    }
    else {
      [v13 removeObjectForKey:@"fontMultiplier"];
    }
    int v18 = v7;
    __int16 v15 = (void *)v8;
    id v17 = (void *)v34;
    __int16 v25 = (void *)v35;
    uint64_t v26 = (void *)v36;
    if (v34) {
      [v14 setObject:v34 forKeyedSubscript:@"fontMultiplierMacOS"];
    }
    else {
      [v14 removeObjectForKey:@"fontMultiplierMacOS"];
    }
    uint64_t v19 = (void *)v33;
    if (v33) {
      [v14 setObject:v33 forKeyedSubscript:@"contentScale"];
    }
    else {
      [v14 removeObjectForKey:@"contentScale"];
    }
    uint64_t v20 = (void *)v32;
    if (v32) {
      [v14 setObject:v32 forKeyedSubscript:@"contentScaleMacOS"];
    }
    else {
      [v14 removeObjectForKey:@"contentScaleMacOS"];
    }
    if (v35) {
      [v14 setObject:v35 forKeyedSubscript:@"accessToken"];
    }
    else {
      [v14 removeObjectForKey:@"accessToken"];
    }
    if (v36) {
      [v14 setObject:v36 forKeyedSubscript:@"webAccessOptIn"];
    }
    else {
      [v14 removeObjectForKey:@"webAccessOptIn"];
    }
    [(FCKeyValueStore *)v18 setObject:v14 forKey:v38];
    if (v15)
    {
      id v27 = -[FCTagSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCTagSettingsEntry alloc], v14);
      if (v37) {
        tagSettingsEntriesByTagID = v37->_tagSettingsEntriesByTagID;
      }
      else {
        tagSettingsEntriesByTagID = 0;
      }
      [(NSMutableDictionary *)tagSettingsEntriesByTagID setObject:v27 forKey:v15];
    }
    if (v37) {
      id WeakRetained = objc_loadWeakRetained((id *)&v37->_delegate);
    }
    else {
      id WeakRetained = 0;
    }
    [WeakRetained accessTokenDidChangeForTagID:v15];

LABEL_45:
    id v12 = v31;
    goto LABEL_46;
  }
  __int16 v15 = (void *)v8;
  if (v8)
  {
    __int16 v31 = 0;
    id v16 = [MEMORY[0x1E4F1CA60] dictionary];
    [v16 setObject:v8 forKey:@"tagID"];
    if (v9) {
      [v16 setObject:v9 forKey:@"fontMultiplier"];
    }
    id v17 = (void *)v34;
    if (v34) {
      [v16 setObject:v34 forKey:@"fontMultiplierMacOS"];
    }
    int v18 = v10;
    uint64_t v19 = (void *)v33;
    if (v33) {
      [v16 setObject:v33 forKey:@"contentScale"];
    }
    uint64_t v20 = (void *)v32;
    if (v32) {
      [v16 setObject:v32 forKey:@"contentScaleMacOS"];
    }
    if (v35) {
      [v16 setObject:v35 forKey:@"accessToken"];
    }
    if (v36) {
      [v16 setObject:v36 forKey:@"webAccessOptIn"];
    }
    uint64_t v21 = [FCTagSettingsEntry alloc];
    uint64_t v22 = (void *)[v16 copy];
    id v23 = -[FCTagSettingsEntry initWithEntryID:dictionaryRepresentation:](v21, v22);

    if (v37)
    {
      [(NSMutableDictionary *)v37->_tagSettingsEntriesByTagID setObject:v23 forKey:v8];
      id v24 = objc_loadWeakRetained((id *)&v37->_delegate);
    }
    else
    {
      [0 setObject:v23 forKey:v8];
      id v24 = 0;
    }
    __int16 v25 = (void *)v35;
    [v24 accessTokenDidChangeForTagID:v15];

    [(FCKeyValueStore *)v18 setObject:v16 forKey:v38];
    uint64_t v26 = (void *)v36;
    goto LABEL_45;
  }
  int v18 = v10;
  uint64_t v19 = (void *)v33;
  id v17 = (void *)v34;
  uint64_t v20 = (void *)v32;
  __int16 v25 = (void *)v35;
  uint64_t v26 = (void *)v36;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v30 = (void *)[[NSString alloc] initWithFormat:@"should never have a tag settings entry without a tag ID"];
    *(_DWORD *)buf = 136315906;
    v40 = "-[FCTagSettings handleSyncWithTagSettingsRecord:]";
    __int16 v41 = 2080;
    v42 = "FCTagSettings.m";
    __int16 v43 = 1024;
    int v44 = 448;
    __int16 v45 = 2114;
    v46 = v30;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v12 = 0;
  }
LABEL_46:
}

- (void)handleSyncWithDeletedTagSettingsRecordName:(id)a3
{
  id v4 = a3;
  if (self) {
    localStore = self->_localStore;
  }
  else {
    localStore = 0;
  }
  id v9 = v4;
  id v6 = [(FCKeyValueStore *)localStore objectForKey:v4];
  if (v6)
  {
    if (self) {
      id v7 = self->_localStore;
    }
    else {
      id v7 = 0;
    }
    [(FCKeyValueStore *)v7 removeObjectForKey:v9];
    uint64_t v8 = [v6 objectForKeyedSubscript:@"tagID"];
    if (v8)
    {
      if (self)
      {
        [(NSMutableDictionary *)self->_tagSettingsEntriesByTagID fc_safelySetObject:0 forKey:v8];
        self = (FCTagSettings *)objc_loadWeakRetained((id *)&self->_delegate);
      }
      else
      {
        objc_msgSend(0, "fc_safelySetObject:forKey:", 0, v8);
      }
      [(FCTagSettings *)self accessTokenDidChangeForTagID:v8];
    }
  }
}

- (id)allTagSettingsRecordNames
{
  if (self) {
    self = (FCTagSettings *)self->_tagSettingsEntriesByTagID;
  }
  v2 = [(FCTagSettings *)self allValues];
  id v3 = objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_78);

  return v3;
}

uint64_t __42__FCTagSettings_allTagSettingsRecordNames__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)allTagSettingsRecords
{
  if (self) {
    self = (FCTagSettings *)self->_tagSettingsEntriesByTagID;
  }
  v2 = [(FCTagSettings *)self allValues];
  id v3 = objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_25_1);

  return v3;
}

uint64_t __38__FCTagSettings_allTagSettingsRecords__block_invoke(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_tagSettingsEntriesByTagID, 0);
}

@end