@interface WebBookmarkChangeSet
+ (BOOL)supportsSecureCoding;
- (BOOL)bookmarkIsAddedInMemory:(int)a3;
- (BOOL)folderHasReplaceChange:(int)a3;
- (BOOL)isBookmarkDeleted:(int)a3;
- (BOOL)shouldSync;
- (NSArray)changes;
- (NSURL)fileURL;
- (WebBookmarkChangeSet)initWithCoder:(id)a3;
- (WebBookmarkChangeSet)initWithFileURL:(id)a3;
- (WebBookmarkChangeSet)initWithFileURL:(id)a3 readPersistedChanges:(BOOL)a4;
- (id)addedBookmarksInBookmarkFolder:(int)a3;
- (id)bookmarksAfterReplayingChangesToBookmarks:(id)a3 inFolderWithID:(int)a4;
- (id)deletedBookmarkIDsInBookmarkFolder:(int)a3;
- (id)modifiedBookmarksInBookmarkFolder:(int)a3;
- (int)nextBookmarkIDForAddingBookmarkInMemory;
- (int64_t)replayChangesOnBookmark:(id)a3;
- (unint64_t)numberOfAddedBookmarksInBookmarkFolder:(int)a3;
- (unint64_t)numberOfReorderedBookmarksInBookmarkFolder:(int)a3;
- (void)_addChange:(id)a3;
- (void)_coalesceChangesForChangeIfNeeded:(id)a3;
- (void)_readPersistedChanges;
- (void)_removeAllChanges;
- (void)_removeChange:(id)a3;
- (void)addChange:(id)a3;
- (void)addChanges:(id)a3;
- (void)applyModificationsToBookmarks:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)persistChangesWithCompletion:(id)a3;
- (void)removeAllChanges;
- (void)removeChange:(id)a3;
- (void)updateAddChangesWithInMemoryBookmarkID:(int)a3 toDatabaseGeneratedID:(int)a4;
@end

@implementation WebBookmarkChangeSet

- (int64_t)replayChangesOnBookmark:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__WebBookmarkChangeSet_replayChangesOnBookmark___block_invoke;
  block[3] = &unk_2643DA3D8;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)applyModificationsToBookmarks:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__WebBookmarkChangeSet_applyModificationsToBookmarks___block_invoke;
  v7[3] = &unk_2643D9CF8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_barrier_sync(queue, v7);
}

- (id)deletedBookmarkIDsInBookmarkFolder:(int)a3
{
  v5 = [MEMORY[0x263EFF9C0] set];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__WebBookmarkChangeSet_deletedBookmarkIDsInBookmarkFolder___block_invoke;
  block[3] = &unk_2643DA428;
  block[4] = self;
  int v13 = a3;
  id v7 = v5;
  id v12 = v7;
  dispatch_sync(queue, block);
  id v8 = v12;
  id v9 = v7;

  return v9;
}

