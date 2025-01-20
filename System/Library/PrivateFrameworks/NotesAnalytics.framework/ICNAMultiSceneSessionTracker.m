@interface ICNAMultiSceneSessionTracker
- (BOOL)hasLiveTimers;
- (BOOL)invalidated;
- (BOOL)isInvalidated;
- (BOOL)isInvalidatedThreadUnsafe;
- (ICASSessionSummaryData)sessionSummaryData;
- (ICNAMultiSceneSessionTracker)init;
- (NSDictionary)sceneSessionTrackers;
- (NSString)sessionDetailDescription;
- (OS_dispatch_queue)isolationQueue;
- (int64_t)sessionDetailType;
- (void)endAllSessionsAndInvalidate;
- (void)endNotesSession;
- (void)endPaperSession;
- (void)setInvalidated:(BOOL)a3;
- (void)setIsolationQueue:(id)a3;
- (void)setSceneSessionTrackers:(id)a3;
- (void)startNotesSession;
- (void)startPaperSession;
@end

@implementation ICNAMultiSceneSessionTracker

- (ICNAMultiSceneSessionTracker)init
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)ICNAMultiSceneSessionTracker;
  v2 = [(ICNAMultiSceneSessionTracker *)&v11 init];
  if (v2)
  {
    v12[0] = @"notes";
    v3 = [[ICNASceneSessionTracker alloc] initWithSessionTypeEnum:2];
    v13[0] = v3;
    v12[1] = @"paper";
    v4 = [[ICNASceneSessionTracker alloc] initWithSessionTypeEnum:1];
    v13[1] = v4;
    v12[2] = @"notesAndPaper";
    v5 = [[ICNASceneSessionTracker alloc] initWithSessionTypeEnum:3];
    v13[2] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    sceneSessionTrackers = v2->_sceneSessionTrackers;
    v2->_sceneSessionTrackers = (NSDictionary *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.notes.analytics.multiSceneSessionTracker", MEMORY[0x1E4F14430]);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

- (void)startNotesSession
{
  v3 = [(ICNAMultiSceneSessionTracker *)self isolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ICNAMultiSceneSessionTracker_startNotesSession__block_invoke;
  block[3] = &unk_1E64B8A48;
  block[4] = self;
  dispatch_barrier_async(v3, block);
}

void __49__ICNAMultiSceneSessionTracker_startNotesSession__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isInvalidatedThreadUnsafe] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) sceneSessionTrackers];
    v3 = [v2 objectForKeyedSubscript:@"notes"];
    [v3 startTimer];

    v4 = [*(id *)(a1 + 32) sceneSessionTrackers];
    v5 = [v4 objectForKeyedSubscript:@"paper"];
    int v6 = [v5 timerIsOn];

    if (v6)
    {
      id v8 = [*(id *)(a1 + 32) sceneSessionTrackers];
      v7 = [v8 objectForKeyedSubscript:@"notesAndPaper"];
      [v7 startTimer];
    }
  }
}

- (void)endNotesSession
{
  v3 = [(ICNAMultiSceneSessionTracker *)self isolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ICNAMultiSceneSessionTracker_endNotesSession__block_invoke;
  block[3] = &unk_1E64B8A48;
  block[4] = self;
  dispatch_barrier_async(v3, block);
}

void __47__ICNAMultiSceneSessionTracker_endNotesSession__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isInvalidatedThreadUnsafe] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) sceneSessionTrackers];
    v3 = [v2 objectForKeyedSubscript:@"notes"];
    [v3 endTimer];

    id v5 = [*(id *)(a1 + 32) sceneSessionTrackers];
    v4 = [v5 objectForKeyedSubscript:@"notesAndPaper"];
    [v4 endTimer];
  }
}

- (void)startPaperSession
{
  v3 = [(ICNAMultiSceneSessionTracker *)self isolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ICNAMultiSceneSessionTracker_startPaperSession__block_invoke;
  block[3] = &unk_1E64B8A48;
  block[4] = self;
  dispatch_barrier_async(v3, block);
}

void __49__ICNAMultiSceneSessionTracker_startPaperSession__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isInvalidatedThreadUnsafe] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) sceneSessionTrackers];
    v3 = [v2 objectForKeyedSubscript:@"paper"];
    [v3 startTimer];

    v4 = [*(id *)(a1 + 32) sceneSessionTrackers];
    id v5 = [v4 objectForKeyedSubscript:@"notes"];
    int v6 = [v5 timerIsOn];

    if (v6)
    {
      id v8 = [*(id *)(a1 + 32) sceneSessionTrackers];
      v7 = [v8 objectForKeyedSubscript:@"notesAndPaper"];
      [v7 startTimer];
    }
  }
}

- (void)endPaperSession
{
  v3 = [(ICNAMultiSceneSessionTracker *)self isolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ICNAMultiSceneSessionTracker_endPaperSession__block_invoke;
  block[3] = &unk_1E64B8A48;
  block[4] = self;
  dispatch_barrier_async(v3, block);
}

void __47__ICNAMultiSceneSessionTracker_endPaperSession__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isInvalidatedThreadUnsafe] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) sceneSessionTrackers];
    v3 = [v2 objectForKeyedSubscript:@"paper"];
    [v3 endTimer];

    id v5 = [*(id *)(a1 + 32) sceneSessionTrackers];
    v4 = [v5 objectForKeyedSubscript:@"notesAndPaper"];
    [v4 endTimer];
  }
}

