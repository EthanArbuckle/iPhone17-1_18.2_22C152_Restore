@interface MTUpNextController
+ (id)_encodedUpNextClasses;
+ (id)_filePath;
+ (id)unarchivedIdentifiers;
- (BOOL)containsEpisodeUuid:(id)a3;
- (BOOL)hasItemsInQueue;
- (BOOL)isPlayingFromUpNext;
- (BOOL)moveEpisodeFrom:(unint64_t)a3 to:(unint64_t)a4;
- (MTCoalescableWorkController)saveController;
- (MTPlayerController)playerController;
- (MTUpNextController)initWithPlayerController:(id)a3;
- (NSArray)items;
- (NSMutableArray)playerItems;
- (OS_dispatch_queue)workQueue;
- (id)_encodedUpNext;
- (unint64_t)_currentUpNextIndex;
- (unint64_t)count;
- (unint64_t)upNextOffset;
- (unint64_t)updateCount;
- (void)_reportUpNextChangeType:(id)a3 forPlayerItem:(id)a4 withData:(id)a5;
- (void)_reportUpNextChangeType:(id)a3 forPlayerItems:(id)a4 withData:(id)a5;
- (void)_restoreUpNext;
- (void)_upNextDidChange;
- (void)addEpisodeUuidToPlayNext:(id)a3;
- (void)addEpisodeUuidToUpNext:(id)a3;
- (void)addEpisodeUuidsToPlayNext:(id)a3;
- (void)addEpisodeUuidsToUpNext:(id)a3;
- (void)addPlayerItemToPlayNext:(id)a3;
- (void)addPlayerItemToUpNext:(id)a3;
- (void)addPlayerItemsToPlayNext:(id)a3;
- (void)addPlayerItemsToUpNext:(id)a3;
- (void)beginUpdates;
- (void)clear;
- (void)clearQueueItems;
- (void)endUpdates;
- (void)removeEpisodeAtIndex:(unint64_t)a3;
- (void)removeEpisodesForUuid:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setPlayerItems:(id)a3;
- (void)setSaveController:(id)a3;
- (void)setUpdateCount:(unint64_t)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation MTUpNextController

- (MTUpNextController)initWithPlayerController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTUpNextController;
  v5 = [(MTUpNextController *)&v11 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("MTUpNextController.workQueue", 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v6;

    v8 = (MTCoalescableWorkController *)[objc_alloc((Class)MTCoalescableWorkController) initWithWorkQueue:v5->_workQueue identifier:@"MTUpNextController.workQueue"];
    saveController = v5->_saveController;
    v5->_saveController = v8;

    objc_storeWeak((id *)&v5->_playerController, v4);
    [(MTUpNextController *)v5 _restoreUpNext];
  }

  return v5;
}

- (void)addEpisodeUuidToUpNext:(id)a3
{
  id v4 = +[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:a3];
  [(MTUpNextController *)self addPlayerItemToUpNext:v4];
}

- (void)addEpisodeUuidsToUpNext:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v14 = self;
    v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_super v11 = +[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          [v5 addObject:v11];
          v12 = _MTLogCategoryPlayback();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            v13 = [v11 title];
            *(_DWORD *)buf = 138412290;
            v20 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Added episode to array to add to Up Next Queue: %@", buf, 0xCu);
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v8);
    }

    [(MTUpNextController *)v14 addPlayerItemsToUpNext:v5];
  }
}

- (void)addPlayerItemToUpNext:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 setEditingStyleFlags:3];
    id v6 = [(MTUpNextController *)self playerItems];
    [v6 addObject:v5];

    [(MTUpNextController *)self _upNextDidChange];
    id v7 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [v5 title];
      int v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Added episode to Up Next Queue: %@", (uint8_t *)&v9, 0xCu);
    }
    [(MTUpNextController *)self _reportUpNextChangeType:@"add_to_up_next" forPlayerItem:v5 withData:0];
  }
}

- (void)addPlayerItemsToUpNext:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        int v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) setEditingStyleFlags:3];
          int v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    v10 = [(MTUpNextController *)self playerItems];
    [v10 addObjectsFromArray:v5];

    [(MTUpNextController *)self _upNextDidChange];
    objc_super v11 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Added array of episodes to Up Next Queue", v12, 2u);
    }

    [(MTUpNextController *)self _reportUpNextChangeType:@"add_multiple_to_up_next" forPlayerItems:v5 withData:0];
  }
}

