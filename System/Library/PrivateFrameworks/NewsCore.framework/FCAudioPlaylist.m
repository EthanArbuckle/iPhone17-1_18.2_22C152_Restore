@interface FCAudioPlaylist
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
+ (void)populateLocalStoreClassRegistry:(id)a3;
- (BOOL)canHelpRestoreZoneName:(id)a3;
- (BOOL)containsArticleID:(id)a3;
- (FCAudioPlaylist)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5;
- (NSArray)articleIDs;
- (id)_itemWithArticleID:(uint64_t)a1;
- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3;
- (id)dateAddedForArticleID:(id)a3;
- (id)localStoreMigrator;
- (id)recordsForRestoringZoneName:(id)a3;
- (void)_modifyWithInsertedOrChangedItems:(void *)a3 removedArticleIDs:;
- (void)_regenerateOrderedArticleIDs;
- (void)addObserver:(id)a3;
- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4;
- (void)insertArticleID:(id)a3 atIndex:(unint64_t)a4;
- (void)loadLocalCachesFromStore;
- (void)removeArticleID:(id)a3;
- (void)removeObserver:(id)a3;
- (void)save;
@end

@implementation FCAudioPlaylist

void __29__FCAudioPlaylist_articleIDs__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[13];
  }
  v3 = v2;
  id v7 = [v3 array];
  uint64_t v4 = [v7 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)localStoreMigrator
{
  v2 = objc_alloc_init(FCAudioPlaylistMigrator);
  return v2;
}

+ (void)populateLocalStoreClassRegistry:(id)a3
{
  id v3 = a3;
  [v3 registerClass:objc_opt_class()];
}

+ (unint64_t)localStoreVersion
{
  return 3;
}

+ (id)localStoreFilename
{
  return @"audio-playlist";
}

+ (id)commandStoreFileName
{
  return @"audio-playlist-commands";
}

+ (int64_t)commandQueueUrgency
{
  return 2;
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
  v3[2] = __43__FCAudioPlaylist_loadLocalCachesFromStore__block_invoke;
  v3[3] = &unk_1E5B4C018;
  v3[4] = self;
  [(FCMTWriterLock *)itemsLock performWriteSync:v3];
}

void __43__FCAudioPlaylist_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  id obj = [MEMORY[0x1E4F1CA60] dictionary];
  v2 = [*(id *)(a1 + 32) localStore];
  [v2 addAllEntriesToDictionary:obj];

  id v3 = [(id)objc_opt_class() internalLocalStoreKeys];
  uint64_t v4 = [v3 allObjects];
  [obj removeObjectsForKeys:v4];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    objc_storeStrong((id *)(v5 + 96), obj);
    uint64_t v6 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v6 = 0;
  }
  -[FCAudioPlaylist _regenerateOrderedArticleIDs](v6);
}

- (void)_regenerateOrderedArticleIDs
{
  if (a1)
  {
    v2 = [*(id *)(a1 + 96) allValues];
    id v6 = [v2 sortedArrayUsingComparator:&__block_literal_global_30_1];

    id v3 = objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_33_2);
    uint64_t v4 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v3];
    uint64_t v5 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = v4;
  }
}

- (void)addObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FCAudioPlaylist;
  [(FCPrivateDataController *)&v3 addObserver:a3];
}

- (FCAudioPlaylist)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)FCAudioPlaylist;
  uint64_t v5 = [(FCPrivateDataController *)&v9 initWithContext:a3 pushNotificationCenter:a4 storeDirectory:a5];
  if (v5)
  {
    id v6 = objc_alloc_init(FCMTWriterLock);
    itemsLock = v5->_itemsLock;
    v5->_itemsLock = v6;
  }
  return v5;
}

- (NSArray)articleIDs
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__51;
  v12 = __Block_byref_object_dispose__51;
  id v13 = 0;
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  uint64_t v4 = itemsLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__FCAudioPlaylist_articleIDs__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(FCMTWriterLock *)v4 performReadSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
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
  return 0;
}

