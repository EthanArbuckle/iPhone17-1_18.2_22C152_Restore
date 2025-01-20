@interface BTAVRCP_Library
- (BTAVRCP_Library)init;
- (BTAVRCP_LibraryDelegate)delegate;
- (MPMediaQuery)currentSearchQuery;
- (NSMutableArray)currentVFSPath;
- (unint64_t)getNowPlayingItemsCount;
- (unint64_t)getSearchItemsCount;
- (unint64_t)getVFSItemsCount;
- (unsigned)getNowPlayingItemWithUid:(unint64_t)a3 attributeIDs:(id)a4 reply:(id)a5;
- (unsigned)getSearchItemWithUid:(unint64_t)a3 attributeIDs:(id)a4 reply:(id)a5;
- (unsigned)getVFSItemWithUid:(unint64_t)a3 attributeIDs:(id)a4 reply:(id)a5;
- (unsigned)playNowPlayingItemWithUid:(unint64_t)a3;
- (unsigned)playSearchItemWithUid:(unint64_t)a3;
- (unsigned)playVFSItemWithUid:(unint64_t)a3;
- (void)changePath:(unint64_t)a3 replyBlock:(id)a4;
- (void)dealloc;
- (void)getCurrentPath:(id)a3;
- (void)getNowPlayingItemsFromStart:(unint64_t)a3 toEnd:(unint64_t)a4 attributeIDs:(id)a5 replyBlock:(id)a6;
- (void)getSearchItemsFromStart:(unint64_t)a3 toEnd:(unint64_t)a4 attributeIDs:(id)a5 replyBlock:(id)a6;
- (void)getVFSItemsFromStart:(unint64_t)a3 toEnd:(unint64_t)a4 attributeIDs:(id)a5 replyBlock:(id)a6;
- (void)libraryDidChange;
- (void)search:(id)a3 replyBlock:(id)a4;
- (void)setCurrentSearchQuery:(id)a3;
- (void)setCurrentVFSPath:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BTAVRCP_Library

- (BTAVRCP_Library)init
{
  v11.receiver = self;
  v11.super_class = (Class)BTAVRCP_Library;
  v2 = [(BTAVRCP_Library *)&v11 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"libraryDidChange" name:MPMediaLibraryDidChangeNotification object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"libraryDidChange" name:MPRadioLibraryStationsDidChangeNotification object:0];

    v5 = +[MPMediaLibrary defaultMediaLibrary];
    [v5 setCloudFilteringType:7];

    v6 = +[MPMediaLibrary defaultMediaLibrary];
    [v6 beginGeneratingLibraryChangeNotifications];

    +[MPMediaQuery setFilteringDisabled:1];
    id v7 = objc_alloc((Class)NSMutableArray);
    v8 = objc_alloc_init(BTAVRCP_RootFolder);
    id v9 = [v7 initWithObjects:v8];
    [(BTAVRCP_Library *)v2 setCurrentVFSPath:v9];

    [(BTAVRCP_Library *)v2 setCurrentSearchQuery:0];
    [(BTAVRCP_Library *)v2 changePath:1 replyBlock:&stru_1000189D8];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[MPMediaLibrary defaultMediaLibrary];
  [v3 endGeneratingLibraryChangeNotifications];

  v4.receiver = self;
  v4.super_class = (Class)BTAVRCP_Library;
  [(BTAVRCP_Library *)&v4 dealloc];
}

- (void)libraryDidChange
{
  id v2 = [(BTAVRCP_Library *)self delegate];
  [v2 libraryDidChange];
}

- (void)getCurrentPath:(id)a3
{
  objc_super v4 = (void (**)(id, uint64_t, void *))a3;
  v5 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = [(BTAVRCP_Library *)self currentVFSPath];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v10);
        v12 = [(BTAVRCP_Library *)self currentVFSPath];
        v13 = [v12 firstObject];

        if (v11 != v13)
        {
          v14 = [v11 name];
          [v5 addObject:v14];
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v8);
  }

  v23[0] = @"kFolders";
  v23[1] = @"kNumItems";
  v24[0] = v5;
  v15 = [(BTAVRCP_Library *)self currentVFSPath];
  v16 = [v15 lastObject];
  v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 childrenCount]);
  v24[1] = v17;
  v18 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v4[2](v4, 4, v18);
}

- (void)changePath:(unint64_t)a3 replyBlock:(id)a4
{
  v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = [(BTAVRCP_Library *)self currentVFSPath];
  id v8 = v7;
  if (!a3)
  {
    id v16 = [v7 count];

    if ((unint64_t)v16 >= 2)
    {
      id v11 = [(BTAVRCP_Library *)self currentVFSPath];
      [v11 removeLastObject];
      goto LABEL_6;
    }
    uint64_t v10 = 9;
LABEL_9:
    v6[2](v6, v10, 0);
    goto LABEL_10;
  }
  uint64_t v9 = [v7 lastObject];
  id v21 = 0;
  uint64_t v10 = (uint64_t)[v9 createFolderWithUid:a3 folder:&v21];
  id v11 = v21;

  if (v10 != 4)
  {

    goto LABEL_9;
  }
  v12 = [(BTAVRCP_Library *)self currentVFSPath];
  v13 = [v12 lastObject];
  v14 = [v13 predicates];
  [v11 storePredicates:v14];

  v15 = [(BTAVRCP_Library *)self currentVFSPath];
  [v15 addObject:v11];

LABEL_6:
  CFStringRef v22 = @"kNumItems";
  v17 = [(BTAVRCP_Library *)self currentVFSPath];
  v18 = [v17 lastObject];
  long long v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v18 childrenCount]);
  v23 = v19;
  long long v20 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  ((void (**)(id, uint64_t, void *))v6)[2](v6, 4, v20);

