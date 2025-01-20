@interface MCAudioPlaylist
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (MCAudioPlaylist)init;
- (MCAudioPlaylist)initWithImprint:(id)a3 andMontage:(id)a4;
- (MCContainer)container;
- (NSArray)orderedSongs;
- (NSSet)songs;
- (double)duckInDuration;
- (double)duckOutDuration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (float)duckLevel;
- (float)volume;
- (id)addSongForAsset:(id)a3;
- (id)addSongsForAssets:(id)a3;
- (id)imprint;
- (id)insertSongForAsset:(id)a3 atIndex:(unint64_t)a4;
- (id)insertSongsForAssets:(id)a3 atIndex:(unint64_t)a4;
- (id)songAtIndex:(unint64_t)a3;
- (unint64_t)countOfSongs;
- (void)demolish;
- (void)moveSongsAtIndices:(id)a3 toIndex:(unint64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllSongs;
- (void)removeSongsAtIndices:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDuckInDuration:(double)a3;
- (void)setDuckLevel:(float)a3;
- (void)setDuckOutDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setVolume:(float)a3;
@end

@implementation MCAudioPlaylist

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"orderedSongs"]) {
    return +[NSSet setWithObjects:@"songs", 0, v7, v8, v9, v10, v11];
  }
  if ([a3 isEqualToString:@"builtVolume"]) {
    return +[NSSet setWithObjects:@"volume", @"fadeInDuration", @"fadeOutDuration", @"duckLevel", @"duckInDuration", @"duckOutDuration", 0];
  }
  if ([a3 isEqualToString:@"builtAudio"])
  {
    CFStringRef v6 = @"builtVolume";
    uint64_t v7 = 0;
  }
  else
  {
    if (![a3 isEqualToString:@"audioNoVolume"])
    {
      v12.receiver = a1;
      v12.super_class = (Class)&OBJC_METACLASS___MCAudioPlaylist;
      return objc_msgSendSuper2(&v12, "keyPathsForValuesAffectingValueForKey:", a3);
    }
    CFStringRef v6 = 0;
  }
  return +[NSSet setWithObjects:@"orderedSongs", v6, v7, v8, v9, v10, v11];
}

- (MCAudioPlaylist)init
{
  v4.receiver = self;
  v4.super_class = (Class)MCAudioPlaylist;
  v2 = [(MCAudioPlaylist *)&v4 init];
  if (v2)
  {
    v2->mSongs = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v2->mVolume = 1.0;
    v2->mDuckLevel = 1.0;
  }
  return v2;
}

- (MCAudioPlaylist)initWithImprint:(id)a3 andMontage:(id)a4
{
  v26.receiver = self;
  v26.super_class = (Class)MCAudioPlaylist;
  CFStringRef v6 = -[MCObject initWithImprint:andMontage:](&v26, "initWithImprint:andMontage:");
  if (v6)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = [a3 objectForKey:@"songs"];
    id v7 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = +[MCObject objectWithImprint:*(void *)(*((void *)&v22 + 1) + 8 * i) andMontage:a4];
          [(NSMutableSet *)v6->mSongs addObject:v11];
          [(MCObject *)v11 setAudioPlaylistIfAudioPlaylistSong:v6];
          if (![(MCObject *)v6 isSnapshot])
          {
            [(MCObject *)v11 addObserver:v6 forKeyPath:@"builtVolume" options:0 context:0];
            [(MCObject *)v11 addObserver:v6 forKeyPath:@"builtAudio" options:0 context:0];
          }
          id v12 = [a3 objectForKey:@"volume"];
          float v13 = 1.0;
          LODWORD(v14) = 1.0;
          if (v12) {
            objc_msgSend(objc_msgSend(a3, "objectForKey:", @"volume", v14), "floatValue");
          }
          v6->mVolume = *(float *)&v14;
          objc_msgSend(objc_msgSend(a3, "objectForKey:", @"fadeInDuration"), "doubleValue");
          v6->mFadeInDuration = v15;
          objc_msgSend(objc_msgSend(a3, "objectForKey:", @"fadeOutDuration"), "doubleValue");
          v6->mFadeOutDuration = v16;
          if ([a3 objectForKey:@"duckLevel"])
          {
            objc_msgSend(objc_msgSend(a3, "objectForKey:", @"duckLevel"), "floatValue");
            float v13 = v17;
          }
          v6->mDuckLevel = v13;
          objc_msgSend(objc_msgSend(a3, "objectForKey:", @"duckInDuration"), "doubleValue");
          v6->mDuckInDuration = v18;
          objc_msgSend(objc_msgSend(a3, "objectForKey:", @"duckOutDuration"), "doubleValue");
          v6->mDuckOutDuration = v19;
        }
        id v8 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }
  }
  return v6;
}