+ (id)backingRecordZoneIDs
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1A320]);
  objc_super v3 = (void *)[v2 initWithZoneName:@"AudioPlaylist" ownerName:*MEMORY[0x1E4F19C08]];
  v6[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 allKeys];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __72__FCAudioPlaylist_commandsToMergeLocalDataToCloud_privateDataDirectory___block_invoke;
  v16 = &unk_1E5B57490;
  id v17 = v5;
  id v18 = a1;
  id v7 = v5;
  uint64_t v8 = objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &v13);

  objc_super v9 = [FCModifyAudioPlaylistCommand alloc];
  uint64_t v10 = -[FCModifyAudioPlaylistCommand initWithItems:merge:](v9, "initWithItems:merge:", v8, 1, v13, v14, v15, v16);
  v19[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

  return v11;
}

id __72__FCAudioPlaylist_commandsToMergeLocalDataToCloud_privateDataDirectory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 40) isLocalStoreKeyInternal:v3])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  }

  return v4;
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v8 = objc_opt_new();
  objc_super v9 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)[objc_alloc(MEMORY[0x1E4F829D0]) initWithCKRecord:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        if (v15) {
          [v8 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v12);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = v7;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        if (self) {
          itemsByID = self->_itemsByID;
        }
        else {
          itemsByID = 0;
        }
        v22 = [(NSMutableDictionary *)itemsByID objectForKeyedSubscript:*(void *)(*((void *)&v26 + 1) + 8 * v20)];
        v23 = [v22 articleID];

        if (v23)
        {
          v24 = [v22 articleID];
          [v9 addObject:v24];
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v25 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
      uint64_t v18 = v25;
    }
    while (v25);
  }

  -[FCAudioPlaylist _modifyWithInsertedOrChangedItems:removedArticleIDs:]((id *)&self->super.super.isa, v8, v9);
}

- (void)_modifyWithInsertedOrChangedItems:(void *)a3 removedArticleIDs:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v31 = a3;
  if (a1 && ([v5 count] || objc_msgSend(v31, "count")))
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v30 = v5;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
    BOOL v8 = v7 != 0;
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v41;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
          id v13 = a1[12];
          uint64_t v14 = [v12 identifier];
          [v13 setObject:v12 forKeyedSubscript:v14];

          v15 = [a1 localStore];
          id v16 = [v12 identifier];
          [v15 setObject:v12 forKeyedSubscript:v16];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v9);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v17 = v31;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v37;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = objc_msgSend(MEMORY[0x1E4F829D0], "identifierFromArticleID:", *(void *)(*((void *)&v36 + 1) + 8 * v21), v30);
          v23 = [a1[12] objectForKeyedSubscript:v22];

          if (v23)
          {
            v24 = [a1 localStore];
            [v24 removeObjectForKey:v22];

            [a1[12] removeObjectForKey:v22];
            BOOL v8 = 1;
          }

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v19);
    }

    id v5 = v30;
    if (v8)
    {
      -[FCAudioPlaylist _regenerateOrderedArticleIDs]((uint64_t)a1);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v25 = [a1 observers];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v32 objects:v44 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v33;
        do
        {
          uint64_t v29 = 0;
          do
          {
            if (*(void *)v33 != v28) {
              objc_enumerationMutation(v25);
            }
            objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v29++), "audioPlaylistDidChange:", a1, v30);
          }
          while (v27 != v29);
          uint64_t v27 = [v25 countByEnumeratingWithState:&v32 objects:v44 count:16];
        }
        while (v27);
      }
    }
  }
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  if (self) {
    self = (FCAudioPlaylist *)self->_itemsByID;
  }
  return (id)[(FCAudioPlaylist *)self allKeys];
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return [a3 isEqualToString:@"AudioPlaylist"];
}

- (id)recordsForRestoringZoneName:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__51;
  uint64_t v14 = __Block_byref_object_dispose__51;
  id v15 = 0;
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  id v6 = itemsLock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__FCAudioPlaylist_recordsForRestoringZoneName___block_invoke;
  v9[3] = &unk_1E5B4C258;
  v9[4] = self;
  v9[5] = &v10;
  [(FCMTWriterLock *)v6 performReadSync:v9];

  uint64_t v7 = objc_msgSend((id)v11[5], "fc_arrayByTransformingWithBlock:", &__block_literal_global_118);
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __47__FCAudioPlaylist_recordsForRestoringZoneName___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[12];
  }
  id v3 = v2;
  id v7 = [v3 allValues];
  uint64_t v4 = [v7 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __47__FCAudioPlaylist_recordsForRestoringZoneName___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
}

