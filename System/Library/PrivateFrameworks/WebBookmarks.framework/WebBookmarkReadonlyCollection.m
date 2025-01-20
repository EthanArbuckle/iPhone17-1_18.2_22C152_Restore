@interface WebBookmarkReadonlyCollection
- (id)_collection;
- (id)bookmarkWithID:(int)a3;
- (id)bookmarksMatchingString:(id)a3;
- (id)databaseHealthInformation;
- (id)initReadonlySafariBookmarkCollection;
- (id)leafChildCountForFoldersInFolderWithID:(int)a3;
- (id)readingListBookmarksMatchingString:(id)a3 maxResults:(unsigned int)a4 onlyArchivedBookmarks:(BOOL)a5;
- (id)readingListWithUnreadOnly:(BOOL)a3 filteredUsingString:(id)a4;
- (unint64_t)leafChildCountForBookmarksInFolderWithID:(int)a3;
- (void)enumerateBookmarks:(BOOL)a3 andReadingListItems:(BOOL)a4 matchingString:(id)a5 usingBlock:(id)a6;
@end

@implementation WebBookmarkReadonlyCollection

- (id)initReadonlySafariBookmarkCollection
{
  v11.receiver = self;
  v11.super_class = (Class)WebBookmarkReadonlyCollection;
  v2 = [(WebBookmarkReadonlyCollection *)&v11 init];
  if (v2)
  {
    id v3 = [NSString stringWithFormat:@"com.apple.WebBookmarks.WebBookmarkReadonlyCollection.%@.%p.%@", objc_opt_class(), v2, @"InternalQueue"];
    v4 = (const char *)[v3 UTF8String];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2(v4, v5, v6);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;

    v9 = v2;
  }

  return v2;
}

- (id)_collection
{
  collection = self->_collection;
  if (!collection)
  {
    v4 = [WebBookmarkCollection alloc];
    v5 = +[WBCollectionConfiguration readonlySafariBookmarkCollectionConfiguration];
    v6 = [(WebBookmarkCollection *)v4 initWithConfiguration:v5 checkIntegrity:0];
    dispatch_queue_t v7 = self->_collection;
    self->_collection = v6;

    collection = self->_collection;
  }
  v8 = collection;
  return v8;
}

- (void)enumerateBookmarks:(BOOL)a3 andReadingListItems:(BOOL)a4 matchingString:(id)a5 usingBlock:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __98__WebBookmarkReadonlyCollection_enumerateBookmarks_andReadingListItems_matchingString_usingBlock___block_invoke;
  v15[3] = &unk_2643DB718;
  BOOL v18 = a3;
  BOOL v19 = a4;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_sync(internalQueue, v15);
}

void __98__WebBookmarkReadonlyCollection_enumerateBookmarks_andReadingListItems_matchingString_usingBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  [v2 enumerateBookmarks:*(unsigned __int8 *)(a1 + 56) andReadingListItems:*(unsigned __int8 *)(a1 + 57) matchingString:*(void *)(a1 + 40) usingBlock:*(void *)(a1 + 48)];
}

- (id)readingListBookmarksMatchingString:(id)a3 maxResults:(unsigned int)a4 onlyArchivedBookmarks:(BOOL)a5
{
  id v8 = a3;
  uint64_t v18 = 0;
  BOOL v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __101__WebBookmarkReadonlyCollection_readingListBookmarksMatchingString_maxResults_onlyArchivedBookmarks___block_invoke;
  v13[3] = &unk_2643DB740;
  id v14 = v8;
  v15 = &v18;
  v13[4] = self;
  unsigned int v16 = a4;
  BOOL v17 = a5;
  id v10 = v8;
  dispatch_sync(internalQueue, v13);
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __101__WebBookmarkReadonlyCollection_readingListBookmarksMatchingString_maxResults_onlyArchivedBookmarks___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [v5 readingListBookmarksMatchingString:*(void *)(a1 + 40) maxResults:*(unsigned int *)(a1 + 56) onlyArchivedBookmarks:*(unsigned __int8 *)(a1 + 60)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)bookmarksMatchingString:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  unsigned int v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__WebBookmarkReadonlyCollection_bookmarksMatchingString___block_invoke;
  block[3] = &unk_2643DB768;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __57__WebBookmarkReadonlyCollection_bookmarksMatchingString___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [v5 bookmarksMatchingString:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)readingListWithUnreadOnly:(BOOL)a3 filteredUsingString:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  unsigned int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__5;
  BOOL v19 = __Block_byref_object_dispose__5;
  id v20 = 0;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__WebBookmarkReadonlyCollection_readingListWithUnreadOnly_filteredUsingString___block_invoke;
  v11[3] = &unk_2643DB790;
  id v12 = v6;
  id v13 = &v15;
  BOOL v14 = a3;
  v11[4] = self;
  id v8 = v6;
  dispatch_sync(internalQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __79__WebBookmarkReadonlyCollection_readingListWithUnreadOnly_filteredUsingString___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [v5 readingListWithUnreadOnly:*(unsigned __int8 *)(a1 + 56) filteredUsingString:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)bookmarkWithID:(int)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__5;
  id v12 = __Block_byref_object_dispose__5;
  id v13 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__WebBookmarkReadonlyCollection_bookmarkWithID___block_invoke;
  block[3] = &unk_2643DA478;
  block[4] = self;
  void block[5] = &v8;
  int v7 = a3;
  dispatch_sync(internalQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __48__WebBookmarkReadonlyCollection_bookmarkWithID___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [v5 bookmarkWithID:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)databaseHealthInformation
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__WebBookmarkReadonlyCollection_databaseHealthInformation__block_invoke;
  v5[3] = &unk_2643D9BB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __58__WebBookmarkReadonlyCollection_databaseHealthInformation__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [v5 databaseHealthInformation];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)leafChildCountForBookmarksInFolderWithID:(int)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__WebBookmarkReadonlyCollection_leafChildCountForBookmarksInFolderWithID___block_invoke;
  block[3] = &unk_2643DA478;
  block[4] = self;
  void block[5] = &v8;
  int v7 = a3;
  dispatch_sync(internalQueue, block);
  unint64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __74__WebBookmarkReadonlyCollection_leafChildCountForBookmarksInFolderWithID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _collection];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 leafChildCountForBookmarksInFolderWithID:*(unsigned int *)(a1 + 48)];
}

- (id)leafChildCountForFoldersInFolderWithID:(int)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__5;
  id v12 = __Block_byref_object_dispose__5;
  id v13 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__WebBookmarkReadonlyCollection_leafChildCountForFoldersInFolderWithID___block_invoke;
  block[3] = &unk_2643DA478;
  block[4] = self;
  void block[5] = &v8;
  int v7 = a3;
  dispatch_sync(internalQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __72__WebBookmarkReadonlyCollection_leafChildCountForFoldersInFolderWithID___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _collection];
  uint64_t v2 = [v5 leafChildCountForFoldersInFolderWithID:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end