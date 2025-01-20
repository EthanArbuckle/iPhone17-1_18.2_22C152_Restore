@interface TVPPlaylist
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)_isMediaItemExplicit:(id)a3;
- (BOOL)changeToActiveListIndex:(unint64_t)a3 withContext:(id)a4;
- (BOOL)isEqualToPlaylist:(id)a3;
- (BOOL)moreItemsAvailable:(int64_t)a3;
- (BOOL)shuffleEnabled;
- (BOOL)skipExplicit;
- (BOOL)supportsRepeat;
- (BOOL)supportsShuffle;
- (BOOL)windowed;
- (NSArray)activeList;
- (NSArray)trackList;
- (NSArray)upcomingItems;
- (NSDictionary)changeContext;
- (NSString)name;
- (TVPMediaItem)currentMediaItem;
- (TVPMediaItem)nextMediaItem;
- (TVPMediaItem)previousMediaItem;
- (TVPPlaylist)init;
- (TVPPlaylist)initWithMediaItems:(id)a3 index:(int64_t)a4 isCollection:(BOOL)a5;
- (int64_t)endAction;
- (int64_t)repeatMode;
- (unint64_t)_nextActiveListIndex;
- (unint64_t)_previousActiveListIndex;
- (unint64_t)activeListIndex;
- (unint64_t)count;
- (unint64_t)currentIndex;
- (unint64_t)numConsecutivePlaybackFailures;
- (unint64_t)upNextIndex;
- (unint64_t)upcomingItemsLimit;
- (void)_shuffle:(BOOL)a3;
- (void)_updateCurrent:(BOOL)a3 andNextItems:(BOOL)a4 withContext:(id)a5;
- (void)addItem:(id)a3;
- (void)addItems:(id)a3;
- (void)addItemsToUpNext:(id)a3;
- (void)changeMedia:(int64_t)a3;
- (void)changeMedia:(int64_t)a3 withContext:(id)a4;
- (void)insertItem:(id)a3 atIndex:(unint64_t)a4;
- (void)insertItems:(id)a3 atIndexes:(id)a4;
- (void)removeItemAtIndex:(unint64_t)a3;
- (void)removeItemsAtIndexes:(id)a3;
- (void)setChangeContext:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setCurrentIndex:(unint64_t)a3;
- (void)setCurrentMediaItem:(id)a3;
- (void)setEndAction:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setNextMediaItem:(id)a3;
- (void)setNumConsecutivePlaybackFailures:(unint64_t)a3;
- (void)setPreviousMediaItem:(id)a3;
- (void)setRepeatMode:(int64_t)a3;
- (void)setShuffleEnabled:(BOOL)a3 preserveCurrentItem:(BOOL)a4;
- (void)setSkipExplicit:(BOOL)a3;
- (void)setUpcomingItemsLimit:(unint64_t)a3;
- (void)setWindowed:(BOOL)a3;
@end

@implementation TVPPlaylist

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"shuffleEnabled"] & 1) != 0
    || ([v4 isEqualToString:@"endAction"] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___TVPPlaylist;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (TVPPlaylist)init
{
  return [(TVPPlaylist *)self initWithMediaItems:0 index:0 isCollection:0];
}

- (TVPPlaylist)initWithMediaItems:(id)a3 index:(int64_t)a4 isCollection:(BOOL)a5
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TVPPlaylist;
  v8 = [(TVPPlaylist *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_upcomingItemsLimit = 20;
    v8->_endAction = 0;
    uint64_t v10 = [objc_alloc(MEMORY[0x263EFF980]) initWithArray:v7];
    trackList = v9->_trackList;
    v9->_trackList = (NSMutableArray *)v10;

    objc_storeStrong((id *)&v9->_activeList, v9->_trackList);
    shuffledItems = v9->_shuffledItems;
    v9->_shuffledItems = 0;
    v9->_activeListIndex = a4;

    [(TVPPlaylist *)v9 _updateCurrent:0 andNextItems:0 withContext:0];
  }

  return v9;
}

- (BOOL)isEqualToPlaylist:(id)a3
{
  id v4 = (TVPPlaylist *)a3;
  unsigned __int8 v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      BOOL v14 = 1;
      goto LABEL_10;
    }
    v6 = [(TVPPlaylist *)self trackList];
    uint64_t v7 = [v6 count];
    v8 = [(TVPPlaylist *)v5 trackList];
    uint64_t v9 = [v8 count];

    if (v7 == v9)
    {
      int64_t v10 = [(TVPPlaylist *)self repeatMode];
      if (v10 == [(TVPPlaylist *)v5 repeatMode])
      {
        BOOL v11 = [(TVPPlaylist *)self shuffleEnabled];
        if (v11 == [(TVPPlaylist *)v5 shuffleEnabled])
        {
          int64_t v12 = [(TVPPlaylist *)self endAction];
          if (v12 == [(TVPPlaylist *)v5 endAction])
          {
            BOOL v13 = [(TVPPlaylist *)self skipExplicit];
            if (v13 == [(TVPPlaylist *)v5 skipExplicit])
            {
              uint64_t v20 = 0;
              v21 = &v20;
              uint64_t v22 = 0x2020000000;
              char v23 = 1;
              v16 = [(TVPPlaylist *)self trackList];
              v17[0] = MEMORY[0x263EF8330];
              v17[1] = 3221225472;
              v17[2] = __33__TVPPlaylist_isEqualToPlaylist___block_invoke;
              v17[3] = &unk_264CC4FF8;
              v18 = v5;
              v19 = &v20;
              [v16 enumerateObjectsUsingBlock:v17];

              BOOL v14 = *((unsigned char *)v21 + 24) != 0;
              _Block_object_dispose(&v20, 8);
              goto LABEL_10;
            }
          }
        }
      }
    }
  }
  BOOL v14 = 0;