void __58__WebBookmarkChangeSet_modifiedBookmarksInBookmarkFolder___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  v3 = *(void **)(*(void *)(a1 + 32) + 72);
  id v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v5 = [v3 objectForKeyedSubscript:v4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "bookmark", (void)v13);
        id v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "identifier"));
        if (v11 && ([v2 containsObject:v12] & 1) == 0)
        {
          [*(id *)(a1 + 40) addObject:v11];
          [v2 addObject:v12];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (BOOL)bookmarkIsAddedInMemory:(int)a3
{
  return a3 < -99;
}

- (id)modifiedBookmarksInBookmarkFolder:(int)a3
{
  v5 = [MEMORY[0x263EFF980] array];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__WebBookmarkChangeSet_modifiedBookmarksInBookmarkFolder___block_invoke;
  block[3] = &unk_2643DA428;
  block[4] = self;
  int v13 = a3;
  id v7 = v5;
  id v12 = v7;
  dispatch_sync(queue, block);
  uint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

- (unint64_t)numberOfAddedBookmarksInBookmarkFolder:(int)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__WebBookmarkChangeSet_numberOfAddedBookmarksInBookmarkFolder___block_invoke;
  block[3] = &unk_2643DA478;
  block[4] = self;
  void block[5] = &v8;
  int v7 = a3;
  dispatch_sync(queue, block);
  unint64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (NSArray)changes
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1;
  uint64_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__WebBookmarkChangeSet_changes__block_invoke;
  v5[3] = &unk_2643D9BB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (unint64_t)numberOfReorderedBookmarksInBookmarkFolder:(int)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__WebBookmarkChangeSet_numberOfReorderedBookmarksInBookmarkFolder___block_invoke;
  block[3] = &unk_2643DA478;
  block[4] = self;
  void block[5] = &v8;
  int v7 = a3;
  dispatch_sync(queue, block);
  unint64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (BOOL)folderHasReplaceChange:(int)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__WebBookmarkChangeSet_folderHasReplaceChange___block_invoke;
  block[3] = &unk_2643DA478;
  block[4] = self;
  void block[5] = &v8;
  int v7 = a3;
  dispatch_sync(queue, block);
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (id)addedBookmarksInBookmarkFolder:(int)a3
{
  v5 = [MEMORY[0x263EFF980] array];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__WebBookmarkChangeSet_addedBookmarksInBookmarkFolder___block_invoke;
  block[3] = &unk_2643DA428;
  block[4] = self;
  int v13 = a3;
  id v7 = v5;
  id v12 = v7;
  dispatch_sync(queue, block);
  uint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

void __54__WebBookmarkChangeSet_applyModificationsToBookmarks___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v7 = *(void **)(*(void *)(a1 + 40) + 32);
        uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "identifier"));
        id v9 = [v7 objectForKeyedSubscript:v8];

        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v17;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * j);
              if ([v14 changeType] == 3) {
                [v14 applyModificationsToBookmark:v6];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v11);
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v3);
  }
}

void __48__WebBookmarkChangeSet_replayChangesOnBookmark___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "identifier"));
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "changeType", (void)v13);
        uint64_t v12 = 1;
        switch(v11)
        {
          case 0:
          case 1:
          case 6:
            goto LABEL_9;
          case 3:
            [v10 applyModificationsToBookmark:*(void *)(a1 + 40)];
            uint64_t v12 = 2;
            goto LABEL_9;
          case 4:
            uint64_t v12 = 3;
LABEL_9:
            *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12;
            break;
          default:
            continue;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

void __47__WebBookmarkChangeSet_folderHasReplaceChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = [v2 objectForKeyedSubscript:v4];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "safari_containsObjectPassingTest:", &__block_literal_global_22);
}

void __31__WebBookmarkChangeSet_changes__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 24) array];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __61__WebBookmarkChangeSet_initWithFileURL_readPersistedChanges___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _readPersistedChanges];
  }
  return result;
}

void __63__WebBookmarkChangeSet_numberOfAddedBookmarksInBookmarkFolder___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 64);
  id v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = [v2 objectForKeyedSubscript:v4];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 count];
}

void __59__WebBookmarkChangeSet_deletedBookmarkIDsInBookmarkFolder___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(a1 + 40);
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "bookmarkID", (void)v12));
        [v10 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

void __67__WebBookmarkChangeSet_numberOfReorderedBookmarksInBookmarkFolder___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);
  id v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = [v2 objectForKeyedSubscript:v4];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 count];
}

- (void)_readPersistedChanges
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C043000, log, OS_LOG_TYPE_ERROR, "Persisted bookmark changes plist is corrupted", v1, 2u);
}

- (WebBookmarkChangeSet)initWithFileURL:(id)a3
{
  return [(WebBookmarkChangeSet *)self initWithFileURL:a3 readPersistedChanges:1];
}