- (BOOL)containsArticleID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  id v6 = itemsLock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__FCAudioPlaylist_containsArticleID___block_invoke;
  v10[3] = &unk_1E5B4C230;
  uint64_t v12 = &v13;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  [(FCMTWriterLock *)v6 performReadSync:v10];

  char v8 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __37__FCAudioPlaylist_containsArticleID___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2) {
    id v2 = (void *)v2[13];
  }
  uint64_t v3 = a1[5];
  id v4 = v2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v4 containsObject:v3];
}

- (id)dateAddedForArticleID:(id)a3
{
  id v4 = a3;
  if ([(FCAudioPlaylist *)self containsArticleID:v4])
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__51;
    char v16 = __Block_byref_object_dispose__51;
    id v17 = 0;
    if (self) {
      itemsLock = self->_itemsLock;
    }
    else {
      itemsLock = 0;
    }
    id v6 = itemsLock;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__FCAudioPlaylist_dateAddedForArticleID___block_invoke_2;
    v9[3] = &unk_1E5B4C4D0;
    v9[4] = self;
    id v10 = v4;
    id v11 = &v12;
    [(FCMTWriterLock *)v6 performReadSync:v9];

    id v7 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __41__FCAudioPlaylist_dateAddedForArticleID___block_invoke_2(uint64_t *a1)
{
  -[FCAudioPlaylist _itemWithArticleID:](a1[4], a1[5]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if ([v7 hasDateAdded])
  {
    id v2 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v3 = [v7 dateAdded];
    uint64_t v4 = [v2 dateWithPBDate:v3];
    uint64_t v5 = *(void *)(a1[6] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)_itemWithArticleID:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F829D0];
    id v4 = *(id *)(a1 + 96);
    uint64_t v5 = [v3 identifierFromArticleID:a2];
    id v6 = [v4 objectForKeyedSubscript:v5];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)insertArticleID:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__FCAudioPlaylist_insertArticleID_atIndex___block_invoke;
  v9[3] = &unk_1E5B4E490;
  v9[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  [(FCMTWriterLock *)itemsLock performWriteSync:v9];
}

void __43__FCAudioPlaylist_insertArticleID_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[12];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = v2;
  id v5 = [v4 objectForKeyedSubscript:v3];

  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F829D0]);
    id v6 = [MEMORY[0x1E4F829D0] identifierFromArticleID:*(void *)(a1 + 40)];
    [v5 setIdentifier:v6];

    [v5 setArticleID:*(void *)(a1 + 40)];
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    id v8 = [v7 pbDate];
    [v5 setDateAdded:v8];

    uint64_t v9 = *(void **)(a1 + 32);
    if (v9) {
      uint64_t v9 = (void *)v9[12];
    }
    id v10 = v9;
    unint64_t v11 = [v5 identifier];
    [v10 setObject:v5 forKeyedSubscript:v11];
  }
  unint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    uint64_t v14 = *(void **)(v13 + 96);
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = [v14 count];
  if (v12 >= v15 - 1) {
    unint64_t v16 = v15 - 1;
  }
  else {
    unint64_t v16 = v12;
  }
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    uint64_t v18 = *(void **)(v17 + 104);
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v19 = (void *)[v18 mutableCopy];
  uint64_t v20 = (void *)MEMORY[0x1E4F1C978];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __43__FCAudioPlaylist_insertArticleID_atIndex___block_invoke_2;
  v39[3] = &unk_1E5B574B8;
  id v21 = v19;
  id v40 = v21;
  id v22 = *(id *)(a1 + 40);
  unint64_t v44 = v16;
  uint64_t v23 = *(void *)(a1 + 32);
  id v41 = v22;
  uint64_t v42 = v23;
  id v24 = v5;
  id v43 = v24;
  uint64_t v25 = objc_msgSend(v20, "fc_array:", v39);
  uint64_t v26 = -[FCTagSubscriptionOrderAssigner initWithInitialOrder:orderSpacing:]([FCTagSubscriptionOrderAssigner alloc], 0, 1000000000000000);
  uint64_t v27 = -[FCTagSubscriptionOrderAssigner assignOrderToTagSubscriptions:](v26, v25);
  -[FCAudioPlaylist _modifyWithInsertedOrChangedItems:removedArticleIDs:](*(id **)(a1 + 32), v27, 0);
  uint64_t v28 = (void *)FCAudioLog;
  if (os_log_type_enabled((os_log_t)FCAudioLog, OS_LOG_TYPE_DEFAULT))
  {
    id v37 = v24;
    id v38 = v21;
    uint64_t v29 = *(void **)(a1 + 32);
    uint64_t v30 = *(void *)(a1 + 40);
    unint64_t v31 = v16;
    if (v29) {
      uint64_t v29 = (void *)v29[13];
    }
    long long v32 = v29;
    long long v33 = v28;
    long long v34 = [v32 array];
    long long v35 = objc_msgSend(v34, "fc_subarrayWithMaxCount:", 2);
    *(_DWORD *)buf = 138543874;
    uint64_t v46 = v30;
    __int16 v47 = 2048;
    unint64_t v48 = v31;
    __int16 v49 = 2114;
    v50 = v35;
    _os_log_impl(&dword_1A460D000, v33, OS_LOG_TYPE_DEFAULT, "did insert %{public}@ into playlist at index=%lu, playlist=%{public}@, ...", buf, 0x20u);

    id v24 = v37;
    id v21 = v38;
  }
  long long v36 = [[FCModifyAudioPlaylistCommand alloc] initWithItems:v27 merge:0];
  [*(id *)(a1 + 32) addCommandToCommandQueue:v36];
}