LABEL_10:

  return v14;
}

void __33__TVPPlaylist_isEqualToPlaylist___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  uint64_t v9 = [v7 trackList];
  id v10 = [v9 objectAtIndex:a3];

  LOBYTE(a3) = [v8 isEqualToMediaItem:v10];
  if ((a3 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)changeMedia:(int64_t)a3
{
}

- (void)changeMedia:(int64_t)a3 withContext:(id)a4
{
  v6 = (void *)MEMORY[0x263F08A00];
  id v7 = a4;
  id v8 = [v6 defaultCenter];
  [v8 postNotificationName:@"TVPPlaylistMediaChangeRequestedNotification" object:self userInfo:v7];

  id v21 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v7];

  if (!self->_windowed)
  {
    if (a3 != 1)
    {
      if (a3) {
        goto LABEL_32;
      }
      int64_t repeatMode = self->_repeatMode;
      if (repeatMode != 2)
      {
        if (repeatMode == 1)
        {
          unint64_t v15 = [(TVPPlaylist *)self _nextActiveListIndex];
          self->_unint64_t activeListIndex = v15 % [(NSMutableArray *)self->_trackList count];
        }
        else
        {
          unint64_t activeListIndex = self->_activeListIndex;
          if (activeListIndex < [(NSArray *)self->_activeList count])
          {
            unint64_t v20 = [(TVPPlaylist *)self _nextActiveListIndex];
            self->_unint64_t activeListIndex = v20;
            if (v20 == [(NSArray *)self->_activeList count]) {
              [v21 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"TVPPlaylistDidHitEndKey"];
            }
          }
        }
      }
      BOOL v11 = &unk_26EA25BE8;
      goto LABEL_28;
    }
    if (![(TVPPlaylist *)self moreItemsAvailable:1])
    {
      [v21 setObject:&unk_26EA25C00 forKeyedSubscript:@"direction"];
      BOOL v11 = (void *)MEMORY[0x263EFFA88];
      int64_t v12 = @"TVPPlaylistDidHitBeginningKey";
LABEL_29:
      BOOL v13 = v21;
      goto LABEL_30;
    }
    int64_t v16 = self->_repeatMode;
    if (v16 != 2)
    {
      if (v16 == 1)
      {
        if (!self->_activeListIndex)
        {
          uint64_t v17 = [(NSArray *)self->_activeList count];
          if (v17 <= 1) {
            uint64_t v18 = 1;
          }
          else {
            uint64_t v18 = v17;
          }
          self->_unint64_t activeListIndex = v18 - 1;
          goto LABEL_27;
        }
        goto LABEL_26;
      }
      if (self->_activeListIndex) {
LABEL_26:
      }
        self->_unint64_t activeListIndex = [(TVPPlaylist *)self _previousActiveListIndex];
    }
LABEL_27:
    BOOL v11 = &unk_26EA25C00;
LABEL_28:
    int64_t v12 = @"direction";
    goto LABEL_29;
  }
  if (a3 == 1) {
    goto LABEL_32;
  }
  if ([(NSMutableArray *)self->_trackList count]) {
    [(NSMutableArray *)self->_trackList removeObjectAtIndex:0];
  }
  self->_unint64_t activeListIndex = 0;
  id v10 = [v21 objectForKeyedSubscript:@"direction"];

  id v9 = v21;
  if (v10) {
    goto LABEL_31;
  }
  BOOL v11 = &unk_26EA25BE8;
  int64_t v12 = @"direction";
  BOOL v13 = v21;
LABEL_30:
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v12, v9);
  id v9 = v21;