- (void)demolish
{
  mSongs = self->mSongs;
  objc_sync_enter(mSongs);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v4 = self->mSongs;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (![(MCObject *)self isSnapshot])
        {
          [v8 removeObserver:self forKeyPath:@"builtVolume"];
          [v8 removeObserver:self forKeyPath:@"builtAudio"];
        }
        [v8 demolish];
      }
      id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  self->mSongs = 0;
  self->mCachedOrderedSongs = 0;
  objc_sync_exit(mSongs);
  self->mContainer = 0;
  v9.receiver = self;
  v9.super_class = (Class)MCAudioPlaylist;
  [(MCObject *)&v9 demolish];
}

- (id)imprint
{
  v18.receiver = self;
  v18.super_class = (Class)MCAudioPlaylist;
  id v3 = [(MCObject *)&v18 imprint];
  id v5 = [(MCAudioPlaylist *)self songs];
  if ([(NSSet *)v5 count])
  {
    id v6 = +[NSMutableArray array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [(NSSet *)v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "imprint"));
        }
        id v8 = [(NSSet *)v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }
    [v3 setObject:v6 forKey:@"songs"];
  }
  float mVolume = self->mVolume;
  if (mVolume != 1.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", mVolume), @"volume");
  }
  if (self->mFadeInDuration > 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"fadeInDuration");
  }
  if (self->mFadeOutDuration > 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"fadeOutDuration");
  }
  float mDuckLevel = self->mDuckLevel;
  if (mDuckLevel != 1.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", mDuckLevel), @"duckLevel");
  }
  if (self->mDuckInDuration > 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"duckInDuration");
  }
  if (self->mDuckOutDuration > 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"duckOutDuration");
  }
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(MCAudioPlaylist *)self willChangeValueForKey:a3];
    [(MCAudioPlaylist *)self didChangeValueForKey:a3];
  }
}

- (NSSet)songs
{
  mSongs = self->mSongs;
  objc_sync_enter(mSongs);
  if ([(NSMutableSet *)self->mSongs count]) {
    objc_super v4 = (NSSet *)[objc_alloc((Class)NSSet) initWithSet:self->mSongs];
  }
  else {
    objc_super v4 = (NSSet *)sEmptySet;
  }
  objc_sync_exit(mSongs);
  return v4;
}

- (unint64_t)countOfSongs
{
  mSongs = self->mSongs;
  objc_sync_enter(mSongs);
  id v4 = [(NSMutableSet *)self->mSongs count];
  objc_sync_exit(mSongs);
  return (unint64_t)v4;
}

- (id)songAtIndex:(unint64_t)a3
{
  mSongs = self->mSongs;
  objc_sync_enter(mSongs);
  mCachedOrderedSongs = self->mCachedOrderedSongs;
  if (mCachedOrderedSongs)
  {
    id v7 = [(NSArray *)mCachedOrderedSongs objectAtIndex:a3];
LABEL_13:
    long long v13 = v7;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = self->mSongs;
    id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v12 index] == (id)a3)
          {
            id v7 = v12;
            goto LABEL_13;
          }
        }
        id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        long long v13 = 0;
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      long long v13 = 0;
    }
  }
  objc_sync_exit(mSongs);
  return v13;
}

- (id)addSongForAsset:(id)a3
{
  id v3 = [(MCAudioPlaylist *)self insertSongsForAssets:+[NSArray arrayWithObject:a3] atIndex:[(MCAudioPlaylist *)self countOfSongs]];
  return [v3 objectAtIndex:0];
}

- (id)addSongsForAssets:(id)a3
{
  unint64_t v5 = [(MCAudioPlaylist *)self countOfSongs];
  return [(MCAudioPlaylist *)self insertSongsForAssets:a3 atIndex:v5];
}

- (id)insertSongForAsset:(id)a3 atIndex:(unint64_t)a4
{
  id v4 = [(MCAudioPlaylist *)self insertSongsForAssets:+[NSArray arrayWithObject:a3] atIndex:a4];
  return [v4 objectAtIndex:0];
}

- (id)insertSongsForAssets:(id)a3 atIndex:(unint64_t)a4
{
  id v7 = +[NSMutableArray array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = a3;
  id v8 = [a3 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        id v12 = [(MCObject *)[MCSong alloc] initFromScratchWithMontage:self->super.mMontage];
        [v12 setAsset:v11];
        objc_msgSend(v12, "setIndex:", (char *)objc_msgSend(v7, "count") + a4);
        [v7 addObject:v12];
        [v12 setAudioPlaylistIfAudioPlaylistSong:self];
        [v12 addObserver:self forKeyPath:@"builtVolume" options:0 context:0];
        [v12 addObserver:self forKeyPath:@"builtAudio" options:0 context:0];
      }
      id v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
  }
  if ([v7 count])
  {
    id v13 = [objc_alloc((Class)NSSet) initWithArray:v7];
    [(MCAudioPlaylist *)self willChangeValueForKey:@"songs" withSetMutation:1 usingObjects:v13];
    mSongs = self->mSongs;
    objc_sync_enter(mSongs);

    self->mCachedOrderedSongs = 0;
    long long v14 = (char *)[obj count];
    id obja = v13;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v15 = self->mSongs;
    id v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v26;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v15);
          }
          double v19 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
          if ((unint64_t)objc_msgSend(v19, "index", mSongs) >= a4) {
            objc_msgSend(v19, "setIndex:", &v14[(void)objc_msgSend(v19, "index")]);
          }
        }
        id v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v16);
    }
    -[NSMutableSet addObjectsFromArray:](self->mSongs, "addObjectsFromArray:", v7, mSongs);
    objc_sync_exit(v22);
    [(MCAudioPlaylist *)self didChangeValueForKey:@"songs" withSetMutation:1 usingObjects:obja];
  }
  return v7;
}