void __43__FCAudioPlaylist_insertArticleID_atIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) insertObject:*(void *)(a1 + 40) atIndex:*(void *)(a1 + 64)];
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndex:v3 - 1];
    id v5 = -[FCAudioPlaylist _itemWithArticleID:](*(void *)(a1 + 48), (uint64_t)v4);
    [v10 addObject:v5];
  }
  id v6 = (void *)[*(id *)(a1 + 56) copyWithOrder:0];
  [v10 addObject:v6];
  uint64_t v7 = *(void *)(a1 + 64) + 1;
  if (v7 != [*(id *)(a1 + 32) count])
  {
    id v8 = [*(id *)(a1 + 32) objectAtIndex:*(void *)(a1 + 64) + 1];
    uint64_t v9 = -[FCAudioPlaylist _itemWithArticleID:](*(void *)(a1 + 48), (uint64_t)v8);
    [v10 addObject:v9];
  }
}

- (void)removeArticleID:(id)a3
{
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__FCAudioPlaylist_removeArticleID___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(FCMTWriterLock *)itemsLock performWriteSync:v7];
}

void __35__FCAudioPlaylist_removeArticleID___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(id **)(a1 + 32);
  v5[0] = *(void *)(a1 + 40);
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  -[FCAudioPlaylist _modifyWithInsertedOrChangedItems:removedArticleIDs:](v2, 0, v3);

  id v4 = [[FCRemoveFromAudioPlaylistCommand alloc] initWithArticleID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) addCommandToCommandQueue:v4];
}

- (void)removeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FCAudioPlaylist;
  [(FCPrivateDataController *)&v3 removeObserver:a3];
}

- (void)save
{
  id v2 = [(FCPrivateDataController *)self localStore];
  [v2 save];
}

uint64_t __47__FCAudioPlaylist__regenerateOrderedArticleIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 order];
  uint64_t v7 = [v5 order];
  id v8 = (void *)v7;
  if (v6 && v7)
  {
    uint64_t v9 = [(id)v6 compare:v7];
    if (!v9)
    {
LABEL_9:
      id v10 = [v4 articleID];
      unint64_t v11 = [v5 articleID];
      uint64_t v9 = [v10 compare:v11];
    }
  }
  else
  {
    if (v6) {
      uint64_t v9 = -1;
    }
    else {
      uint64_t v9 = 1;
    }
    if (!(v6 | v7)) {
      goto LABEL_9;
    }
  }

  return v9;
}

uint64_t __47__FCAudioPlaylist__regenerateOrderedArticleIDs__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_orderedArticleIDs, 0);
  objc_storeStrong((id *)&self->_itemsByID, 0);
}

@end