- (void)addEpisodeUuidToPlayNext:(id)a3
{
  id v4 = +[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:a3];
  [(MTUpNextController *)self addPlayerItemToUpNext:v4];
}

- (void)addEpisodeUuidsToPlayNext:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    long long v14 = self;
    id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_super v11 = +[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          [v5 addObject:v11];
          v12 = _MTLogCategoryPlayback();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            long long v13 = [v11 title];
            *(_DWORD *)buf = 138412290;
            v20 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Added episode to array to add to Up Next Queue: %@", buf, 0xCu);
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v8);
    }

    [(MTUpNextController *)v14 addPlayerItemsToPlayNext:v5];
  }
}

- (void)addPlayerItemToPlayNext:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 setEditingStyleFlags:3];
    if ([(MTUpNextController *)self isPlayingFromUpNext]) {
      id v6 = (char *)[(MTUpNextController *)self _currentUpNextIndex] + 1;
    }
    else {
      id v6 = 0;
    }
    id v7 = [(MTUpNextController *)self playerItems];
    [v7 insertObject:v5 atIndex:v6];

    [(MTUpNextController *)self _upNextDidChange];
    id v8 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [v5 title];
      *(_DWORD *)buf = 138412546;
      long long v15 = v9;
      __int16 v16 = 2048;
      long long v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Added episode to Play Next \bQueue: %@ at index: %lu", buf, 0x16u);
    }
    v10 = +[NSNumber numberWithUnsignedInteger:v6, @"index"];
    long long v13 = v10;
    objc_super v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [(MTUpNextController *)self _reportUpNextChangeType:@"add_to_play_next" forPlayerItem:v5 withData:v11];
  }
}

- (void)addPlayerItemsToPlayNext:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)v9) setEditingStyleFlags:3 v16];
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v7);
    }

    if ([(MTUpNextController *)self isPlayingFromUpNext]) {
      v10 = (char *)[(MTUpNextController *)self _currentUpNextIndex] + 1;
    }
    else {
      v10 = 0;
    }
    objc_super v11 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v10, [v5 count]);
    uint64_t v12 = [(MTUpNextController *)self playerItems];
    [v12 insertObjects:v5 atIndexes:v11];

    [(MTUpNextController *)self _upNextDidChange];
    long long v13 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Added array of episodes to Play Next Queue at index: %lu", buf, 0xCu);
    }

    CFStringRef v20 = @"starting_index";
    long long v14 = +[NSNumber numberWithUnsignedInteger:v10];
    v21 = v14;
    long long v15 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    [(MTUpNextController *)self _reportUpNextChangeType:@"add_multiple_to_play_next" forPlayerItems:v5 withData:v15];
  }
}

- (BOOL)containsEpisodeUuid:(id)a3
{
  id v4 = a3;
  id v5 = [(MTUpNextController *)self playerItems];
  id v6 = [v5 copy];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_super v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) episodeUuid:v14];
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v8;
}

- (void)removeEpisodeAtIndex:(unint64_t)a3
{
  if ([(MTUpNextController *)self count] > a3)
  {
    id v5 = [(MTUpNextController *)self playerItems];
    id v6 = [v5 objectAtIndex:a3];

    id v7 = [(MTUpNextController *)self playerItems];
    [v7 removeObjectAtIndex:a3];

    [(MTUpNextController *)self _upNextDidChange];
    id v8 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [v6 title];
      *(_DWORD *)buf = 138412546;
      long long v15 = v9;
      __int16 v16 = 2048;
      unint64_t v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Removed item from Up Next Controller items: %@ from index: %lu", buf, 0x16u);
    }
    v10 = +[NSNumber numberWithUnsignedInteger:a3, @"index"];
    long long v13 = v10;
    objc_super v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [(MTUpNextController *)self _reportUpNextChangeType:@"remove_index" forPlayerItem:v6 withData:v11];
  }
}