LABEL_31:
  [(TVPPlaylist *)self _updateCurrent:0 andNextItems:0 withContext:v9];
LABEL_32:
}

- (BOOL)changeToActiveListIndex:(unint64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  if ([(NSArray *)self->_activeList count] <= a3
    || [(TVPPlaylist *)self skipExplicit]
    && ([(NSArray *)self->_activeList objectAtIndex:a3],
        id v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = [(TVPPlaylist *)self _isMediaItemExplicit:v7],
        v7,
        v8))
  {
    BOOL v9 = 0;
  }
  else
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v6];
    BOOL v11 = v10;
    if (self->_windowed)
    {
      [v10 setObject:&unk_26EA25BE8 forKey:@"direction"];
      -[NSMutableArray removeObjectsInRange:](self->_trackList, "removeObjectsInRange:", 0, a3 - 1);
      self->_unint64_t activeListIndex = 0;
    }
    else
    {
      int64_t v12 = [NSNumber numberWithInteger:self->_activeListIndex >= a3];
      [v11 setObject:v12 forKey:@"direction"];

      self->_unint64_t activeListIndex = a3;
    }
    [(TVPPlaylist *)self _updateCurrent:0 andNextItems:0 withContext:v11];

    BOOL v9 = 1;
  }

  return v9;
}

- (unint64_t)_nextActiveListIndex
{
  unint64_t v3 = self->_activeListIndex + 1;
  if ([(TVPPlaylist *)self skipExplicit])
  {
    while (v3 < [(NSArray *)self->_activeList count])
    {
      id v4 = [(NSArray *)self->_activeList objectAtIndex:v3];
      BOOL v5 = [(TVPPlaylist *)self _isMediaItemExplicit:v4];

      if (!v5) {
        break;
      }
      ++v3;
    }
  }
  return v3;
}

- (unint64_t)_previousActiveListIndex
{
  unint64_t activeListIndex = self->_activeListIndex;
  if (activeListIndex) {
    unint64_t v4 = activeListIndex - 1;
  }
  else {
    unint64_t v4 = 0;
  }
  if ([(TVPPlaylist *)self skipExplicit] && activeListIndex >= 2)
  {
    unint64_t v4 = activeListIndex - 1;
    do
    {
      BOOL v5 = [(NSArray *)self->_activeList objectAtIndex:v4];
      BOOL v6 = [(TVPPlaylist *)self _isMediaItemExplicit:v5];

      if (!v6) {
        break;
      }
      --v4;
    }
    while (v4);
  }
  return v4;
}

- (BOOL)_isMediaItemExplicit:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 mediaItemMetadataForProperty:@"TVPMediaItemMetadataContentRatingDomain"];
  BOOL v5 = [v3 mediaItemMetadataForProperty:@"TVPMediaItemMetadataContentRatingIsExplicitMusic"];

  if ([v4 isEqualToString:@"music"]) {
    char v6 = [v5 BOOLValue];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)setSkipExplicit:(BOOL)a3
{
  if (self->_skipExplicit != a3)
  {
    self->_skipExplicit = a3;
    [(TVPPlaylist *)self _updateCurrent:1 andNextItems:1 withContext:0];
  }
}

- (BOOL)moreItemsAvailable:(int64_t)a3
{
  BOOL windowed = self->_windowed;
  BOOL result = a3 == 0;
  if (!windowed)
  {
    if (a3)
    {
      if ((unint64_t)(self->_repeatMode - 1) < 2) {
        return 1;
      }
      unint64_t activeListIndex = self->_activeListIndex;
    }
    else
    {
      unint64_t activeListIndex = (unint64_t)self->_nextMediaItem;
    }
    return activeListIndex != 0;
  }
  return result;
}

