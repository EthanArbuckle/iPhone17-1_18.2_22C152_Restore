@interface VUIMediaInfoFetchController
+ (void)initialize;
- (BOOL)isPreloadPlaybackEnabled;
- (BOOL)mediaInfoContainsImageAtIndex:(unint64_t)a3;
- (BOOL)mediaInfoContainsPlayerAtIndex:(unint64_t)a3;
- (NSArray)mediaInfos;
- (NSMutableArray)imageOperations;
- (NSMutableDictionary)prewarmedPlayers;
- (NSOperationQueue)imageQueue;
- (OS_dispatch_queue)imageDecodingQueue;
- (VUIMediaInfoFetchController)init;
- (VUIMediaInfoFetchController)initWithMediaInfos:(id)a3;
- (id)_createPlayerWithPlaylist:(id)a3 isForPrewarming:(BOOL)a4;
- (id)_identifierForPlaylist:(id)a3 isForPrewarming:(BOOL)a4;
- (id)_prewarmIndices;
- (id)loadPlayerAtIndex:(unint64_t)a3;
- (int64_t)queuePriorityForIndex:(int64_t)a3 itemCount:(int64_t)a4 selectedIndex:(int64_t)a5;
- (unint64_t)index;
- (unint64_t)playerPreloadOffset;
- (void)_populateQueueWithMediaInfos:(id)a3;
- (void)_removePrewarmedPlayerForIdentifier:(id)a3;
- (void)_updateImageOperationPriorities;
- (void)_updatePrewarmedPlayers;
- (void)appendMediaInfos:(id)a3;
- (void)clearPreloadedPlayback;
- (void)dealloc;
- (void)loadImageAtIndex:(unint64_t)a3 completion:(id)a4;
- (void)populatePlaylistWithMediaItems:(id)a3 atIndex:(unint64_t)a4;
- (void)removeMediaInfoAtIndex:(unint64_t)a3;
- (void)removePopulatedMediaItems:(id)a3 atIndex:(unint64_t)a4;
- (void)setImageDecodingQueue:(id)a3;
- (void)setImageOperations:(id)a3;
- (void)setImageQueue:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setMediaInfo:(id)a3 atIndex:(unint64_t)a4;
- (void)setMediaInfos:(id)a3;
- (void)setPlayerPreloadOffset:(unint64_t)a3;
- (void)setPreloadPlaybackEnabled:(BOOL)a3;
- (void)setPrewarmedPlayers:(id)a3;
@end

@implementation VUIMediaInfoFetchController

+ (void)initialize
{
  if (initialize_onceToken_3 != -1) {
    dispatch_once(&initialize_onceToken_3, &__block_literal_global_76);
  }
}

void __41__VUIMediaInfoFetchController_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUIMediaInfoFetchController");
  v1 = (void *)sLogObject_10;
  sLogObject_10 = (uint64_t)v0;
}

- (VUIMediaInfoFetchController)init
{
  return [(VUIMediaInfoFetchController *)self initWithMediaInfos:MEMORY[0x1E4F1CBF0]];
}

- (VUIMediaInfoFetchController)initWithMediaInfos:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VUIMediaInfoFetchController;
  v5 = [(VUIMediaInfoFetchController *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v6;

    id v8 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    v9 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    v11 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    v13 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v12;

    *(_OWORD *)(v5 + 24) = xmmword_1E38FDE60;
    v5[8] = 0;
    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v15 = dispatch_queue_create("VUIMediaInfoImageDecodingQueue", v14);
    v16 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v15;

    v17 = [v5 imageQueue];
    [v17 setMaxConcurrentOperationCount:1];

    [v5 _populateQueueWithMediaInfos:v4];
  }

  return (VUIMediaInfoFetchController *)v5;
}

- (void)clearPreloadedPlayback
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(VUIMediaInfoFetchController *)self prewarmedPlayers];
  id v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v9 stop];
        [v9 invalidate];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [(VUIMediaInfoFetchController *)self prewarmedPlayers];
  [v10 removeAllObjects];
}