- (WebBookmarkChangeSet)initWithFileURL:(id)a3 readPersistedChanges:(BOOL)a4
{
  id v7 = a3;
  v37.receiver = self;
  v37.super_class = (Class)WebBookmarkChangeSet;
  uint64_t v8 = [(WebBookmarkChangeSet *)&v37 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fileURL, a3);
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.WebBookmarks.WebBookmarkChangeSet.%p", v9);
    id v10 = objc_claimAutoreleasedReturnValue();
    uint64_t v11 = (const char *)[v10 UTF8String];
    dispatch_queue_t v12 = dispatch_queue_create(v11, MEMORY[0x263EF83A8]);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    v9->_lastBookmarkIDForAddingInMemoryBookmark = -99;
    uint64_t v14 = [MEMORY[0x263EFF9B0] orderedSet];
    changes = v9->_changes;
    v9->_changes = (NSMutableOrderedSet *)v14;

    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    bookmarkIDToChanges = v9->_bookmarkIDToChanges;
    v9->_bookmarkIDToChanges = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
    associatedIDToChanges = v9->_associatedIDToChanges;
    v9->_associatedIDToChanges = (NSMutableDictionary *)v18;

    uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
    folderIDToChildrenChanges = v9->_folderIDToChildrenChanges;
    v9->_folderIDToChildrenChanges = (NSMutableDictionary *)v20;

    uint64_t v22 = [MEMORY[0x263EFF9A0] dictionary];
    folderIDToDeletedChildrenChanges = v9->_folderIDToDeletedChildrenChanges;
    v9->_folderIDToDeletedChildrenChanges = (NSMutableDictionary *)v22;

    uint64_t v24 = [MEMORY[0x263EFF9A0] dictionary];
    folderIDToAddedChildrenChanges = v9->_folderIDToAddedChildrenChanges;
    v9->_folderIDToAddedChildrenChanges = (NSMutableDictionary *)v24;

    uint64_t v26 = [MEMORY[0x263EFF9A0] dictionary];
    folderIDToModifiedChildrenChanges = v9->_folderIDToModifiedChildrenChanges;
    v9->_folderIDToModifiedChildrenChanges = (NSMutableDictionary *)v26;

    uint64_t v28 = [MEMORY[0x263EFF9A0] dictionary];
    folderIDToReorderedChildrenChanges = v9->_folderIDToReorderedChildrenChanges;
    v9->_folderIDToReorderedChildrenChanges = (NSMutableDictionary *)v28;

    v30 = v9->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__WebBookmarkChangeSet_initWithFileURL_readPersistedChanges___block_invoke;
    block[3] = &unk_2643DA368;
    BOOL v36 = a4;
    v31 = v9;
    v35 = v31;
    dispatch_barrier_sync(v30, block);
    v32 = v31;
  }
  return v9;
}

void __55__WebBookmarkChangeSet_addedBookmarksInBookmarkFolder___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 64);
  uint64_t v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "bookmark", (void)v11);
        if (v10) {
          [*(id *)(a1 + 40) addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__WebBookmarkChangeSet_encodeWithCoder___block_invoke;
  v7[3] = &unk_2643D9CF8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_barrier_sync(queue, v7);
}

uint64_t __40__WebBookmarkChangeSet_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 24) array];
  [v2 encodeObject:v3 forKey:@"Changes"];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 88);
  return [v4 encodeObject:v5 forKey:@"FileURL"];
}

- (WebBookmarkChangeSet)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  uint64_t v7 = [v4 setWithArray:v6];
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"Changes"];

  uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"FileURL"];

  id v10 = [(WebBookmarkChangeSet *)self initWithFileURL:v9 readPersistedChanges:0];
  long long v11 = v10;
  if (v10)
  {
    [(WebBookmarkChangeSet *)v10 addChanges:v8];
    long long v12 = v11;
  }

  return v11;
}

- (BOOL)shouldSync
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__WebBookmarkChangeSet_shouldSync__block_invoke;
  v5[3] = &unk_2643D9BB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__WebBookmarkChangeSet_shouldSync__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "safari_containsObjectPassingTest:", &__block_literal_global_8);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __34__WebBookmarkChangeSet_shouldSync__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 shouldSync];
}