- (void)_updateCurrent:(BOOL)a3 andNextItems:(BOOL)a4 withContext:(id)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  v28[1] = *MEMORY[0x263EF8340];
  id v9 = a5;
  if (v9) {
    objc_storeStrong((id *)&self->_changeContext, a5);
  }
  upcomingItems = self->_upcomingItems;
  self->_upcomingItems = 0;

  [(TVPPlaylist *)self willChangeValueForKey:@"upcomingItems"];
  BOOL v11 = [(TVPPlaylist *)self upcomingItems];
  unint64_t activeListIndex = self->_activeListIndex;
  BOOL v13 = 0;
  if (activeListIndex < [(NSArray *)self->_activeList count])
  {
    BOOL v13 = [(NSArray *)self->_activeList objectAtIndexedSubscript:self->_activeListIndex];
  }
  if (v7 && v13 == self->_currentMediaItem)
  {
    int v26 = 0;
  }
  else
  {
    if (!v9)
    {
      v27 = @"direction";
      v28[0] = &unk_26EA25BE8;
      BOOL v14 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
      [(TVPPlaylist *)self setChangeContext:v14];
    }
    [(TVPPlaylist *)self willChangeValueForKey:@"currentMediaItem"];
    objc_storeStrong((id *)&self->_currentMediaItem, v13);
    int v26 = 1;
  }
  if ([v11 count])
  {
    unint64_t v15 = [v11 objectAtIndexedSubscript:0];
    if (!v6) {
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v15 = 0;
    if (!v6)
    {
LABEL_15:
      [(TVPPlaylist *)self willChangeValueForKey:@"nextMediaItem"];
      objc_storeStrong((id *)&self->_nextMediaItem, v15);
      int v16 = 1;
      goto LABEL_16;
    }
  }
  if (v15 != self->_nextMediaItem) {
    goto LABEL_15;
  }
  int v16 = 0;
LABEL_16:
  if ([(TVPPlaylist *)self moreItemsAvailable:1])
  {
    if (self->_repeatMode == 2) {
      uint64_t v17 = self->_currentMediaItem;
    }
    else {
      uint64_t v17 = 0;
    }
    unint64_t v18 = self->_activeListIndex;
    if (v18 && v18 <= [(NSArray *)self->_activeList count])
    {
      uint64_t v19 = [(NSArray *)self->_activeList objectAtIndexedSubscript:[(TVPPlaylist *)self _previousActiveListIndex]];

      uint64_t v17 = (TVPMediaItem *)v19;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  previousMediaItem = self->_previousMediaItem;
  if (previousMediaItem != v17)
  {
    [(TVPPlaylist *)self willChangeValueForKey:@"previousMediaItem"];
    objc_storeStrong((id *)&self->_previousMediaItem, v17);
  }
  unint64_t v21 = [(NSMutableArray *)self->_trackList count];
  if (v21 != self->_count) {
    [(TVPPlaylist *)self setCount:v21];
  }
  unint64_t v22 = self->_activeListIndex;
  if (v22 + 1 < v21) {
    unint64_t v23 = v22 + 1;
  }
  else {
    unint64_t v23 = v21;
  }
  if (v23 != self->_currentIndex)
  {
    -[TVPPlaylist setCurrentIndex:](self, "setCurrentIndex:");
    unint64_t v22 = self->_activeListIndex;
  }
  if (v22 >= self->_upNextIndex)
  {
    unint64_t v24 = [(NSArray *)self->_activeList count];
    if (v22 + 1 < v24) {
      unint64_t v25 = v22 + 1;
    }
    else {
      unint64_t v25 = v24;
    }
    self->_upNextIndex = v25;
  }
  if (v26) {
    [(TVPPlaylist *)self didChangeValueForKey:@"currentMediaItem"];
  }
  if (v16) {
    [(TVPPlaylist *)self didChangeValueForKey:@"nextMediaItem"];
  }
  if (previousMediaItem != v17) {
    [(TVPPlaylist *)self didChangeValueForKey:@"previousMediaItem"];
  }
  [(TVPPlaylist *)self didChangeValueForKey:@"upcomingItems"];
}

- (void)setWindowed:(BOOL)a3
{
  if (a3 && self->_endAction != 2) {
    [(TVPPlaylist *)self setEndAction:2];
  }
  self->_BOOL windowed = a3;
  [(TVPPlaylist *)self _updateCurrent:1 andNextItems:1 withContext:0];
}

- (void)setEndAction:(int64_t)a3
{
  if (!self->_windowed && self->_endAction != a3)
  {
    [(TVPPlaylist *)self willChangeValueForKey:@"endAction"];
    self->_endAction = a3;
    [(TVPPlaylist *)self didChangeValueForKey:@"endAction"];
  }
}

- (BOOL)supportsShuffle
{
  return ![(TVPPlaylist *)self windowed];
}

- (void)setShuffleEnabled:(BOOL)a3 preserveCurrentItem:(BOOL)a4
{
  if (self->_shuffleEnabled != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    if ([(TVPPlaylist *)self supportsShuffle])
    {
      [(TVPPlaylist *)self willChangeValueForKey:@"shuffleEnabled"];
      self->_shuffleEnabled = v5;
      if (v5)
      {
        [(TVPPlaylist *)self _shuffle:v4];
      }
      else
      {
        shuffledItems = self->_shuffledItems;
        self->_shuffledItems = 0;

        unint64_t v8 = 0;
        if (v4)
        {
          uint64_t v9 = [(NSMutableArray *)self->_trackList indexOfObject:self->_currentMediaItem];
          if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
            unint64_t v8 = 0;
          }
          else {
            unint64_t v8 = v9;
          }
        }
        self->_unint64_t activeListIndex = v8;
        objc_storeStrong((id *)&self->_activeList, self->_trackList);
      }
      [(TVPPlaylist *)self _updateCurrent:1 andNextItems:1 withContext:0];
      [(TVPPlaylist *)self didChangeValueForKey:@"shuffleEnabled"];
    }
  }
}

- (void)_shuffle:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (NSMutableArray *)[(NSMutableArray *)self->_trackList mutableCopy];
  shuffledItems = self->_shuffledItems;
  self->_shuffledItems = v5;

  [(NSMutableArray *)self->_shuffledItems tvp_shuffle];
  if (v3 && self->_currentMediaItem)
  {
    -[NSMutableArray removeObject:](self->_shuffledItems, "removeObject:");
    [(NSMutableArray *)self->_shuffledItems insertObject:self->_currentMediaItem atIndex:0];
  }
  self->_unint64_t activeListIndex = 0;
  BOOL v7 = self->_shuffledItems;
  objc_storeStrong((id *)&self->_activeList, v7);
}

