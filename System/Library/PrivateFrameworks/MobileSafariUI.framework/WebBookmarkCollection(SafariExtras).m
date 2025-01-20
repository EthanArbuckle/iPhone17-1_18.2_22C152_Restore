@interface WebBookmarkCollection(SafariExtras)
+ (id)mainBookmarkCollection;
- (id)bookmarksInFavoritesList;
- (uint64_t)receivedBookmarksDidChangeNotification:()SafariExtras;
@end

@implementation WebBookmarkCollection(SafariExtras)

- (id)bookmarksInFavoritesList
{
  v2 = [(id)bookmarksInFavoritesListCache objectForKey:a1];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = [a1 favoritesFolderList];
    v6 = v5;
    if (v5)
    {
      if ([v5 bookmarkCount] > 7)
      {
        if (!bookmarksInFavoritesListCache)
        {
          id v7 = objc_alloc_init(MEMORY[0x1E4F1C998]);
          v8 = (void *)bookmarksInFavoritesListCache;
          bookmarksInFavoritesListCache = (uint64_t)v7;

          [(id)bookmarksInFavoritesListCache setCountLimit:1];
        }
        id v4 = [a1 fastFetchBookmarksInBookmarkList:v6];
        [(id)bookmarksInFavoritesListCache setObject:v4 forKey:a1];
      }
      else
      {
        id v4 = [v6 bookmarkArray];
      }
    }
    else
    {
      id v4 = 0;
    }
  }
  return v4;
}

+ (id)mainBookmarkCollection
{
  v0 = (void *)mainBookmarkCollection;
  if (!mainBookmarkCollection)
  {
    uint64_t v1 = [MEMORY[0x1E4FB60E8] safariBookmarkCollection];
    v2 = (void *)mainBookmarkCollection;
    mainBookmarkCollection = v1;

    if (!mainBookmarkCollection
      || ([MEMORY[0x1E4F28EB8] defaultCenter],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v3 addObserver:mainBookmarkCollection selector:sel_receivedBookmarksDidChangeNotification_ name:*MEMORY[0x1E4FB6148] object:0], objc_msgSend(v3, "addObserver:selector:name:object:", mainBookmarkCollection, sel_receivedBookmarksDidChangeNotification_, *MEMORY[0x1E4FB6158], 0), v3, (v0 = (void *)mainBookmarkCollection) == 0))
    {
      +[WebBookmarkCollection _startBookmarkCollectionOpenRetryTimer]();
      v0 = (void *)mainBookmarkCollection;
    }
  }
  return v0;
}

- (uint64_t)receivedBookmarksDidChangeNotification:()SafariExtras
{
  return [(id)bookmarksInFavoritesListCache removeAllObjects];
}

@end