- (void)dealloc
{
  v3 = sLogObject_10;
  if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "dealloc cleaning", buf, 2u);
  }
  [(VUIMediaInfoFetchController *)self setMediaInfos:MEMORY[0x1E4F1CBF0]];
  v4.receiver = self;
  v4.super_class = (Class)VUIMediaInfoFetchController;
  [(VUIMediaInfoFetchController *)&v4 dealloc];
}

- (void)_populateQueueWithMediaInfos:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [[VUIMediaInfoImageFetchOperation alloc] initWithMediaInfo:*(void *)(*((void *)&v12 + 1) + 8 * v8)];
        uint64_t v10 = [(VUIMediaInfoFetchController *)self imageQueue];
        [v10 addOperation:v9];

        long long v11 = [(VUIMediaInfoFetchController *)self imageOperations];
        [v11 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  [(VUIMediaInfoFetchController *)self _updateImageOperationPriorities];
}

- (void)setIndex:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sLogObject_10;
  if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "setIndex: called with %lu", (uint8_t *)&v6, 0xCu);
  }
  self->_index = a3;
  [(VUIMediaInfoFetchController *)self _updateImageOperationPriorities];
  [(VUIMediaInfoFetchController *)self _updatePrewarmedPlayers];
}

- (void)_updateImageOperationPriorities
{
  v3 = [(VUIMediaInfoFetchController *)self mediaInfos];
  uint64_t v4 = [v3 count];

  unint64_t v5 = [(VUIMediaInfoFetchController *)self index];
  if (v4 >= 1)
  {
    unint64_t v6 = v5;
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v8 = [(VUIMediaInfoFetchController *)self imageOperations];
      v9 = [v8 objectAtIndexedSubscript:i];

      objc_msgSend(v9, "setQueuePriority:", -[VUIMediaInfoFetchController queuePriorityForIndex:itemCount:selectedIndex:](self, "queuePriorityForIndex:itemCount:selectedIndex:", i, v4, v6));
    }
  }
}

- (int64_t)queuePriorityForIndex:(int64_t)a3 itemCount:(int64_t)a4 selectedIndex:(int64_t)a5
{
  unint64_t v5 = a3 - a5;
  if (a3 - a5 < 0) {
    unint64_t v5 = a5 - a3;
  }
  int64_t v6 = a4 + a3 - a5;
  if (v6 < 0) {
    int64_t v6 = a5 - (a4 + a3);
  }
  int64_t v7 = a3 - (a4 + a5);
  if (v7 < 0) {
    int64_t v7 = a4 + a5 - a3;
  }
  if (v6 >= (unint64_t)v7) {
    int64_t v6 = v7;
  }
  if (v5 >= v6) {
    unint64_t v5 = v6;
  }
  if (v5) {
    return 4 * (v5 == 1);
  }
  else {
    return 8;
  }
}