- (void)setRepeatMode:(int64_t)a3
{
  if (self->_repeatMode != a3 && [(TVPPlaylist *)self supportsRepeat])
  {
    self->_int64_t repeatMode = a3;
    [(TVPPlaylist *)self _updateCurrent:1 andNextItems:1 withContext:0];
  }
}

- (BOOL)supportsRepeat
{
  return ![(TVPPlaylist *)self windowed];
}

- (void)addItem:(id)a3
{
  trackList = self->_trackList;
  id v5 = a3;
  [(TVPPlaylist *)self insertItem:v5 atIndex:[(NSMutableArray *)trackList count]];
}

- (void)addItems:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x263F088D0];
  id v5 = a3;
  id v6 = (id)objc_msgSend([v4 alloc], "initWithIndexesInRange:", -[NSMutableArray count](self->_trackList, "count"), objc_msgSend(v5, "count"));
  [(TVPPlaylist *)self insertItems:v5 atIndexes:v6];
}

- (void)insertItem:(id)a3 atIndex:(unint64_t)a4
{
  v9[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(NSMutableArray *)self->_trackList count] < a4) {
    a4 = [(NSMutableArray *)self->_trackList count];
  }
  v9[0] = v6;
  BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  unint64_t v8 = [MEMORY[0x263F088D0] indexSetWithIndex:a4];
  [(TVPPlaylist *)self insertItems:v7 atIndexes:v8];
}

- (void)insertItems:(id)a3 atIndexes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t activeListIndex = self->_activeListIndex;
  if (activeListIndex < [(NSArray *)self->_activeList count])
  {
    uint64_t v15 = 0;
    int v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    uint64_t v11 = 0;
    int64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    unint64_t v9 = self->_activeListIndex;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __37__TVPPlaylist_insertItems_atIndexes___block_invoke;
    v10[3] = &unk_264CC5020;
    v10[4] = self;
    v10[5] = &v15;
    v10[6] = &v11;
    v10[7] = v9;
    [v7 enumerateRangesUsingBlock:v10];
    self->_activeListIndex += v16[3];
    self->_upNextIndex += v12[3];
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
  }
  if (self->_shuffleEnabled)
  {
    [(NSMutableArray *)self->_shuffledItems insertObjects:v6 atIndexes:v7];
    [(NSMutableArray *)self->_trackList addObjectsFromArray:v6];
  }
  else
  {
    [(NSMutableArray *)self->_trackList insertObjects:v6 atIndexes:v7];
  }
  [(TVPPlaylist *)self _updateCurrent:1 andNextItems:1 withContext:0];
}