- (void)removeEpisodesForUuid:(id)a3
{
  id v4 = a3;
  id v5 = [(MTUpNextController *)self playerItems];
  long long v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  long long v15 = sub_10011F39C;
  __int16 v16 = &unk_100552218;
  id v17 = v4;
  long long v18 = self;
  id v6 = v4;
  id v7 = [v5 indexesOfObjectsPassingTest:&v13];

  if (objc_msgSend(v7, "firstIndex", v13, v14, v15, v16) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(MTUpNextController *)self playerItems];
    uint64_t v9 = [v8 objectAtIndex:[v7 firstIndex]];

    v10 = [(MTUpNextController *)self playerItems];
    [v10 removeObjectsAtIndexes:v7];

    [(MTUpNextController *)self _upNextDidChange];
    objc_super v11 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [v9 title];
      *(_DWORD *)buf = 138412290;
      CFStringRef v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Removed item from Up Next Controller items: %@", buf, 0xCu);
    }
    [(MTUpNextController *)self _reportUpNextChangeType:@"remove_uuid" forPlayerItem:v9 withData:0];
  }
}

- (BOOL)moveEpisodeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  if ([(MTUpNextController *)self count] <= a3) {
    return 0;
  }
  unint64_t v7 = [(MTUpNextController *)self count];
  BOOL result = 0;
  if (a3 != a4 && v7 > a4)
  {
    uint64_t v9 = [(MTUpNextController *)self playerItems];
    v10 = [v9 objectAtIndex:a3];

    objc_super v11 = [(MTUpNextController *)self playerItems];
    [v11 removeObjectAtIndex:a3];

    uint64_t v12 = [(MTUpNextController *)self playerItems];
    [v12 insertObject:v10 atIndex:a4];

    [(MTUpNextController *)self _upNextDidChange];
    long long v13 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = [v10 title];
      *(_DWORD *)buf = 138412802;
      v21 = v14;
      __int16 v22 = 2048;
      unint64_t v23 = a3;
      __int16 v24 = 2048;
      unint64_t v25 = a4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Moved episode %@ in Up Next Controller items from index %lu to index %lu", buf, 0x20u);
    }
    long long v15 = +[NSNumber numberWithUnsignedInteger:a3, @"from"];
    v18[1] = @"to";
    v19[0] = v15;
    __int16 v16 = +[NSNumber numberWithUnsignedInteger:a4];
    v19[1] = v16;
    id v17 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    [(MTUpNextController *)self _reportUpNextChangeType:@"move" forPlayerItem:v10 withData:v17];

    return 1;
  }
  return result;
}

- (void)clear
{
  [(MTUpNextController *)self _reportUpNextChangeType:@"clear" forPlayerItem:0 withData:0];
  if ([(MTUpNextController *)self count])
  {
    v3 = [(MTUpNextController *)self playerItems];
    [v3 removeAllObjects];

    [(MTUpNextController *)self _upNextDidChange];
  }
  id v4 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Cleared all items from Up Next Controller items", v5, 2u);
  }
}

- (void)clearQueueItems
{
  [(MTUpNextController *)self _reportUpNextChangeType:@"clearQueueItems" forPlayerItem:0 withData:0];
  if ([(MTUpNextController *)self count])
  {
    unsigned int v3 = [(MTUpNextController *)self isPlayingFromUpNext];
    id v4 = [(MTUpNextController *)self playerItems];
    id v5 = v4;
    if (v3)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10011F810;
      v10[3] = &unk_100552240;
      v10[4] = self;
      id v6 = [v4 indexesOfObjectsPassingTest:v10];

      unint64_t v7 = [(MTUpNextController *)self playerItems];
      [v7 removeObjectsAtIndexes:v6];
    }
    else
    {
      [v4 removeAllObjects];
    }
    [(MTUpNextController *)self _upNextDidChange];
  }
  id v8 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Cleared all queued items from Up Next Controller items, leaving currently playing if applicable", v9, 2u);
  }
}

- (BOOL)isPlayingFromUpNext
{
  v2 = [(MTUpNextController *)self playerController];
  unsigned int v3 = [v2 compositeManifest];
  id v4 = [v2 upNextManifest];
  unsigned __int8 v5 = [v3 isPlayingFromManifest:v4];

  return v5;
}

- (unint64_t)upNextOffset
{
  return [(MTUpNextController *)self isPlayingFromUpNext];
}

- (BOOL)hasItemsInQueue
{
  unint64_t v3 = [(MTUpNextController *)self count];
  return v3 > [(MTUpNextController *)self upNextOffset];
}