- (void)endAllSessionsAndInvalidate
{
  v3 = [(ICNAMultiSceneSessionTracker *)self isolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ICNAMultiSceneSessionTracker_endAllSessionsAndInvalidate__block_invoke;
  block[3] = &unk_1E64B8A48;
  block[4] = self;
  dispatch_barrier_async(v3, block);
}

uint64_t __59__ICNAMultiSceneSessionTracker_endAllSessionsAndInvalidate__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isInvalidatedThreadUnsafe];
  if ((result & 1) == 0)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers", 0);
    v4 = [v3 allValues];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) endTimer];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    return [*(id *)(a1 + 32) setInvalidated:1];
  }
  return result;
}

- (ICASSessionSummaryData)sessionSummaryData
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__2;
  long long v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  v3 = [(ICNAMultiSceneSessionTracker *)self isolationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ICNAMultiSceneSessionTracker_sessionSummaryData__block_invoke;
  v7[3] = &unk_1E64B8A98;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v3, v7);

  v4 = [ICASSessionSummaryData alloc];
  uint64_t v5 = [(ICASSessionSummaryData *)v4 initWithSessionSummaryArray:v9[5]];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __50__ICNAMultiSceneSessionTracker_sessionSummaryData__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers", 0);
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        long long v12 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) sessionSummaryItemData];
        objc_msgSend(v11, "ic_addNonNilObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (BOOL)hasLiveTimers
{
  id v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(ICNAMultiSceneSessionTracker *)self isolationQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__ICNAMultiSceneSessionTracker_hasLiveTimers__block_invoke;
  v5[3] = &unk_1E64B8DF8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __45__ICNAMultiSceneSessionTracker_hasLiveTimers__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isInvalidatedThreadUnsafe] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers", 0);
    uint64_t v3 = [v2 allValues];

    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [*(id *)(*((void *)&v8 + 1) + 8 * v7) timerIsOn];
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
          if (v5) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (int64_t)sessionDetailType
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(ICNAMultiSceneSessionTracker *)self isolationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__ICNAMultiSceneSessionTracker_sessionDetailType__block_invoke;
  v6[3] = &unk_1E64B8DF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __49__ICNAMultiSceneSessionTracker_sessionDetailType__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isInvalidatedThreadUnsafe] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) sceneSessionTrackers];
    uint64_t v3 = [v2 objectForKeyedSubscript:@"notesAndPaper"];
    char v4 = [v3 timerIsOn];

    if (v4)
    {
      uint64_t v5 = 3;
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 32) sceneSessionTrackers];
      uint64_t v7 = [v6 objectForKeyedSubscript:@"notes"];
      char v8 = [v7 timerIsOn];

      if (v8)
      {
        uint64_t v5 = 2;
      }
      else
      {
        uint64_t v9 = [*(id *)(a1 + 32) sceneSessionTrackers];
        uint64_t v10 = [v9 objectForKeyedSubscript:@"paper"];
        int v11 = [v10 timerIsOn];

        if (!v11) {
          return;
        }
        uint64_t v5 = 1;
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  }
}

- (NSString)sessionDetailDescription
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__2;
  int v11 = __Block_byref_object_dispose__2;
  long long v12 = @"unknown";
  uint64_t v3 = [(ICNAMultiSceneSessionTracker *)self isolationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__ICNAMultiSceneSessionTracker_sessionDetailDescription__block_invoke;
  v6[3] = &unk_1E64B8DF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __56__ICNAMultiSceneSessionTracker_sessionDetailDescription__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isInvalidatedThreadUnsafe] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) sceneSessionTrackers];
    uint64_t v3 = [v2 objectForKeyedSubscript:@"notesAndPaper"];
    int v4 = [v3 timerIsOn];

    if (v4)
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = @"notesAndPaper";
    }
    else
    {
      uint64_t v7 = [*(id *)(a1 + 32) sceneSessionTrackers];
      char v8 = [v7 objectForKeyedSubscript:@"notes"];
      int v9 = [v8 timerIsOn];

      if (v9)
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v6 = *(void **)(v10 + 40);
        int v11 = @"notes";
      }
      else
      {
        long long v12 = [*(id *)(a1 + 32) sceneSessionTrackers];
        uint64_t v13 = [v12 objectForKeyedSubscript:@"paper"];
        int v14 = [v13 timerIsOn];

        if (!v14) {
          return;
        }
        uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v6 = *(void **)(v10 + 40);
        int v11 = @"paper";
      }
      *(void *)(v10 + 40) = v11;
    }
  }
}

- (BOOL)invalidated
{
  id v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(ICNAMultiSceneSessionTracker *)self isolationQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__ICNAMultiSceneSessionTracker_invalidated__block_invoke;
  v5[3] = &unk_1E64B8A98;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __43__ICNAMultiSceneSessionTracker_invalidated__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (BOOL)isInvalidatedThreadUnsafe
{
  return self->_invalidated;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSDictionary)sceneSessionTrackers
{
  return self->_sceneSessionTrackers;
}

- (void)setSceneSessionTrackers:(id)a3
{
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setIsolationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_sceneSessionTrackers, 0);
}

@end