- (void)_updatePrewarmedPlayers
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VUIMediaInfoFetchController *)self isPreloadPlaybackEnabled];
  uint64_t v4 = sLogObject_10;
  BOOL v5 = os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int64_t v6 = v4;
      int64_t v7 = [(VUIMediaInfoFetchController *)self mediaInfos];
      *(_DWORD *)buf = 134218240;
      v75 = self;
      __int16 v76 = 2048;
      uint64_t v77 = [v7 count];
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "MediaInfoFetch::(%p) updatePrewarm Updating prewarmed players for %lu media info(s)", buf, 0x16u);
    }
    uint64_t v8 = [(VUIMediaInfoFetchController *)self mediaInfos];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      uint64_t v10 = [(VUIMediaInfoFetchController *)self _prewarmIndices];
      long long v11 = (void *)sLogObject_10;
      if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
      {
        long long v12 = v11;
        uint64_t v13 = [v10 count];
        *(_DWORD *)buf = 134218240;
        v75 = self;
        __int16 v76 = 2048;
        uint64_t v77 = v13;
        _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "MediaInfoFetch::(%p) updatePrewarm prewarm %lu players", buf, 0x16u);
      }
      long long v14 = [MEMORY[0x1E4F1CA48] array];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v15 = v10;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v66 objects:v73 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v67 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v66 + 1) + 8 * i);
            v21 = [(VUIMediaInfoFetchController *)self mediaInfos];
            v22 = objc_msgSend(v21, "objectAtIndex:", objc_msgSend(v20, "unsignedIntegerValue"));

            [v14 addObject:v22];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v66 objects:v73 count:16];
        }
        while (v17);
      }

      v23 = [MEMORY[0x1E4F1CA80] set];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v24 = v14;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v62 objects:v72 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v63;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v63 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = [*(id *)(*((void *)&v62 + 1) + 8 * j) tvpPlaylist];
            v30 = [(VUIMediaInfoFetchController *)self _identifierForPlaylist:v29 isForPrewarming:1];

            if (v30) {
              [v23 addObject:v30];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v62 objects:v72 count:16];
        }
        while (v26);
      }

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v31 = [(VUIMediaInfoFetchController *)self prewarmedPlayers];
      v32 = [v31 allKeys];

      uint64_t v33 = [v32 countByEnumeratingWithState:&v58 objects:v71 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v59;
        do
        {
          for (uint64_t k = 0; k != v34; ++k)
          {
            if (*(void *)v59 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v58 + 1) + 8 * k);
            if (([v23 containsObject:v37] & 1) == 0) {
              [(VUIMediaInfoFetchController *)self _removePrewarmedPlayerForIdentifier:v37];
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v58 objects:v71 count:16];
        }
        while (v34);
      }
      v51 = v15;

      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      obuint64_t j = v24;
      uint64_t v38 = [obj countByEnumeratingWithState:&v54 objects:v70 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v55;
        uint64_t v52 = *MEMORY[0x1E4FAA168];
        do
        {
          for (uint64_t m = 0; m != v39; ++m)
          {
            if (*(void *)v55 != v40) {
              objc_enumerationMutation(obj);
            }
            v42 = [*(id *)(*((void *)&v54 + 1) + 8 * m) tvpPlaylist];
            v43 = [(VUIMediaInfoFetchController *)self _identifierForPlaylist:v42 isForPrewarming:1];
            if (v43)
            {
              v44 = [(VUIMediaInfoFetchController *)self prewarmedPlayers];
              uint64_t v45 = [v44 objectForKey:v43];
              if (v42) {
                BOOL v46 = v45 == 0;
              }
              else {
                BOOL v46 = 0;
              }
              if (v46)
              {
                v48 = [v42 currentMediaItem];
                int v49 = [v48 hasTrait:v52];

                if (!v49) {
                  goto LABEL_48;
                }
                v50 = sLogObject_10;
                if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134218242;
                  v75 = self;
                  __int16 v76 = 2112;
                  uint64_t v77 = (uint64_t)v43;
                  _os_log_impl(&dword_1E2BD7000, v50, OS_LOG_TYPE_DEFAULT, "MediaInfoFetch::(%p) updatePrewarm Creating and starting prewarm player with identifier [%@]", buf, 0x16u);
                }
                v44 = [(VUIMediaInfoFetchController *)self _createPlayerWithPlaylist:v42 isForPrewarming:1];
                [v44 pause];
                v47 = [(VUIMediaInfoFetchController *)self prewarmedPlayers];
                [v47 setObject:v44 forKey:v43];
              }
              else
              {
                v47 = (void *)v45;
              }
            }
LABEL_48:
          }
          uint64_t v39 = [obj countByEnumeratingWithState:&v54 objects:v70 count:16];
        }
        while (v39);
      }
    }
  }
  else if (v5)
  {
    *(_DWORD *)buf = 134217984;
    v75 = self;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "MediaInfoFetch::(%p) updatePrewarm is skipped because isPreloadPlaybackEnabled is disabled", buf, 0xCu);
  }
}