- (void)beginUpdates
{
  unint64_t v3 = (char *)[(MTUpNextController *)self updateCount] + 1;

  [(MTUpNextController *)self setUpdateCount:v3];
}

- (void)endUpdates
{
  [(MTUpNextController *)self setUpdateCount:(char *)[(MTUpNextController *)self updateCount] - 1];
  if (![(MTUpNextController *)self updateCount])
  {
    [(MTUpNextController *)self _upNextDidChange];
  }
}

- (NSArray)items
{
  v2 = [(MTUpNextController *)self playerItems];
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (unint64_t)count
{
  v2 = [(MTUpNextController *)self playerItems];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)_currentUpNextIndex
{
  v2 = [(MTUpNextController *)self playerController];
  id v3 = [v2 upNextManifest];
  id v4 = [v3 currentIndex];

  return (unint64_t)v4;
}

- (void)_reportUpNextChangeType:(id)a3 forPlayerItem:(id)a4 withData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(MTUpNextController *)self workQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10011FB84;
  v15[3] = &unk_10054DFE8;
  id v16 = v8;
  id v17 = v10;
  long long v18 = self;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_reportUpNextChangeType:(id)a3 forPlayerItems:(id)a4 withData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(MTUpNextController *)self workQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10011FD5C;
  v15[3] = &unk_10054DFE8;
  id v16 = v8;
  id v17 = v10;
  long long v18 = self;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (id)_encodedUpNext
{
  id v3 = +[NSMutableArray array];
  id v4 = [(MTUpNextController *)self playerItems];
  id v5 = [v4 copy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = +[MTPlaybackIdentifierUtil sharedInstance];
        id v13 = [v12 requestIdentifierForPlayerItem:v11];

        [v3 addObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v3;
}

+ (id)_encodedUpNextClasses
{
  if (qword_10060A8E0 != -1) {
    dispatch_once(&qword_10060A8E0, &stru_100552260);
  }
  v2 = (void *)qword_10060A8D8;

  return v2;
}

- (void)_upNextDidChange
{
  if (![(MTUpNextController *)self updateCount])
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:@"MTUpNextControllerItemsDidChange" object:self];

    id v4 = [(MTUpNextController *)self saveController];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10012018C;
    v5[3] = &unk_10054D570;
    v5[4] = self;
    [v4 schedule:v5];
  }
}

+ (id)unarchivedIdentifiers
{
  v2 = [(id)objc_opt_class() _encodedUpNextClasses];
  id v3 = [(id)objc_opt_class() _filePath];
  id v4 = +[NSData dataWithContentsOfFile:v3];
  uint64_t v10 = 0;
  id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v2 fromData:v4 error:&v10];
  uint64_t v6 = v10;

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    id v8 = [v5 copy];
  }
  else {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

- (void)_restoreUpNext
{
  id v3 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Restoring Up Next", buf, 2u);
  }

  id v4 = +[NSMutableArray array];
  [(MTUpNextController *)self setPlayerItems:v4];

  id v5 = [(id)objc_opt_class() unarchivedIdentifiers];
  uint64_t v6 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Up Next Controller items after restore:", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v10 = buf;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  BOOL v7 = +[MTPlaybackIdentifierUtil sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001204B8;
  v8[3] = &unk_100552288;
  v8[4] = self;
  v8[5] = buf;
  [v7 fetchPlayerItemsForPlaybackQueueRequestIdentifiers:v5 completion:v8];

  v10[24] = 1;
  _Block_object_dispose(buf, 8);
}

+ (id)_filePath
{
  v2 = +[MTConstants sharedDocumentsDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"upnext_items.data"];

  id v4 = [v3 path];

  return v4;
}

- (MTPlayerController)playerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerController);

  return (MTPlayerController *)WeakRetained;
}

- (void)setPlayerController:(id)a3
{
}

- (NSMutableArray)playerItems
{
  return self->_playerItems;
}

- (void)setPlayerItems:(id)a3
{
}

- (unint64_t)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(unint64_t)a3
{
  self->_updateCount = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (MTCoalescableWorkController)saveController
{
  return self->_saveController;
}

- (void)setSaveController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveController, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_playerItems, 0);

  objc_destroyWeak((id *)&self->_playerController);
}

@end