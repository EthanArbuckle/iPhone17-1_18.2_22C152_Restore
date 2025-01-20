@interface VUIPlaybackPositionController
+ (id)sharedInstance;
- (BOOL)isRunning;
- (VUIPlaybackPositionController)init;
- (id)_init;
- (void)_onQueue_beginCapturingEvents;
- (void)_onQueue_endCapturingEvents;
- (void)_onQueue_updateEntityWithPlaybackPositionInfo:(id)a3 forTrack:(id)a4;
- (void)beginCapturingEvents;
- (void)endCapturingEvents;
- (void)persistPlaybackPositionInfo:(id)a3 forTrack:(id)a4;
- (void)setRunning:(BOOL)a3;
@end

@implementation VUIPlaybackPositionController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_24);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;
  return v2;
}

void __47__VUIPlaybackPositionController_sharedInstance__block_invoke()
{
  id v0 = [[VUIPlaybackPositionController alloc] _init];
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;
}

- (VUIPlaybackPositionController)init
{
  return 0;
}

- (void)beginCapturingEvents
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__VUIPlaybackPositionController_beginCapturingEvents__block_invoke;
  block[3] = &unk_1E6DF3D58;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __53__VUIPlaybackPositionController_beginCapturingEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_beginCapturingEvents");
}

- (void)endCapturingEvents
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VUIPlaybackPositionController_endCapturingEvents__block_invoke;
  block[3] = &unk_1E6DF3D58;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__VUIPlaybackPositionController_endCapturingEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_endCapturingEvents");
}

- (void)persistPlaybackPositionInfo:(id)a3 forTrack:(id)a4
{
  id v6 = a4;
  v7 = (void *)[a3 copy];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__VUIPlaybackPositionController_persistPlaybackPositionInfo_forTrack___block_invoke;
  block[3] = &unk_1E6DF45D8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

uint64_t __70__VUIPlaybackPositionController_persistPlaybackPositionInfo_forTrack___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateEntityWithPlaybackPositionInfo:forTrack:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (id)_init
{
  v12.receiver = self;
  v12.super_class = (Class)VUIPlaybackPositionController;
  v2 = [(VUIPlaybackPositionController *)&v12 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.tv", "PlaybackPosition");
    logObject = v2->_logObject;
    v2->_logObject = (OS_os_log *)v3;

    v5 = [MEMORY[0x1E4F79AF8] autoupdatingSharedLibraryPath];
    id v6 = [MEMORY[0x1E4FA80E0] domainForSyncingMusicLibraryWithLibraryPath:v5];
    uint64_t v7 = [MEMORY[0x1E4FA80F8] serviceForSyncDomain:v6];
    syncService = v2->_syncService;
    v2->_syncService = (SBCPlaybackPositionSyncService *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.tv.playbackPosition", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (void)_onQueue_beginCapturingEvents
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_DEBUG, "Beginning capturing events", v1, 2u);
}

- (void)_onQueue_endCapturingEvents
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_DEBUG, "End capturing events", v1, 2u);
}

- (void)_onQueue_updateEntityWithPlaybackPositionInfo:(id)a3 forTrack:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(VUIPlaybackPositionController *)self isRunning]) {
    [(VUIPlaybackPositionController *)self _onQueue_beginCapturingEvents];
  }
  v8 = [v7 valueForProperty:*MEMORY[0x1E4F798F0]];
  id v9 = objc_alloc(MEMORY[0x1E4FA80E8]);
  id v10 = [(SBCPlaybackPositionSyncService *)self->_syncService playbackPositionDomain];
  v11 = objc_msgSend(v9, "initWithPlaybackPositionDomain:ubiquitousIdentifier:foreignDatabaseEntityID:", v10, v8, objc_msgSend(v7, "persistentID"));

  objc_super v12 = [v6 bookmarkTime];

  if (v12)
  {
    id v13 = [v6 bookmarkTime];
    [v13 doubleValue];
    double v15 = v14;
  }
  else
  {
    id v13 = [v7 valueForProperty:*MEMORY[0x1E4F79490]];
    [v13 doubleValue];
    double v15 = v16 / 1000.0;
  }

  v17 = [v6 playCount];

  if (v17) {
    [v6 playCount];
  }
  else {
  v18 = [v7 valueForProperty:*MEMORY[0x1E4F797C8]];
  }
  uint64_t v19 = [v18 unsignedIntegerValue];

  v20 = [v6 hasBeenPlayed];

  if (v20) {
    [v6 hasBeenPlayed];
  }
  else {
  v21 = [v7 valueForProperty:*MEMORY[0x1E4F79670]];
  }
  uint64_t v22 = [v21 BOOLValue];

  [v11 setBookmarkTime:v15];
  [v11 setUserPlayCount:v19];
  [v11 setHasBeenPlayed:v22];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(v11, "setBookmarkTimestamp:");
  dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  syncService = self->_syncService;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __88__VUIPlaybackPositionController__onQueue_updateEntityWithPlaybackPositionInfo_forTrack___block_invoke;
  v27[3] = &unk_1E6DF5778;
  objc_copyWeak(&v29, &location);
  v25 = v23;
  v28 = v25;
  [(SBCPlaybackPositionSyncService *)syncService persistPlaybackPositionEntity:v11 isCheckpoint:0 completionBlock:v27];
  dispatch_time_t v26 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v25, v26);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __88__VUIPlaybackPositionController__onQueue_updateEntityWithPlaybackPositionInfo_forTrack___block_invoke(uint64_t a1, char a2)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[1];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __88__VUIPlaybackPositionController__onQueue_updateEntityWithPlaybackPositionInfo_forTrack___block_invoke_cold_1(a2, v6);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_logObject, 0);
}

void __88__VUIPlaybackPositionController__onQueue_updateEntityWithPlaybackPositionInfo_forTrack___block_invoke_cold_1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_DEBUG, "Updated bookmark: %d", (uint8_t *)v2, 8u);
}

@end