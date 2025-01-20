@interface VideosExtrasBookmarkController
+ (id)sharedInstance;
- (BOOL)pushBookmarkForAsset:(id)a3 bookmarkTime:(double)a4 playedToNominalLength:(BOOL)a5;
- (BOOL)pushBookmarkForIdentifier:(id)a3 bookmarkTime:(double)a4 playedToNominalLength:(BOOL)a5;
- (VideosExtrasBookmarkController)init;
- (double)minimumBookmarkUpdateInterval;
- (void)_loadAllBookmarksWithRemainingIdentifiers:(id)a3 bookmarkTimes:(id)a4 completionBlock:(id)a5;
- (void)pullBookmarksForAssets:(id)a3 completionBlock:(id)a4;
- (void)pullBookmarksForIdentifiers:(id)a3 completionBlock:(id)a4;
- (void)setMinimumBookmarkUpdateInterval:(double)a3;
@end

@implementation VideosExtrasBookmarkController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_16);
  }
  v2 = (void *)sharedInstance___sharedInstance_1;
  return v2;
}

void __48__VideosExtrasBookmarkController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VideosExtrasBookmarkController);
  v1 = (void *)sharedInstance___sharedInstance_1;
  sharedInstance___sharedInstance_1 = (uint64_t)v0;
}

- (VideosExtrasBookmarkController)init
{
  v40.receiver = self;
  v40.super_class = (Class)VideosExtrasBookmarkController;
  id v8 = [(VideosExtrasBookmarkController *)&v40 init];
  if (!v8) {
    goto LABEL_5;
  }
  VideosExtrasLoggingToOSLogging(6, @"Initializing extras bookmarking...", v2, v3, v4, v5, v6, v7, v38);
  id v9 = [NSString alloc];
  v10 = (objc_class *)objc_opt_class();
  v39 = NSStringFromClass(v10);
  v11 = (void *)[v9 initWithFormat:@"com.apple.%@.queue.%p"];

  id v12 = v11;
  dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], 0);
  v14 = (void *)*((void *)v8 + 1);
  *((void *)v8 + 1) = v13;

  uint64_t v15 = [MEMORY[0x1E4FA80E0] domainForExtrasValues];
  v16 = (void *)*((void *)v8 + 2);
  *((void *)v8 + 2) = v15;

  uint64_t v22 = *((void *)v8 + 2);
  if (!v22)
  {
    v36 = @"Failed to initialize extras bookmarking. Extras playback position domain is nil!";
LABEL_8:
    VideosExtrasLoggingToOSLogging(3, v36, v22, v17, v18, v19, v20, v21, (uint64_t)v39);

    v35 = 0;
    goto LABEL_9;
  }
  uint64_t v23 = objc_msgSend(MEMORY[0x1E4FA80F0], "serviceForValueDomain:");
  v24 = (void *)*((void *)v8 + 3);
  *((void *)v8 + 3) = v23;

  if (!*((void *)v8 + 3))
  {
    v36 = @"Failed to initialize extras bookmarking. Extras playback position value service is nil!";
    goto LABEL_8;
  }
  uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
  v26 = (void *)*((void *)v8 + 4);
  *((void *)v8 + 4) = v25;

  uint64_t v27 = [MEMORY[0x1E4F1CA60] dictionary];
  v28 = (void *)*((void *)v8 + 5);
  *((void *)v8 + 5) = v27;

  *((void *)v8 + 6) = 0x4024000000000000;
  VideosExtrasLoggingToOSLogging(6, @"Done initializing extras bookmarking.", v29, v30, v31, v32, v33, v34, (uint64_t)v39);

LABEL_5:
  v35 = (VideosExtrasBookmarkController *)v8;
LABEL_9:

  return v35;
}

- (void)pullBookmarksForAssets:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__VideosExtrasBookmarkController_pullBookmarksForAssets_completionBlock___block_invoke;
  v11[3] = &unk_1E6DF5018;
  id v12 = v9;
  id v10 = v9;
  [v8 enumerateObjectsUsingBlock:v11];

  [(VideosExtrasBookmarkController *)self pullBookmarksForIdentifiers:v10 completionBlock:v7];
}