- (int)nextBookmarkIDForAddingBookmarkInMemory
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__WebBookmarkChangeSet_nextBookmarkIDForAddingBookmarkInMemory__block_invoke;
  v5[3] = &unk_2643D9DE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_sync(queue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__WebBookmarkChangeSet_nextBookmarkIDForAddingBookmarkInMemory__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = --*(_DWORD *)(*(void *)(result + 32) + 16);
  return result;
}

- (void)addChanges:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__WebBookmarkChangeSet_addChanges___block_invoke;
  v7[3] = &unk_2643D9CF8;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_barrier_async(queue, v7);
}

void __35__WebBookmarkChangeSet_addChanges___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_addChange:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)addChange:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__WebBookmarkChangeSet_addChange___block_invoke;
  v7[3] = &unk_2643D9CF8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(queue, v7);
}

uint64_t __34__WebBookmarkChangeSet_addChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addChange:*(void *)(a1 + 40)];
}

- (void)_addChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(WebBookmarkChangeSet *)self _coalesceChangesForChangeIfNeeded:v4];
  [(NSMutableOrderedSet *)self->_changes addObject:v4];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __35__WebBookmarkChangeSet__addChange___block_invoke;
  v23[3] = &unk_2643DA3B0;
  id v5 = v4;
  id v24 = v5;
  id v6 = (void (**)(void, void, void))MEMORY[0x21D4A1230](v23);
  uint64_t v7 = [v5 bookmarkID];
  uint64_t v8 = v7;
  if ((int)v7 < self->_lastBookmarkIDForAddingInMemoryBookmark) {
    self->_lastBookmarkIDForAddingInMemoryBookmark = v7;
  }
  if (v7 && v7 != 0x7FFFFFFF) {
    ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_bookmarkIDToChanges, v7);
  }
  long long v9 = objc_msgSend(v5, "bookmark", v8);
  uint64_t v10 = [v9 lastSelectedChildID];

  if (v10 && v10 != 0x7FFFFFFF) {
    ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_bookmarkIDToChanges, v10);
  }
  uint64_t v11 = [v5 specialFolderID];
  if (!v11) {
    uint64_t v11 = [v5 parentID];
  }
  ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToChildrenChanges, v11);
  uint64_t v12 = [v5 associatedBookmarkID];
  switch([v5 changeType])
  {
    case 0:
    case 1:
      folderIDToDeletedChildrenChanges = self->_folderIDToDeletedChildrenChanges;
      goto LABEL_15;
    case 2:
      folderIDToDeletedChildrenChanges = self->_folderIDToAddedChildrenChanges;
      goto LABEL_15;
    case 3:
      folderIDToDeletedChildrenChanges = self->_folderIDToModifiedChildrenChanges;
LABEL_15:
      ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, folderIDToDeletedChildrenChanges, v11);
      break;
    case 4:
      ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToDeletedChildrenChanges, v11);
      ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToAddedChildrenChanges, v12);
      ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToChildrenChanges, v12);
      goto LABEL_18;
    case 5:
      ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToReorderedChildrenChanges, v11);
LABEL_18:
      ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_associatedIDToChanges, v12);
      break;
    case 6:
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v14 = objc_msgSend(v5, "bookmarks", 0);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v20 != v17) {
              objc_enumerationMutation(v14);
            }
            ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_bookmarkIDToChanges, [*(id *)(*((void *)&v19 + 1) + 8 * i) identifier]);
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v25 count:16];
        }
        while (v16);
      }

      break;
    default:
      break;
  }
}

void __35__WebBookmarkChangeSet__addChange___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id v5 = [NSNumber numberWithInt:a3];
  id v6 = [v7 objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v6 = [MEMORY[0x263EFF9B0] orderedSet];
    [v7 setObject:v6 forKeyedSubscript:v5];
  }
  [v6 addObject:*(void *)(a1 + 32)];
}