- (id)_prewarmIndices
{
  BOOL v3 = [MEMORY[0x1E4F1CA80] set];
  unint64_t v4 = [(VUIMediaInfoFetchController *)self playerPreloadOffset];
  BOOL v5 = [(VUIMediaInfoFetchController *)self mediaInfos];
  unint64_t v6 = [v5 count];

  unint64_t v7 = v6 - 1;
  if ([(VUIMediaInfoFetchController *)self index] < v6 - 1) {
    unint64_t v7 = [(VUIMediaInfoFetchController *)self index];
  }
  if (v6)
  {
    if (v6 == 1)
    {
      uint64_t v8 = &unk_1F3F3E258;
    }
    else
    {
      if (v4)
      {
        uint64_t v9 = v7 - 1;
        for (unint64_t i = 1; i <= v4; ++i)
        {
          if (i <= v7) {
            uint64_t v11 = v9;
          }
          else {
            uint64_t v11 = v6 - v4 + i - 1;
          }
          long long v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v11];
          [v3 addObject:v12];

          --v9;
        }
        uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v7];
        [v3 addObject:v13];

        for (unint64_t j = 1; j <= v4; ++j)
        {
          id v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:(v7 + j) % v6];
          [v3 addObject:v15];
        }
      }
      else
      {
        uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v7];
        [v3 addObject:v16];
      }
      uint64_t v8 = [v3 allObjects];
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (void)_removePrewarmedPlayerForIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = sLogObject_10;
  if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "MediaInfoFetch::(%p) Invalidating prewarm player with identifier [%@]", (uint8_t *)&v9, 0x16u);
  }
  unint64_t v6 = [(VUIMediaInfoFetchController *)self prewarmedPlayers];
  unint64_t v7 = [v6 objectForKey:v4];

  [v7 stop];
  [v7 invalidate];
  uint64_t v8 = [(VUIMediaInfoFetchController *)self prewarmedPlayers];
  [v8 removeObjectForKey:v4];
}

- (id)_identifierForPlaylist:(id)a3 isForPrewarming:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = [a3 currentMediaItem];
  unint64_t v6 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9ED8]];
  unint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    int v9 = [v5 mediaItemURL];
    id v8 = [v9 absoluteString];
  }
  uint64_t v10 = &stru_1F3E921E0;
  if (v4) {
    uint64_t v10 = @"Prewarm ";
  }
  __int16 v11 = [NSString stringWithFormat:@"%@%@", v10, v8];

  return v11;
}

- (void)setMediaInfos:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = sLogObject_10;
  if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "setMediaInfos: called with %@", buf, 0xCu);
  }
  unint64_t v6 = [(VUIMediaInfoFetchController *)self imageQueue];
  [v6 cancelAllOperations];

  unint64_t v7 = [(VUIMediaInfoFetchController *)self imageOperations];
  [v7 removeAllObjects];

  if (v4)
  {
    id v8 = (NSArray *)[v4 copy];
    mediaInfos = self->_mediaInfos;
    self->_mediaInfos = v8;

    [(VUIMediaInfoFetchController *)self _populateQueueWithMediaInfos:v4];
  }
  else
  {
    uint64_t v10 = self->_mediaInfos;
    self->_mediaInfos = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  __int16 v11 = [(VUIMediaInfoFetchController *)self mediaInfos];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = [(VUIMediaInfoFetchController *)self index];
    long long v14 = [(VUIMediaInfoFetchController *)self mediaInfos];
    unint64_t v15 = [v14 count];

    if (v13 >= v15)
    {
      uint64_t v25 = [(VUIMediaInfoFetchController *)self mediaInfos];
      -[VUIMediaInfoFetchController setIndex:](self, "setIndex:", [v25 count] - 1);
    }
    else
    {
      [(VUIMediaInfoFetchController *)self _updatePrewarmedPlayers];
    }
  }
  else
  {
    uint64_t v16 = sLogObject_10;
    if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "setMediaInfos: called with empty mediaInfos array.  Invalidating all prewarm players", buf, 2u);
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v17 = [(VUIMediaInfoFetchController *)self prewarmedPlayers];
    uint64_t v18 = [v17 allValues];

    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          [v23 stop];
          [v23 invalidate];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v20);
    }

    id v24 = [(VUIMediaInfoFetchController *)self prewarmedPlayers];
    [v24 removeAllObjects];
  }
}