void __73__VideosExtrasBookmarkController_pullBookmarksForAssets_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 bookmarkID];
  if (v3) {
    uint64_t v4 = (__CFString *)v3;
  }
  else {
    uint64_t v4 = &stru_1F3E921E0;
  }
  uint64_t v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)pullBookmarksForIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    VideosExtrasLoggingToOSLogging(6, @"Pulling bookmark times for identifiers: %@ ...", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    v14 = (void *)[v6 mutableCopy];
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __78__VideosExtrasBookmarkController_pullBookmarksForIdentifiers_completionBlock___block_invoke;
    v17[3] = &unk_1E6DF4510;
    id v18 = v6;
    id v19 = v15;
    id v20 = v7;
    id v16 = v15;
    [(VideosExtrasBookmarkController *)self _loadAllBookmarksWithRemainingIdentifiers:v14 bookmarkTimes:v16 completionBlock:v17];
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

uint64_t __78__VideosExtrasBookmarkController_pullBookmarksForIdentifiers_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  VideosExtrasLoggingToOSLogging(6, @"Done pulling bookmark times for identifiers: %@, times: %@", a3, a4, a5, a6, a7, a8, *(void *)(a1 + 32));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

- (BOOL)pushBookmarkForAsset:(id)a3 bookmarkTime:(double)a4 playedToNominalLength:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = [a3 bookmarkID];
  LOBYTE(v5) = [(VideosExtrasBookmarkController *)self pushBookmarkForIdentifier:v8 bookmarkTime:v5 playedToNominalLength:a4];

  return v5;
}

- (BOOL)pushBookmarkForIdentifier:(id)a3 bookmarkTime:(double)a4 playedToNominalLength:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v15 = v8;
  if (v8 && [v8 length])
  {
    VideosExtrasLoggingToOSLogging(6, @"Bookmark update requested for identifier: %@, bookmark time: %.1f, played to nominal length: %d", v9, v10, v11, v12, v13, v14, (uint64_t)v15);
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 1;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__VideosExtrasBookmarkController_pushBookmarkForIdentifier_bookmarkTime_playedToNominalLength___block_invoke;
    block[3] = &unk_1E6DF5040;
    block[4] = self;
    id v17 = v15;
    id v34 = v17;
    v35 = &v36;
    dispatch_sync(queue, block);
    if (*((unsigned char *)v37 + 24))
    {
      id v18 = [(NSMutableDictionary *)self->_entities objectForKeyedSubscript:v17];
      if (!v18) {
        id v18 = (void *)[objc_alloc(MEMORY[0x1E4FA80E8]) initWithPlaybackPositionDomain:self->_domain ubiquitousIdentifier:v17 foreignDatabaseEntityID:0];
      }
      [v18 setBookmarkTimestamp:CFAbsoluteTimeGetCurrent()];
      double v19 = 0.0;
      if (!v5) {
        double v19 = a4;
      }
      [v18 setBookmarkTime:v19];
      if (v5) {
        uint64_t v20 = [v18 userPlayCount] + 1;
      }
      else {
        uint64_t v20 = [v18 userPlayCount];
      }
      [v18 setUserPlayCount:v20];
      [v18 setHasBeenPlayed:v5];
      VideosExtrasLoggingToOSLogging(6, @"Pushing bookmark for identifier: %@, bookmark time: %.1f, played to nominal length: %@", v22, v23, v24, v25, v26, v27, (uint64_t)v17);
      extrasService = self->_extrasService;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __95__VideosExtrasBookmarkController_pushBookmarkForIdentifier_bookmarkTime_playedToNominalLength___block_invoke_2;
      v30[3] = &unk_1E6DF5068;
      id v31 = v17;
      uint64_t v32 = self;
      [(SBCPlaybackPositionValueService *)extrasService pushPlaybackPositionEntity:v18 completionBlock:v30];
    }
    _Block_object_dispose(&v36, 8);
    BOOL v21 = 1;
  }
  else
  {
    VideosExtrasLoggingToOSLogging(6, @"Skipping bookmark push for identifier: %@.  No bookmark ID found.", v9, v10, v11, v12, v13, v14, (uint64_t)v15);
    BOOL v21 = 0;
  }

  return v21;
}

void __95__VideosExtrasBookmarkController_pushBookmarkForIdentifier_bookmarkTime_playedToNominalLength___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  id v18 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v10 = CFAbsoluteTimeGetCurrent() - v3;
    if (v10 >= *(double *)(a1[4] + 48))
    {
      VideosExtrasLoggingToOSLogging(6, @"Proceeding with bookmark update since it has been %.0f seconds since the last update for identifier: %@", v4, v5, v6, v7, v8, v9, *(uint64_t *)&v10);
    }
    else
    {
      VideosExtrasLoggingToOSLogging(6, @"Skipping bookmark update since its only been %.0f seconds since the last update for identifier: %@", v4, v5, v6, v7, v8, v9, *(uint64_t *)&v10);
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:CFAbsoluteTimeGetCurrent()];
    [*(id *)(a1[4] + 40) setObject:v11 forKeyedSubscript:a1[5]];

    VideosExtrasLoggingToOSLogging(6, @"Proceeding with bookmark update since the identifier hasn't been updated in the recent past. identifier: %@", v12, v13, v14, v15, v16, v17, a1[5]);
  }
}

