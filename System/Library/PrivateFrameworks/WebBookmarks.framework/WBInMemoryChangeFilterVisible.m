@interface WBInMemoryChangeFilterVisible
- (BOOL)isBookmarkVisible:(id)a3;
- (id)bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet:(id)a3 inFolder:(int)a4;
- (id)bookmarkIDsModifiedInMemoryPassingFilterFromChangeSet:(id)a3 inFolder:(int)a4;
@end

@implementation WBInMemoryChangeFilterVisible

- (id)bookmarkIDsModifiedInMemoryPassingFilterFromChangeSet:(id)a3 inFolder:(int)a4
{
  v5 = [a3 modifiedBookmarksInBookmarkFolder:*(void *)&a4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __96__WBInMemoryChangeFilterVisible_bookmarkIDsModifiedInMemoryPassingFilterFromChangeSet_inFolder___block_invoke;
  v8[3] = &unk_2643DC660;
  v8[4] = self;
  v6 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v8);

  return v6;
}

- (id)bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet:(id)a3 inFolder:(int)a4
{
  v5 = [a3 modifiedBookmarksInBookmarkFolder:*(void *)&a4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __99__WBInMemoryChangeFilterVisible_bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet_inFolder___block_invoke;
  v8[3] = &unk_2643DC660;
  v8[4] = self;
  v6 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v8);

  return v6;
}

- (BOOL)isBookmarkVisible:(id)a3
{
  id v3 = a3;
  v4 = [v3 extraAttributes];
  v5 = [v4 objectForKeyedSubscript:@"com.apple.bookmarks.OmitFromUI"];
  if (v5) {
    LOBYTE(v6) = 0;
  }
  else {
    int v6 = [v3 isHidden] ^ 1;
  }

  return v6;
}

id __99__WBInMemoryChangeFilterVisible_bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet_inFolder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isBookmarkVisible:v3])
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "identifier"));
  }

  return v4;
}

id __96__WBInMemoryChangeFilterVisible_bookmarkIDsModifiedInMemoryPassingFilterFromChangeSet_inFolder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isBookmarkVisible:v3])
  {
    v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "identifier"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end