- (void)setMediaInfo:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = sLogObject_10;
  if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    id v21 = v6;
    __int16 v22 = 2048;
    unint64_t v23 = a4;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "setMediaInfo:atIndex: called with %@ at index %lu", (uint8_t *)&v20, 0x16u);
  }
  id v8 = [(VUIMediaInfoFetchController *)self mediaInfos];
  unint64_t v9 = [v8 count];

  if (v9 > a4)
  {
    uint64_t v10 = [(VUIMediaInfoFetchController *)self mediaInfos];
    __int16 v11 = (void *)[v10 mutableCopy];

    uint64_t v12 = [(VUIMediaInfoFetchController *)self imageOperations];
    unint64_t v13 = [v12 objectAtIndex:a4];

    [v13 cancel];
    long long v14 = [(VUIMediaInfoFetchController *)self imageOperations];
    [v14 removeObjectAtIndex:a4];

    [v11 setObject:v6 atIndexedSubscript:a4];
    unint64_t v15 = (NSArray *)[v11 copy];
    mediaInfos = self->_mediaInfos;
    self->_mediaInfos = v15;

    uint64_t v17 = [[VUIMediaInfoImageFetchOperation alloc] initWithMediaInfo:v6];
    uint64_t v18 = [(VUIMediaInfoFetchController *)self imageQueue];
    [v18 addOperation:v17];

    uint64_t v19 = [(VUIMediaInfoFetchController *)self imageOperations];
    [v19 insertObject:v17 atIndex:a4];

    [(VUIMediaInfoFetchController *)self _updatePrewarmedPlayers];
  }
}

- (void)appendMediaInfos:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = sLogObject_10;
  if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "appendMediaInfos: called with mediaInfos %@", (uint8_t *)&v10, 0xCu);
  }
  if (v4)
  {
    id v6 = [(VUIMediaInfoFetchController *)self mediaInfos];
    unint64_t v7 = (void *)[v6 mutableCopy];

    [v7 addObjectsFromArray:v4];
    id v8 = (NSArray *)[v7 copy];
    mediaInfos = self->_mediaInfos;
    self->_mediaInfos = v8;

    [(VUIMediaInfoFetchController *)self _populateQueueWithMediaInfos:v4];
    [(VUIMediaInfoFetchController *)self _updatePrewarmedPlayers];
  }
}

- (void)removeMediaInfoAtIndex:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v5 = sLogObject_10;
  if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    unint64_t v16 = a3;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "removeMediaInfoAtIndex: called with index %lu", (uint8_t *)&v15, 0xCu);
  }
  id v6 = [(VUIMediaInfoFetchController *)self mediaInfos];
  unint64_t v7 = [v6 count];

  if (v7 > a3)
  {
    id v8 = [(VUIMediaInfoFetchController *)self mediaInfos];
    unint64_t v9 = (void *)[v8 mutableCopy];

    [v9 removeObjectAtIndex:a3];
    int v10 = (NSArray *)[v9 copy];
    mediaInfos = self->_mediaInfos;
    self->_mediaInfos = v10;

    uint64_t v12 = [(VUIMediaInfoFetchController *)self imageOperations];
    unint64_t v13 = [v12 objectAtIndex:a3];

    [v13 cancel];
    long long v14 = [(VUIMediaInfoFetchController *)self imageOperations];
    [v14 removeObjectAtIndex:a3];

    [(VUIMediaInfoFetchController *)self _updatePrewarmedPlayers];
  }
}