void __95__VideosExtrasBookmarkController_pushBookmarkForIdentifier_bookmarkTime_playedToNominalLength___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = a3;
  [v6 bookmarkTime];
  VideosExtrasLoggingToOSLogging(6, @"Completed bookmark push for identifier: %@, success: %@, error: %@, bookmark time: %.1f", v9, v10, v11, v12, v13, v14, v7);

  if (v6)
  {
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(NSObject **)(v15 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__VideosExtrasBookmarkController_pushBookmarkForIdentifier_bookmarkTime_playedToNominalLength___block_invoke_3;
    block[3] = &unk_1E6DF45D8;
    block[4] = v15;
    id v18 = *(id *)(a1 + 32);
    id v19 = v6;
    dispatch_sync(v16, block);
  }
}

uint64_t __95__VideosExtrasBookmarkController_pushBookmarkForIdentifier_bookmarkTime_playedToNominalLength___block_invoke_3(void *a1)
{
  return [*(id *)(a1[4] + 32) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (void)_loadAllBookmarksWithRemainingIdentifiers:(id)a3 bookmarkTimes:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  uint64_t v11 = [v8 firstObject];
  if (v11)
  {
    [v8 removeObjectAtIndex:0];
    if ([v11 length])
    {
      id v18 = [MEMORY[0x1E4F28ED0] numberWithDouble:CFAbsoluteTimeGetCurrent()];
      [(NSMutableDictionary *)self->_updateTimeForEntities setObject:v18 forKeyedSubscript:v11];

      VideosExtrasLoggingToOSLogging(6, @"Pulling bookmark for identifier: %@", v19, v20, v21, v22, v23, v24, (uint64_t)v11);
      uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4FA80E8]) initWithPlaybackPositionDomain:self->_domain ubiquitousIdentifier:v11 foreignDatabaseEntityID:0];
      extrasService = self->_extrasService;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __106__VideosExtrasBookmarkController__loadAllBookmarksWithRemainingIdentifiers_bookmarkTimes_completionBlock___block_invoke;
      v27[3] = &unk_1E6DF5090;
      id v28 = v11;
      uint64_t v29 = self;
      id v30 = v9;
      id v31 = v8;
      uint64_t v32 = v10;
      [(SBCPlaybackPositionValueService *)extrasService pullPlaybackPositionEntity:v25 completionBlock:v27];
    }
    else
    {
      VideosExtrasLoggingToOSLogging(6, @"Skipping bookmark pull for identifier: %@. No bookmark id found.", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
      [v9 addObject:&unk_1F3F3C6B0];
      [(VideosExtrasBookmarkController *)self _loadAllBookmarksWithRemainingIdentifiers:v8 bookmarkTimes:v9 completionBlock:v10];
    }
  }
  else if (v10)
  {
    v10[2](v10);
  }
}

void __106__VideosExtrasBookmarkController__loadAllBookmarksWithRemainingIdentifiers_bookmarkTimes_completionBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = a3;
  [v7 bookmarkTime];
  VideosExtrasLoggingToOSLogging(6, @"Completed bookmark pull for identifier: %@, success: %@, error: %@, bookmark time: %.1f", v10, v11, v12, v13, v14, v15, v8);

  double v16 = 0.0;
  if (v7)
  {
    uint64_t v17 = *(void *)(a1 + 40);
    id v18 = *(NSObject **)(v17 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__VideosExtrasBookmarkController__loadAllBookmarksWithRemainingIdentifiers_bookmarkTimes_completionBlock___block_invoke_2;
    block[3] = &unk_1E6DF45D8;
    block[4] = v17;
    id v24 = *(id *)(a1 + 32);
    id v19 = v7;
    id v25 = v19;
    dispatch_sync(v18, block);

    if (a2)
    {
      [v19 bookmarkTime];
      double v16 = v20;
    }
  }
  uint64_t v21 = *(void **)(a1 + 48);
  uint64_t v22 = [MEMORY[0x1E4F28ED0] numberWithDouble:v16];
  [v21 addObject:v22];

  [*(id *)(a1 + 40) _loadAllBookmarksWithRemainingIdentifiers:*(void *)(a1 + 56) bookmarkTimes:*(void *)(a1 + 48) completionBlock:*(void *)(a1 + 64)];
}

uint64_t __106__VideosExtrasBookmarkController__loadAllBookmarksWithRemainingIdentifiers_bookmarkTimes_completionBlock___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 32) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (double)minimumBookmarkUpdateInterval
{
  return self->_minimumBookmarkUpdateInterval;
}

- (void)setMinimumBookmarkUpdateInterval:(double)a3
{
  self->_minimumBookmarkUpdateInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimeForEntities, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_extrasService, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end