- (void)removeSongsAtIndices:(id)a3
{
  id obj = self->mSongs;
  objc_sync_enter(obj);
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  mSongs = self->mSongs;
  id v7 = [(NSMutableSet *)mSongs countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(mSongs);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v10, "index")))
        {
          [v5 addObject:v10];
          [v10 removeObserver:self forKeyPath:@"builtVolume"];
          [v10 removeObserver:self forKeyPath:@"builtAudio"];
        }
        else
        {
          objc_msgSend(v10, "setIndex:", (unsigned char *)objc_msgSend(v10, "index")- (unsigned char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v10, "index")));
        }
      }
      id v7 = [(NSMutableSet *)mSongs countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }
  [(MCAudioPlaylist *)self willChangeValueForKey:@"songs" withSetMutation:2 usingObjects:v5];

  self->mCachedOrderedSongs = 0;
  [(NSMutableSet *)self->mSongs minusSet:v5];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v5);
        }
        long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * (void)j);
        [v14 setAudioPlaylistIfAudioPlaylistSong:0];
        [v14 demolish];
      }
      id v11 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }
  objc_sync_exit(obj);
  [(MCAudioPlaylist *)self didChangeValueForKey:@"songs" withSetMutation:2 usingObjects:v5];
}

- (void)removeAllSongs
{
  id v3 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [(MCAudioPlaylist *)self countOfSongs]);
  [(MCAudioPlaylist *)self removeSongsAtIndices:v3];
}

- (void)moveSongsAtIndices:(id)a3 toIndex:(unint64_t)a4
{
  [(MCAudioPlaylist *)self willChangeValueForKey:@"orderedSongs"];
  mSongs = self->mSongs;
  objc_sync_enter(mSongs);

  self->mCachedOrderedSongs = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->mSongs;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v12, "index")))
        {
          objc_msgSend(v12, "setIndex:", (char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index")) + a4);
        }
        else
        {
          id v13 = [v12 index];
          unint64_t v14 = v13 - (unsigned char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index"));
          if (v14 >= a4) {
            v14 += (unint64_t)[a3 count];
          }
          [v12 setIndex:v14];
        }
      }
      id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  objc_sync_exit(mSongs);
  [(MCAudioPlaylist *)self didChangeValueForKey:@"orderedSongs"];
}

- (NSArray)orderedSongs
{
  mSongs = self->mSongs;
  objc_sync_enter(mSongs);
  mCachedOrderedSongs = self->mCachedOrderedSongs;
  if (!mCachedOrderedSongs)
  {
    id v5 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"index" ascending:1];
    self->mCachedOrderedSongs = (NSArray *)objc_msgSend(-[NSMutableSet allObjects](self->mSongs, "allObjects"), "sortedArrayUsingDescriptors:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v5));

    mCachedOrderedSongs = self->mCachedOrderedSongs;
  }
  id v6 = mCachedOrderedSongs;
  objc_sync_exit(mSongs);
  return v6;
}

- (float)volume
{
  return self->mVolume;
}

- (void)setVolume:(float)a3
{
  self->float mVolume = a3;
}

- (double)fadeInDuration
{
  return self->mFadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->mFadeInDuration = a3;
}

- (double)fadeOutDuration
{
  return self->mFadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->mFadeOutDuration = a3;
}

- (float)duckLevel
{
  return self->mDuckLevel;
}

- (void)setDuckLevel:(float)a3
{
  self->float mDuckLevel = a3;
}

- (double)duckInDuration
{
  return self->mDuckInDuration;
}

- (void)setDuckInDuration:(double)a3
{
  self->mDuckInDuration = a3;
}

- (double)duckOutDuration
{
  return self->mDuckOutDuration;
}

- (void)setDuckOutDuration:(double)a3
{
  self->mDuckOutDuration = a3;
}

- (MCContainer)container
{
  return self->mContainer;
}

- (void)setContainer:(id)a3
{
  self->mContainer = (MCContainer *)a3;
}

@end