- (id)_createPlayerWithPlaylist:(id)a3 isForPrewarming:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    unint64_t v7 = [(VUIMediaInfoFetchController *)self _identifierForPlaylist:v6 isForPrewarming:v4];
    id v8 = [[VUIPlayer alloc] initWithName:v7];
    unint64_t v9 = v8;
    if (v4)
    {
      [(TVPPlayer *)v8 setWaitsAfterPreparingMediaItems:1];
      [(TVPPlayer *)v9 setSendsPlayerReports:0];
    }
    [(TVPPlayer *)v9 setPlaylist:v6];
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (void)loadImageAtIndex:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke;
  aBlock[3] = &unk_1E6DF8498;
  id v7 = v6;
  id v24 = v7;
  id v8 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke_3;
  v19[3] = &unk_1E6DF84E8;
  objc_copyWeak(&v21, &location);
  id v9 = v8;
  id v20 = v9;
  int v10 = _Block_copy(v19);
  id v11 = [(VUIMediaInfoFetchController *)self imageOperations];
  unint64_t v12 = [v11 count];

  if (v12 <= a3)
  {
    long long v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VUIMediaInfoFetchControllerErrorDomain" code:1 userInfo:0];
    (*((void (**)(void *, void, void *, void))v10 + 2))(v10, 0, v14, 0);
  }
  else
  {
    unint64_t v13 = [(VUIMediaInfoFetchController *)self imageOperations];
    long long v14 = [v13 objectAtIndex:a3];

    if ([v14 isFinished])
    {
      int v15 = [v14 image];
      unint64_t v16 = [v14 error];
      (*((void (**)(void *, void *, void *, uint64_t))v10 + 2))(v10, v15, v16, [v14 imageLoadFinished]);
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke_5;
      v17[3] = &unk_1E6DF8498;
      id v18 = v10;
      [v14 addCompletion:v17];
      int v15 = v18;
    }
  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke_2;
  v12[3] = &unk_1E6DF8470;
  id v9 = *(id *)(a1 + 32);
  id v14 = v8;
  id v15 = v9;
  id v13 = v7;
  char v16 = a4;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

uint64_t __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  }
  return result;
}

void __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    char v10 = [MEMORY[0x1E4FB3C70] canHandleDecodingOnRenderThread];
    if (!v7 || (v10 & 1) != 0)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v11 = [WeakRetained imageDecodingQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke_4;
      v12[3] = &unk_1E6DF84C0;
      id v13 = v7;
      id v15 = *(id *)(a1 + 32);
      id v14 = v8;
      char v16 = a4;
      dispatch_async(v11, v12);
    }
  }
}

uint64_t __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) image];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

uint64_t __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)populatePlaylistWithMediaItems:(id)a3 atIndex:(unint64_t)a4
{
  id v21 = a3;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [(VUIMediaInfoFetchController *)self mediaInfos];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    do
    {
      if (a4 != v9)
      {
        char v10 = [(VUIMediaInfoFetchController *)self mediaInfos];
        id v11 = [v10 objectAtIndex:v9];

        unint64_t v12 = [v11 tvpPlaylist];
        id v13 = [v12 currentMediaItem];

        if (v13)
        {
          id v14 = [v11 tvpPlaylist];
          id v15 = [v14 currentMediaItem];
          [v6 addObject:v15];
        }
      }
      ++v9;
      char v16 = [(VUIMediaInfoFetchController *)self mediaInfos];
      unint64_t v17 = [v16 count];
    }
    while (v9 < v17);
  }
  id v18 = (void *)MEMORY[0x1E4F28E60];
  uint64_t v19 = [(VUIMediaInfoFetchController *)self mediaInfos];
  id v20 = objc_msgSend(v18, "indexSetWithIndexesInRange:", 0, objc_msgSend(v19, "count"));

  [v20 removeIndex:a4];
  [v21 insertItems:v6 atIndexes:v20];
}