void *__37__TVPPlaylist_insertItems_atIndexes___block_invoke(void *result, unint64_t a2, uint64_t a3)
{
  if (a2 <= result[7]) {
    *(void *)(*(void *)(result[5] + 8) + 24) += a3;
  }
  if (a2 <= *(void *)(result[4] + 144)) {
    *(void *)(*(void *)(result[6] + 8) + 24) += a3;
  }
  return result;
}

- (void)removeItemAtIndex:(unint64_t)a3
{
  id v4 = [MEMORY[0x263F088D0] indexSetWithIndex:a3];
  [(TVPPlaylist *)self removeItemsAtIndexes:v4];
}

- (void)removeItemsAtIndexes:(id)a3
{
  id v4 = a3;
  int v5 = [v4 containsIndex:self->_activeListIndex];
  if (self->_shuffleEnabled)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F089C8]);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __36__TVPPlaylist_removeItemsAtIndexes___block_invoke;
    uint64_t v18 = &unk_264CC5048;
    uint64_t v19 = self;
    id v20 = v6;
    id v7 = v6;
    [v4 enumerateIndexesUsingBlock:&v15];
    -[NSMutableArray removeObjectsAtIndexes:](self->_trackList, "removeObjectsAtIndexes:", v7, v15, v16, v17, v18, v19);
    [(NSMutableArray *)self->_shuffledItems removeObjectsAtIndexes:v4];
  }
  else
  {
    [(NSMutableArray *)self->_trackList removeObjectsAtIndexes:v4];
  }
  unint64_t v8 = objc_msgSend(v4, "countOfIndexesInRange:", 0, self->_activeListIndex);
  unint64_t activeListIndex = self->_activeListIndex;
  BOOL v10 = activeListIndex >= v8;
  unint64_t v11 = activeListIndex - v8;
  if (!v10) {
    unint64_t v11 = 0;
  }
  self->_unint64_t activeListIndex = v11;
  unint64_t v12 = objc_msgSend(v4, "countOfIndexesInRange:", 0, self->_upNextIndex);
  unint64_t upNextIndex = self->_upNextIndex;
  BOOL v10 = upNextIndex >= v12;
  unint64_t v14 = upNextIndex - v12;
  if (!v10) {
    unint64_t v14 = 0;
  }
  self->_unint64_t upNextIndex = v14;
  [(TVPPlaylist *)self _updateCurrent:v5 ^ 1u andNextItems:1 withContext:0];
}

unint64_t __36__TVPPlaylist_removeItemsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  int v5 = [*(id *)(v3 + 16) objectAtIndexedSubscript:a2];
  unint64_t v6 = [v4 indexOfObject:v5];

  unint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  if (v6 < result)
  {
    unint64_t v8 = *(void **)(a1 + 40);
    return [v8 addIndex:v6];
  }
  return result;
}