- (void)_coalesceChangesForChangeIfNeeded:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 changeType] == 3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = (void *)[(NSMutableOrderedSet *)self->_changes copy];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v10 changeType] == 3)
          {
            int v11 = [v10 bookmarkID];
            if (v11 == [v4 bookmarkID]) {
              [(WebBookmarkChangeSet *)self _removeChange:v10];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)removeChange:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__WebBookmarkChangeSet_removeChange___block_invoke;
  v7[3] = &unk_2643D9CF8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(queue, v7);
}

uint64_t __37__WebBookmarkChangeSet_removeChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeChange:*(void *)(a1 + 40)];
}

- (void)_removeChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSMutableOrderedSet *)self->_changes removeObject:v4];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __38__WebBookmarkChangeSet__removeChange___block_invoke;
  v23[3] = &unk_2643DA3B0;
  id v5 = v4;
  id v24 = v5;
  id v6 = (void (**)(void, void, void))MEMORY[0x21D4A1230](v23);
  uint64_t v7 = [v5 parentID];
  unsigned int v18 = [v5 associatedBookmarkID];
  ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_bookmarkIDToChanges, [v5 bookmarkID]);
  bookmarkIDToChanges = self->_bookmarkIDToChanges;
  long long v9 = [v5 bookmark];
  ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, bookmarkIDToChanges, [v9 lastSelectedChildID]);

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [v5 bookmarks];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_bookmarkIDToChanges, [*(id *)(*((void *)&v19 + 1) + 8 * i) identifier]);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v12);
  }

  ((void (**)(void, NSMutableDictionary *, void))v6)[2](v6, self->_associatedIDToChanges, v18);
  folderIDToChildrenChanges = self->_folderIDToChildrenChanges;
  unsigned int v16 = [v5 specialFolderID];
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = v7;
  }
  ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, folderIDToChildrenChanges, v17);
  ((void (**)(void, NSMutableDictionary *, void))v6)[2](v6, self->_folderIDToChildrenChanges, v18);
  ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToDeletedChildrenChanges, v7);
  ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToAddedChildrenChanges, v7);
  ((void (**)(void, NSMutableDictionary *, void))v6)[2](v6, self->_folderIDToAddedChildrenChanges, v18);
  ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToModifiedChildrenChanges, v7);
  ((void (**)(void, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToReorderedChildrenChanges, v7);
}

void __38__WebBookmarkChangeSet__removeChange___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id v5 = [NSNumber numberWithInt:a3];
  id v6 = [v7 objectForKeyedSubscript:v5];
  [v6 removeObject:*(void *)(a1 + 32)];
  if (![v6 count]) {
    [v7 removeObjectForKey:v5];
  }
}

- (void)removeAllChanges
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__WebBookmarkChangeSet_removeAllChanges__block_invoke;
  block[3] = &unk_2643D9B48;
  void block[4] = self;
  dispatch_barrier_async(queue, block);
}

uint64_t __40__WebBookmarkChangeSet_removeAllChanges__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAllChanges];
}

- (void)_removeAllChanges
{
  [(NSMutableOrderedSet *)self->_changes removeAllObjects];
  [(NSMutableDictionary *)self->_bookmarkIDToChanges removeAllObjects];
  [(NSMutableDictionary *)self->_associatedIDToChanges removeAllObjects];
  [(NSMutableDictionary *)self->_folderIDToChildrenChanges removeAllObjects];
  [(NSMutableDictionary *)self->_folderIDToDeletedChildrenChanges removeAllObjects];
  [(NSMutableDictionary *)self->_folderIDToAddedChildrenChanges removeAllObjects];
  [(NSMutableDictionary *)self->_folderIDToModifiedChildrenChanges removeAllObjects];
  [(NSMutableDictionary *)self->_folderIDToReorderedChildrenChanges removeAllObjects];
  id v3 = [MEMORY[0x263F08850] defaultManager];
  [v3 removeItemAtURL:self->_fileURL error:0];
}