- (void)removePopulatedMediaItems:(id)a3 atIndex:(unint64_t)a4
{
  id v10 = a3;
  BOOL v5 = [v10 trackList];
  unint64_t v6 = [v5 count];

  if (v6 >= 2)
  {
    id v7 = (void *)MEMORY[0x1E4F28E60];
    uint64_t v8 = [v10 trackList];
    unint64_t v9 = objc_msgSend(v7, "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));

    [v9 removeIndex:a4];
    [v10 removeItemsAtIndexes:v9];
  }
}

- (id)loadPlayerAtIndex:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(VUIMediaInfoFetchController *)self mediaInfos];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    id v20 = 0;
  }
  else
  {
    id v7 = [(VUIMediaInfoFetchController *)self mediaInfos];
    uint64_t v8 = [v7 objectAtIndex:a3];

    unint64_t v9 = [v8 tvpPlaylist];
    id v10 = [(VUIMediaInfoFetchController *)self _identifierForPlaylist:v9 isForPrewarming:0];
    id v11 = [(VUIMediaInfoFetchController *)self _identifierForPlaylist:v9 isForPrewarming:1];
    unint64_t v12 = [(VUIMediaInfoFetchController *)self prewarmedPlayers];
    id v13 = [v12 objectForKey:v11];

    id v14 = (void *)sLogObject_10;
    if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      char v16 = [v13 name];
      int v22 = 138412546;
      unint64_t v23 = v10;
      __int16 v24 = 2112;
      uint64_t v25 = v16;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Creating playback player for identifier [%@].  Prewarm player for this identifier is [%@]", (uint8_t *)&v22, 0x16u);
    }
    id v17 = v9;
    id v18 = v17;
    if (v13)
    {
      uint64_t v19 = sLogObject_10;
      if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "Setting playlist from prewarm player on playback player", (uint8_t *)&v22, 2u);
      }
      id v18 = [v13 playlist];
    }
    id v20 = [(VUIMediaInfoFetchController *)self _createPlayerWithPlaylist:v18 isForPrewarming:0];
  }
  return v20;
}

- (BOOL)mediaInfoContainsImageAtIndex:(unint64_t)a3
{
  BOOL v5 = [(VUIMediaInfoFetchController *)self mediaInfos];
  unint64_t v6 = [v5 count];

  if (v6 <= a3) {
    return 0;
  }
  id v7 = [(VUIMediaInfoFetchController *)self mediaInfos];
  uint64_t v8 = [v7 objectAtIndex:a3];

  unint64_t v9 = [v8 imageProxies];
  BOOL v10 = [v9 count] != 0;

  return v10;
}

- (BOOL)mediaInfoContainsPlayerAtIndex:(unint64_t)a3
{
  BOOL v5 = [(VUIMediaInfoFetchController *)self mediaInfos];
  unint64_t v6 = [v5 count];

  if (v6 <= a3) {
    return 0;
  }
  id v7 = [(VUIMediaInfoFetchController *)self mediaInfos];
  uint64_t v8 = [v7 objectAtIndex:a3];

  unint64_t v9 = [v8 tvpPlaylist];
  BOOL v10 = v9 != 0;

  return v10;
}

- (NSArray)mediaInfos
{
  return self->_mediaInfos;
}

- (unint64_t)index
{
  return self->_index;
}

- (unint64_t)playerPreloadOffset
{
  return self->_playerPreloadOffset;
}

- (void)setPlayerPreloadOffset:(unint64_t)a3
{
  self->_playerPreloadOffset = a3;
}

- (BOOL)isPreloadPlaybackEnabled
{
  return self->_preloadPlaybackEnabled;
}

- (void)setPreloadPlaybackEnabled:(BOOL)a3
{
  self->_preloadPlaybackEnabled = a3;
}

- (NSOperationQueue)imageQueue
{
  return self->_imageQueue;
}

- (void)setImageQueue:(id)a3
{
}

- (NSMutableArray)imageOperations
{
  return self->_imageOperations;
}

- (void)setImageOperations:(id)a3
{
}

- (NSMutableDictionary)prewarmedPlayers
{
  return self->_prewarmedPlayers;
}

- (void)setPrewarmedPlayers:(id)a3
{
}

- (OS_dispatch_queue)imageDecodingQueue
{
  return self->_imageDecodingQueue;
}

- (void)setImageDecodingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDecodingQueue, 0);
  objc_storeStrong((id *)&self->_prewarmedPlayers, 0);
  objc_storeStrong((id *)&self->_imageOperations, 0);
  objc_storeStrong((id *)&self->_imageQueue, 0);
  objc_storeStrong((id *)&self->_mediaInfos, 0);
}

@end