- (NSArray)upcomingItems
{
  if (!self->_upcomingItems)
  {
    int64_t repeatMode = self->_repeatMode;
    if (repeatMode == 1)
    {
      id v4 = (NSArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_upcomingItemsLimit];
      if ([(NSArray *)self->_activeList count])
      {
        unint64_t activeListIndex = self->_activeListIndex;
        if ([(NSArray *)v4 count] < self->_upcomingItemsLimit)
        {
          unint64_t v7 = activeListIndex + 1;
          do
          {
            unint64_t v8 = [(NSArray *)self->_activeList objectAtIndex:v7 % [(NSArray *)self->_activeList count]];
            if (![(TVPPlaylist *)self skipExplicit]
              || ![(TVPPlaylist *)self _isMediaItemExplicit:v8])
            {
              [(NSArray *)v4 addObject:v8];
            }

            ++v7;
          }
          while ([(NSArray *)v4 count] < self->_upcomingItemsLimit);
        }
      }
    }
    else if (repeatMode == 2)
    {
      id v4 = (NSArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_upcomingItemsLimit];
      if (self->_upcomingItemsLimit)
      {
        unint64_t v5 = 0;
        do
        {
          if (!self->_currentMediaItem) {
            break;
          }
          -[NSArray addObject:](v4, "addObject:");
          ++v5;
        }
        while (v5 < self->_upcomingItemsLimit);
      }
    }
    else
    {
      id v4 = (NSArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_upcomingItemsLimit];
      unint64_t v9 = self->_activeListIndex;
      if (v9 < [(NSArray *)self->_activeList count])
      {
        activeList = self->_activeList;
        for (unint64_t i = self->_activeListIndex + 1;
              i < [(NSArray *)activeList count] && [(NSArray *)v4 count] < self->_upcomingItemsLimit;
              ++i)
        {
          if (![(TVPPlaylist *)self skipExplicit]
            || ([(NSArray *)self->_activeList objectAtIndexedSubscript:i],
                unint64_t v12 = objc_claimAutoreleasedReturnValue(),
                BOOL v13 = [(TVPPlaylist *)self _isMediaItemExplicit:v12],
                v12,
                !v13))
          {
            unint64_t v14 = [(NSArray *)self->_activeList objectAtIndexedSubscript:i];
            [(NSArray *)v4 addObject:v14];
          }
          activeList = self->_activeList;
        }
      }
    }
    upcomingItems = self->_upcomingItems;
    self->_upcomingItems = v4;
  }
  uint64_t v16 = self->_upcomingItems;
  return v16;
}

- (void)setUpcomingItemsLimit:(unint64_t)a3
{
  if (a3 <= 1) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = a3;
  }
  self->_upcomingItemsLimit = v3;
}

- (void)addItemsToUpNext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TVPPlaylist *)self upNextIndex];
  objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v5, objc_msgSend(v4, "count"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(TVPPlaylist *)self insertItems:v4 atIndexes:v6];
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___TVPPlaylist;
  unint64_t v5 = objc_msgSendSuper2(&v8, sel_keyPathsForValuesAffectingValueForKey_, v4);
  if (([v4 isEqualToString:@"supportsShuffle"] & 1) != 0
    || [v4 isEqualToString:@"supportsRepeat"])
  {
    uint64_t v6 = [v5 setByAddingObject:@"windowed"];

    unint64_t v5 = (void *)v6;
  }

  return v5;
}

- (TVPMediaItem)currentMediaItem
{
  return self->_currentMediaItem;
}

- (void)setCurrentMediaItem:(id)a3
{
}

- (TVPMediaItem)nextMediaItem
{
  return self->_nextMediaItem;
}

- (void)setNextMediaItem:(id)a3
{
}

- (TVPMediaItem)previousMediaItem
{
  return self->_previousMediaItem;
}

- (void)setPreviousMediaItem:(id)a3
{
}

- (NSArray)trackList
{
  return &self->_trackList->super;
}

- (NSArray)activeList
{
  return self->_activeList;
}

- (unint64_t)activeListIndex
{
  return self->_activeListIndex;
}

- (int64_t)endAction
{
  return self->_endAction;
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  self->_currentIndex = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (BOOL)windowed
{
  return self->_windowed;
}

- (unint64_t)numConsecutivePlaybackFailures
{
  return self->_numConsecutivePlaybackFailures;
}

- (void)setNumConsecutivePlaybackFailures:(unint64_t)a3
{
  self->_numConsecutivePlaybackFailures = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)shuffleEnabled
{
  return self->_shuffleEnabled;
}

- (int64_t)repeatMode
{
  return self->_repeatMode;
}

- (BOOL)skipExplicit
{
  return self->_skipExplicit;
}

- (NSDictionary)changeContext
{
  return self->_changeContext;
}

- (void)setChangeContext:(id)a3
{
}

- (unint64_t)upcomingItemsLimit
{
  return self->_upcomingItemsLimit;
}

- (unint64_t)upNextIndex
{
  return self->_upNextIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeContext, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_previousMediaItem, 0);
  objc_storeStrong((id *)&self->_nextMediaItem, 0);
  objc_storeStrong((id *)&self->_currentMediaItem, 0);
  objc_storeStrong((id *)&self->_upcomingItems, 0);
  objc_storeStrong((id *)&self->_activeList, 0);
  objc_storeStrong((id *)&self->_shuffledItems, 0);
  objc_storeStrong((id *)&self->_trackList, 0);
}

@end