LABEL_10:
}

- (void)getVFSItemsFromStart:(unint64_t)a3 toEnd:(unint64_t)a4 attributeIDs:(id)a5 replyBlock:(id)a6
{
  id v10 = a5;
  id v11 = (void (**)(id, uint64_t, void *))a6;
  v12 = +[NSMutableArray array];
  while (a3 <= a4)
  {
    v13 = [(BTAVRCP_Library *)self currentVFSPath];
    v14 = [v13 lastObject];
    v15 = [v14 replyItemAtIndex:a3 attributeIDs:v10];

    if (!v15) {
      break;
    }
    [v12 addObject:v15];

    ++a3;
  }
  if ([v12 count])
  {
    CFStringRef v17 = @"kItems";
    v18 = v12;
    id v16 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v11[2](v11, 4, v16);
  }
  else
  {
    v11[2](v11, 11, 0);
  }
}

- (void)getSearchItemsFromStart:(unint64_t)a3 toEnd:(unint64_t)a4 attributeIDs:(id)a5 replyBlock:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = (void (**)(void, void, void))v11;
  if (self->_currentSearchQuery)
  {
    v13 = +[NSMutableArray array];
    while (a3 <= a4)
    {
      v14 = [(MPMediaQuery *)self->_currentSearchQuery itemAtIndex:a3];
      if (!v14) {
        break;
      }
      v15 = v14;
      id v16 = [v14 replyItemWithAttributeIDs:v10];
      [v13 addObject:v16];

      ++a3;
    }
    if ([v13 count])
    {
      CFStringRef v18 = @"kItems";
      long long v19 = v13;
      CFStringRef v17 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      ((void (**)(void, uint64_t, void *))v12)[2](v12, 4, v17);
    }
    else
    {
      v12[2](v12, 11, 0);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v11 + 2))(v11, 20, 0);
  }
}

- (void)getNowPlayingItemsFromStart:(unint64_t)a3 toEnd:(unint64_t)a4 attributeIDs:(id)a5 replyBlock:(id)a6
{
  id v9 = a5;
  id v10 = (void (**)(id, uint64_t, void *))a6;
  id v11 = +[NSMutableArray array];
  v12 = +[MPMusicPlayerController systemMusicPlayer];
  id v13 = [v12 numberOfItems];
  if (a3 <= a4)
  {
    if ((unint64_t)v13 <= a3) {
      unint64_t v14 = a3;
    }
    else {
      unint64_t v14 = (unint64_t)v13;
    }
    unint64_t v15 = a4 + 1;
    do
    {
      if (v14 == a3) {
        break;
      }
      id v16 = [v12 nowPlayingItemAtIndex:a3];
      if (!v16) {
        break;
      }
      CFStringRef v17 = v16;
      CFStringRef v18 = [v16 replyItemWithAttributeIDs:v9];
      [v11 addObject:v18];

      ++a3;
    }
    while (v15 != a3);
  }
  if ([v11 count])
  {
    CFStringRef v20 = @"kItems";
    id v21 = v11;
    long long v19 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v10[2](v10, 4, v19);
  }
  else
  {
    v10[2](v10, 11, 0);
  }
}

- (unsigned)getVFSItemWithUid:(unint64_t)a3 attributeIDs:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(BTAVRCP_Library *)self currentVFSPath];
  id v11 = [v10 lastObject];
  v12 = [v11 replyAttributesForUid:a3 attributeIDs:v9];

  if (v12)
  {
    [v8 addEntriesFromDictionary:v12];
    unsigned __int8 v13 = 4;
  }
  else
  {
    unsigned __int8 v13 = 9;
  }

  return v13;
}

- (unsigned)getSearchItemWithUid:(unint64_t)a3 attributeIDs:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  currentSearchQuery = self->_currentSearchQuery;
  if (currentSearchQuery)
  {
    id v11 = [(MPMediaQuery *)currentSearchQuery itemWithUid:a3];
    v12 = v11;
    if (v11)
    {
      unsigned __int8 v13 = [v11 replyAttributesForIDs:v8];
      [v9 addEntriesFromDictionary:v13];

      unsigned __int8 v14 = 4;
    }
    else
    {
      unsigned __int8 v14 = 9;
    }
  }
  else
  {
    unsigned __int8 v14 = 20;
  }

  return v14;
}