- (id)bookmarksAfterReplayingChangesToBookmarks:(id)a3 inFolderWithID:(int)a4
{
  id v6 = (void *)[a3 mutableCopy];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__WebBookmarkChangeSet_bookmarksAfterReplayingChangesToBookmarks_inFolderWithID___block_invoke;
  block[3] = &unk_2643DA428;
  void block[4] = self;
  int v14 = a4;
  id v8 = v6;
  id v13 = v8;
  dispatch_sync(queue, block);
  long long v9 = v13;
  id v10 = v8;

  return v10;
}

void __81__WebBookmarkChangeSet_bookmarksAfterReplayingChangesToBookmarks_inFolderWithID___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [v10 bookmark];
        switch([v10 changeType])
        {
          case 0:
          case 4:
            [*(id *)(a1 + 40) removeObject:v11];
            break;
          case 2:
            int v12 = [v11 isFolder];
            id v13 = *(void **)(a1 + 40);
            if (v12) {
              [v13 insertObject:v11 atIndex:0];
            }
            else {
              [v13 addObject:v11];
            }
            break;
          case 3:
            [v10 applyModificationsToBookmark:v11];
            break;
          case 5:
            [*(id *)(a1 + 40) removeObject:v11];
            unsigned int v16 = *(void **)(a1 + 40);
            v17[0] = MEMORY[0x263EF8330];
            v17[1] = 3221225472;
            v17[2] = __81__WebBookmarkChangeSet_bookmarksAfterReplayingChangesToBookmarks_inFolderWithID___block_invoke_2;
            v17[3] = &unk_2643DA400;
            v17[4] = v10;
            long long v15 = objc_msgSend(v16, "safari_firstObjectPassingTest:", v17);
            objc_msgSend(*(id *)(a1 + 40), "safari_insertObject:afterObject:", v11, v15);
            goto LABEL_14;
          case 6:
            if ([v10 parentID] == *(_DWORD *)(a1 + 48))
            {
              [*(id *)(a1 + 40) removeAllObjects];
              int v14 = *(void **)(a1 + 40);
              long long v15 = [v10 bookmarks];
              [v14 addObjectsFromArray:v15];
LABEL_14:
            }
            break;
          default:
            break;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

BOOL __81__WebBookmarkChangeSet_bookmarksAfterReplayingChangesToBookmarks_inFolderWithID___block_invoke_2(uint64_t a1, void *a2)
{
  int v3 = [a2 identifier];
  return v3 == [*(id *)(a1 + 32) associatedBookmarkID];
}

- (BOOL)isBookmarkDeleted:(int)a3
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__WebBookmarkChangeSet_isBookmarkDeleted___block_invoke;
  block[3] = &unk_2643DA450;
  int v7 = a3;
  void block[4] = self;
  void block[5] = &v8;
  dispatch_sync(queue, block);
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __42__WebBookmarkChangeSet_isBookmarkDeleted___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  int v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  char v4 = [v2 objectForKeyedSubscript:v3];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "changeType", (void)v12);
        if (v10 > 5 || ((1 << v10) & 0x2C) == 0)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

BOOL __47__WebBookmarkChangeSet_folderHasReplaceChange___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 changeType] == 6;
}

- (void)updateAddChangesWithInMemoryBookmarkID:(int)a3 toDatabaseGeneratedID:(int)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 != a4)
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v13 = a3;
      __int16 v14 = 2048;
      uint64_t v15 = a4;
      _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "Updating changes from in memory identifier %ld to database identifier %ld", buf, 0x16u);
    }
    queue = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __85__WebBookmarkChangeSet_updateAddChangesWithInMemoryBookmarkID_toDatabaseGeneratedID___block_invoke;
    v9[3] = &unk_2643DA4C8;
    int v10 = a3;
    int v11 = a4;
    v9[4] = self;
    dispatch_barrier_sync(queue, v9);
  }
}

