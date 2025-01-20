@interface WBDuplicateBookmarkGroup
- (BOOL)foundDuplicates;
- (NSArray)duplicates;
- (NSArray)duplicatesToKeep;
- (WBDuplicateBookmarkGroup)initWithOriginalBookmark:(id)a3;
- (WebBookmark)originalBookmark;
- (void)addDuplicateBookmark:(id)a3 replaceOriginal:(BOOL)a4;
- (void)addDuplicateBookmarkToKeep:(id)a3;
- (void)exchangeOriginalBookmarkWithBookmark:(id)a3;
- (void)removeAllDuplicates;
@end

@implementation WBDuplicateBookmarkGroup

- (WBDuplicateBookmarkGroup)initWithOriginalBookmark:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBDuplicateBookmarkGroup;
  v6 = [(WBDuplicateBookmarkGroup *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    dupicateBookmarks = v6->_dupicateBookmarks;
    v6->_dupicateBookmarks = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    dupicateBookmarksToKeep = v6->_dupicateBookmarksToKeep;
    v6->_dupicateBookmarksToKeep = (NSMutableArray *)v9;

    objc_storeStrong((id *)&v6->_originalBookmark, a3);
    v11 = v6;
  }

  return v6;
}

- (NSArray)duplicates
{
  return (NSArray *)self->_dupicateBookmarks;
}

- (NSArray)duplicatesToKeep
{
  return (NSArray *)self->_dupicateBookmarksToKeep;
}

- (void)addDuplicateBookmark:(id)a3 replaceOriginal:(BOOL)a4
{
  id v7 = a3;
  self->_foundDuplicates = 1;
  dupicateBookmarks = self->_dupicateBookmarks;
  id v9 = v7;
  if (a4)
  {
    [(NSMutableArray *)dupicateBookmarks addObject:self->_originalBookmark];
    objc_storeStrong((id *)&self->_originalBookmark, a3);
  }
  else
  {
    [(NSMutableArray *)dupicateBookmarks addObject:v7];
  }
}

- (void)addDuplicateBookmarkToKeep:(id)a3
{
}

- (void)exchangeOriginalBookmarkWithBookmark:(id)a3
{
}

- (void)removeAllDuplicates
{
}

- (WebBookmark)originalBookmark
{
  return self->_originalBookmark;
}

- (BOOL)foundDuplicates
{
  return self->_foundDuplicates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalBookmark, 0);
  objc_storeStrong((id *)&self->_dupicateBookmarksToKeep, 0);
  objc_storeStrong((id *)&self->_dupicateBookmarks, 0);
}

@end