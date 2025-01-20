@interface WebBookmarkInMemoryChangeFilterUnreadOnly
- (id)_bookmarksIDsFromBookmarks:(id)a3 fromChangeSet:(id)a4 withFilter:(id)a5;
- (id)bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet:(id)a3 inFolder:(int)a4;
- (id)bookmarkIDsModifiedInMemoryPassingFilterFromChangeSet:(id)a3 inFolder:(int)a4;
@end

@implementation WebBookmarkInMemoryChangeFilterUnreadOnly

- (id)bookmarkIDsModifiedInMemoryPassingFilterFromChangeSet:(id)a3 inFolder:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [v6 modifiedBookmarksInBookmarkFolder:v4];
  v8 = [(WebBookmarkInMemoryChangeFilterUnreadOnly *)self _bookmarksIDsFromBookmarks:v7 fromChangeSet:v6 withFilter:&__block_literal_global_4];

  return v8;
}

BOOL __108__WebBookmarkInMemoryChangeFilterUnreadOnly_bookmarkIDsModifiedInMemoryPassingFilterFromChangeSet_inFolder___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 dateLastViewed];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet:(id)a3 inFolder:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [v6 modifiedBookmarksInBookmarkFolder:v4];
  v8 = [(WebBookmarkInMemoryChangeFilterUnreadOnly *)self _bookmarksIDsFromBookmarks:v7 fromChangeSet:v6 withFilter:&__block_literal_global_2];

  return v8;
}

BOOL __111__WebBookmarkInMemoryChangeFilterUnreadOnly_bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet_inFolder___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 dateLastViewed];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_bookmarksIDsFromBookmarks:(id)a3 fromChangeSet:(id)a4 withFilter:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = (unsigned int (**)(id, void *))a5;
  v8 = [MEMORY[0x263EFF9C0] set];
  v9 = [v6 changes];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v15 = [v14 bookmark];
        if (v15
          && ([v6 replayChangesOnBookmark:v15] & 0xFFFFFFFFFFFFFFFDLL) != 1
          && [v14 attributesMarkedAsModify:8]
          && v7[2](v7, v15))
        {
          v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "identifier"));
          [v8 addObject:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
  v17 = [v8 allObjects];

  return v17;
}

@end