void __85__WebBookmarkChangeSet_updateAddChangesWithInMemoryBookmarkID_toDatabaseGeneratedID___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  int v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  char v4 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v2];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v10 = [v9 bookmark];
        if ([v10 identifier] == *(_DWORD *)(a1 + 40))
        {
          [v9 setBookmarkID:*(unsigned int *)(a1 + 44)];
          [v10 _setID:*(unsigned int *)(a1 + 44)];
          [v10 _setInserted:1];
        }
        else if ([v10 lastSelectedChildID] == *(_DWORD *)(a1 + 40))
        {
          [v10 setLastSelectedChildID:*(unsigned int *)(a1 + 44)];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  if (v4)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v4 forKeyedSubscript:v3];
    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:v2];
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__WebBookmarkChangeSet_updateAddChangesWithInMemoryBookmarkID_toDatabaseGeneratedID___block_invoke_2;
  void v14[3] = &unk_2643DA4A0;
  uint64_t v17 = *(void *)(a1 + 40);
  id v15 = v2;
  id v16 = v3;
  id v11 = v3;
  id v12 = v2;
  uint64_t v13 = (void (**)(void, void))MEMORY[0x21D4A1230](v14);
  v13[2](v13, *(void *)(*(void *)(a1 + 32) + 40));
  v13[2](v13, *(void *)(*(void *)(a1 + 32) + 56));
  v13[2](v13, *(void *)(*(void *)(a1 + 32) + 64));
  v13[2](v13, *(void *)(*(void *)(a1 + 32) + 72));
  v13[2](v13, *(void *)(*(void *)(a1 + 32) + 80));
}

void __85__WebBookmarkChangeSet_updateAddChangesWithInMemoryBookmarkID_toDatabaseGeneratedID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) updateChangeAfterUpdatingInMemoryID:*(unsigned int *)(a1 + 48) withDatabaseID:*(unsigned int *)(a1 + 52)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  if (v4)
  {
    [v3 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
    [v3 removeObjectForKey:*(void *)(a1 + 32)];
  }
}

- (void)persistChangesWithCompletion:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke;
  v11[3] = &unk_2643D9D80;
  id v12 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x21D4A1230](v11);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke_2;
  block[3] = &unk_2643D9E38;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_barrier_async(queue, block);
}

uint64_t __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke_2(uint64_t a1)
{
  v17[1] = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 24) array];
    id v3 = objc_msgSend(v2, "safari_mapObjectsUsingBlock:", &__block_literal_global_26);

    id v16 = @"Changes";
    v17[0] = v3;
    id v4 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v15 = 0;
    id v5 = [MEMORY[0x263F08AC0] dataWithPropertyList:v4 format:200 options:0 error:&v15];
    id v6 = v15;
    uint64_t v7 = v6;
    if (v5)
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 88);
      id v14 = v6;
      char v9 = [v5 writeToURL:v8 options:0 error:&v14];
      id v10 = v14;

      if ((v9 & 1) == 0)
      {
        long long v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke_2_cold_2(v11, v10);
        }
      }
      uint64_t v7 = v10;
    }
    else
    {
      uint64_t v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke_2_cold_1(v13, v7);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v12();
  }
}

uint64_t __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_folderIDToReorderedChildrenChanges, 0);
  objc_storeStrong((id *)&self->_folderIDToModifiedChildrenChanges, 0);
  objc_storeStrong((id *)&self->_folderIDToAddedChildrenChanges, 0);
  objc_storeStrong((id *)&self->_folderIDToDeletedChildrenChanges, 0);
  objc_storeStrong((id *)&self->_folderIDToChildrenChanges, 0);
  objc_storeStrong((id *)&self->_associatedIDToChanges, 0);
  objc_storeStrong((id *)&self->_bookmarkIDToChanges, 0);
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke_2_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v5, v6, "Error converting in-memory changes into plist data: %@{public}", v7, v8, v9, v10, 2u);
}

void __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke_2_cold_2(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v5, v6, "Failed to persist in-memory bookmarks changes plist: %{public}@", v7, v8, v9, v10, 2u);
}

@end