- (unsigned)getNowPlayingItemWithUid:(unint64_t)a3 attributeIDs:(id)a4 reply:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[MPMusicPlayerController systemMusicPlayer];
  id v10 = [v9 nowPlayingItem];
  id v11 = v10;
  if (v10 && [v10 persistentID] == (id)a3)
  {
    id v12 = [v9 indexOfNowPlayingItem];
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (v12 == (id)0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v14 = (uint64_t)v12 + 1;
    }
    id v15 = [v9 numberOfItems];
    if (v15) {
      uint64_t v13 = (uint64_t)v15;
    }
  }
  else
  {

    id v16 = objc_alloc_init((Class)MPMediaQuery);
    id v11 = [v16 itemWithUid:a3];

    if (!v11)
    {
      unsigned __int8 v18 = 9;
      goto LABEL_13;
    }
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100004AB4;
  v20[3] = &unk_100018A00;
  uint64_t v23 = v14;
  uint64_t v24 = v13;
  id v21 = v8;
  id v22 = v11;
  id v17 = v11;
  [v7 enumerateAttributeIDs:v20];

  unsigned __int8 v18 = 4;
LABEL_13:

  return v18;
}

- (void)search:(id)a3 replyBlock:(id)a4
{
  v6 = (void (**)(id, uint64_t, void *))a4;
  id v7 = a3;
  id v8 = [(BTAVRCP_Library *)self currentVFSPath];
  id v9 = [v8 lastObject];
  id v10 = [v9 query];
  id v11 = [v10 copy];
  id v12 = v11;
  if (v11) {
    uint64_t v13 = (MPMediaQuery *)v11;
  }
  else {
    uint64_t v13 = (MPMediaQuery *)objc_alloc_init((Class)MPMediaQuery);
  }
  uint64_t v14 = v13;

  id v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", MPMediaItemPropertyTitle, MPMediaItemPropertyAlbumTitle, MPMediaItemPropertyArtist, MPMediaItemPropertyPodcastTitle, 0);
  id v16 = +[_MPMediaSearchStringPredicate predicateWithSearchString:v7 forProperties:v15];

  [(MPMediaQuery *)v14 addFilterPredicate:v16];
  currentSearchQuery = self->_currentSearchQuery;
  self->_currentSearchQuery = v14;
  unsigned __int8 v18 = v14;

  CFStringRef v22 = @"kNumItems";
  long long v19 = [(MPMediaQuery *)v18 items];
  CFStringRef v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v19 count]);
  uint64_t v23 = v20;
  id v21 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];

  v6[2](v6, 4, v21);
}

- (unint64_t)getVFSItemsCount
{
  id v2 = [(BTAVRCP_Library *)self currentVFSPath];
  v3 = [v2 lastObject];
  id v4 = [v3 childrenCount];

  return (unint64_t)v4;
}

- (unint64_t)getSearchItemsCount
{
  unint64_t result = (unint64_t)self->_currentSearchQuery;
  if (result)
  {
    v3 = [(id)result items];
    id v4 = [v3 count];

    return (unint64_t)v4;
  }
  return result;
}

- (unint64_t)getNowPlayingItemsCount
{
  id v2 = +[MPMusicPlayerController systemMusicPlayer];
  id v3 = [v2 numberOfItems];

  return (unint64_t)v3;
}

- (unsigned)playVFSItemWithUid:(unint64_t)a3
{
  id v4 = [(BTAVRCP_Library *)self currentVFSPath];
  v5 = [v4 lastObject];
  LOBYTE(a3) = [v5 playItemWithUid:a3];

  return a3;
}

- (unsigned)playSearchItemWithUid:(unint64_t)a3
{
  currentSearchQuery = self->_currentSearchQuery;
  if (!currentSearchQuery) {
    return 20;
  }
  v5 = [(MPMediaQuery *)currentSearchQuery itemWithUid:a3];
  if (v5)
  {
    v6 = +[MPMusicPlayerController systemMusicPlayer];
    [v6 setQueueWithQuery:self->_currentSearchQuery firstItem:v5];
    [v6 play];

    unsigned __int8 v7 = 4;
  }
  else
  {
    unsigned __int8 v7 = 9;
  }

  return v7;
}

- (unsigned)playNowPlayingItemWithUid:(unint64_t)a3
{
  id v4 = objc_alloc_init((Class)MPMediaQuery);
  v5 = [v4 itemWithUid:a3];
  if (v5)
  {
    v6 = +[MPMusicPlayerController systemMusicPlayer];
    [v6 setNowPlayingItem:v5];
    [v6 play];

    unsigned __int8 v7 = 4;
  }
  else
  {
    unsigned __int8 v7 = 9;
  }

  return v7;
}

- (BTAVRCP_LibraryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BTAVRCP_LibraryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)currentVFSPath
{
  return self->_currentVFSPath;
}

- (void)setCurrentVFSPath:(id)a3
{
}

- (MPMediaQuery)currentSearchQuery
{
  return self->_currentSearchQuery;
}

- (void)setCurrentSearchQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSearchQuery, 0);
  objc_storeStrong((id *)&self->_currentVFSPath, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end