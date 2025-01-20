@interface MRNowPlayingPlayerClientCallbacks
- (BOOL)hasPlaybackQueueCallbacks;
- (BOOL)removePlaybackQueueDataSourceCallback:(id)a3;
- (MRNowPlayingPlayerClientCallbacks)initWithPlayerPath:(id)a3 queue:(id)a4;
- (MRPlayerPath)playerPath;
- (MSVMultiCallback)artworkCallbacks;
- (MSVMultiCallback)availableArtworkFormatsCallbacks;
- (MSVMultiCallback)createChildItemCallbacks;
- (MSVMultiCallback)createItemForIdentifierCallbacks;
- (MSVMultiCallback)createItemForOffsetCallbacks;
- (MSVMultiCallback)createPlaybackQueueForRequestCallbacks;
- (MSVMultiCallback)formattedArtworkCallbacks;
- (MSVMultiCallback)infoCallbacks;
- (MSVMultiCallback)languageOptionsCallbacks;
- (MSVMultiCallback)lyricsCallbacks;
- (MSVMultiCallback)metadataCallbacks;
- (MSVMultiCallback)transcriptAlignmentsCallbacks;
- (NSArray)commandHandlerBlocks;
- (id)audioAmplitudeSamplesCallback;
- (id)beginLyricsEventCallback;
- (id)endLyricsEventCallback;
- (id)playbackSessionCallback;
- (id)playbackSessionMigrateBeginCallback;
- (id)playbackSessionMigrateEndCallback;
- (id)playbackSessionMigrateRequestCallback;
- (id)videoThumbnailsCallback;
- (unint64_t)_onQueue_capabilities;
- (unint64_t)capabilities;
- (void)addCommandHandlerBlock:(id)a3 forKey:(id)a4;
- (void)registerNowPlayingInfoArtworkAssetCallback:(id)a3;
- (void)registerNowPlayingInfoAssetCallbacks:(id)a3;
- (void)registerNowPlayingInfoBackedPlaybackQueueDataSourceCallbacks;
- (void)registerNowPlayingInfoCallbacks:(id)a3;
- (void)removeCommandHandlerBlockForKey:(id)a3;
- (void)setAudioAmplitudeSamplesCallback:(id)a3;
- (void)setBeginLyricsEventCallback:(id)a3;
- (void)setEndLyricsEventCallback:(id)a3;
- (void)setPlaybackSessionCallback:(id)a3;
- (void)setPlaybackSessionMigrateBeginCallback:(id)a3;
- (void)setPlaybackSessionMigrateEndCallback:(id)a3;
- (void)setPlaybackSessionMigrateRequestCallback:(id)a3;
- (void)setVideoThumbnailsCallback:(id)a3;
@end

@implementation MRNowPlayingPlayerClientCallbacks

- (MSVMultiCallback)createPlaybackQueueForRequestCallbacks
{
  return self->_createPlaybackQueueForRequestCallbacks;
}

- (MSVMultiCallback)createItemForIdentifierCallbacks
{
  return self->_createItemForIdentifierCallbacks;
}

- (MSVMultiCallback)createItemForOffsetCallbacks
{
  return self->_createItemForOffsetCallbacks;
}

- (MSVMultiCallback)languageOptionsCallbacks
{
  return self->_languageOptionsCallbacks;
}

- (MSVMultiCallback)availableArtworkFormatsCallbacks
{
  return self->_availableArtworkFormatsCallbacks;
}

- (void)setPlaybackSessionMigrateRequestCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (MRNowPlayingPlayerClientCallbacks)initWithPlayerPath:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v41.receiver = self;
  v41.super_class = (Class)MRNowPlayingPlayerClientCallbacks;
  v9 = [(MRNowPlayingPlayerClientCallbacks *)&v41 init];
  if (v9)
  {
    if (!v8)
    {
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      v38 = [NSString stringWithUTF8String:"-[MRNowPlayingPlayerClientCallbacks initWithPlayerPath:queue:]"];
      [v37 handleFailureInFunction:v38, @"MRNowPlayingPlayerClientCallbacks.m", 51, @"Invalid parameter not satisfying: %@", @"queue" file lineNumber description];
    }
    if (([v7 isResolved] & 1) == 0)
    {
      v39 = [MEMORY[0x1E4F28B00] currentHandler];
      v40 = [NSString stringWithUTF8String:"-[MRNowPlayingPlayerClientCallbacks initWithPlayerPath:queue:]"];
      [v39 handleFailureInFunction:v40 file:@"MRNowPlayingPlayerClientCallbacks.m" lineNumber:52 description:@"Attempting to use unresolved Player Path"];
    }
    objc_storeStrong((id *)&v9->_serialQueue, a4);
    objc_storeStrong((id *)&v9->_playerPath, a3);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    commandHandlerBlocks = v9->_commandHandlerBlocks;
    v9->_commandHandlerBlocks = v10;

    v12 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E4F779A8]);
    createPlaybackQueueForRequestCallbacks = v9->_createPlaybackQueueForRequestCallbacks;
    v9->_createPlaybackQueueForRequestCallbacks = v12;

    v14 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E4F779A8]);
    createItemForOffsetCallbacks = v9->_createItemForOffsetCallbacks;
    v9->_createItemForOffsetCallbacks = v14;

    v16 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E4F779A8]);
    createItemForIdentifierCallbacks = v9->_createItemForIdentifierCallbacks;
    v9->_createItemForIdentifierCallbacks = v16;

    v18 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E4F779A8]);
    createChildItemCallbacks = v9->_createChildItemCallbacks;
    v9->_createChildItemCallbacks = v18;

    v20 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E4F779A8]);
    metadataCallbacks = v9->_metadataCallbacks;
    v9->_metadataCallbacks = v20;

    v22 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E4F779A8]);
    languageOptionsCallbacks = v9->_languageOptionsCallbacks;
    v9->_languageOptionsCallbacks = v22;

    v24 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E4F779A8]);
    infoCallbacks = v9->_infoCallbacks;
    v9->_infoCallbacks = v24;

    v26 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E4F779A8]);
    transcriptAlignmentsCallbacks = v9->_transcriptAlignmentsCallbacks;
    v9->_transcriptAlignmentsCallbacks = v26;

    v28 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E4F779A8]);
    lyricsCallbacks = v9->_lyricsCallbacks;
    v9->_lyricsCallbacks = v28;

    v30 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E4F779A8]);
    artworkCallbacks = v9->_artworkCallbacks;
    v9->_artworkCallbacks = v30;

    v32 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E4F779A8]);
    formattedArtworkCallbacks = v9->_formattedArtworkCallbacks;
    v9->_formattedArtworkCallbacks = v32;

    v34 = (MSVMultiCallback *)objc_alloc_init(MEMORY[0x1E4F779A8]);
    availableArtworkFormatsCallbacks = v9->_availableArtworkFormatsCallbacks;
    v9->_availableArtworkFormatsCallbacks = v34;
  }
  return v9;
}

uint64_t __49__MRNowPlayingPlayerClientCallbacks_capabilities__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_capabilities");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_onQueue_capabilities
{
  unint64_t v3 = 8 * ([(MSVMultiCallback *)self->_createPlaybackQueueForRequestCallbacks count] != 0);
  if (self->_createItemToken) {
    goto LABEL_2;
  }
  if ([(MSVMultiCallback *)self->_createItemForOffsetCallbacks count]) {
    goto LABEL_5;
  }
  if (self->_createItemToken)
  {
LABEL_2:
    if ((unint64_t)[(MSVMultiCallback *)self->_createItemForOffsetCallbacks count] < 2) {
      goto LABEL_6;
    }
LABEL_5:
    v3 |= 2uLL;
  }
LABEL_6:
  if (self->_createItemForIdentifierToken) {
    goto LABEL_7;
  }
  if (![(MSVMultiCallback *)self->_createItemForIdentifierCallbacks count])
  {
    if (!self->_createItemForIdentifierToken) {
      return v3;
    }
LABEL_7:
    if ((unint64_t)[(MSVMultiCallback *)self->_createItemForIdentifierCallbacks count] < 2) {
      return v3;
    }
  }
  v3 |= 4uLL;
  return v3;
}

uint64_t __64__MRNowPlayingPlayerClientCallbacks_setPlaybackSessionCallback___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 96) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __78__MRNowPlayingPlayerClientCallbacks_setPlaybackSessionMigrateRequestCallback___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 120) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)setPlaybackSessionCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (MSVMultiCallback)formattedArtworkCallbacks
{
  return self->_formattedArtworkCallbacks;
}

- (MSVMultiCallback)createChildItemCallbacks
{
  return self->_createChildItemCallbacks;
}

- (MSVMultiCallback)transcriptAlignmentsCallbacks
{
  return self->_transcriptAlignmentsCallbacks;
}

- (MSVMultiCallback)infoCallbacks
{
  return self->_infoCallbacks;
}

- (MSVMultiCallback)lyricsCallbacks
{
  return self->_lyricsCallbacks;
}

- (MSVMultiCallback)artworkCallbacks
{
  return self->_artworkCallbacks;
}

- (unint64_t)capabilities
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__MRNowPlayingPlayerClientCallbacks_capabilities__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (MSVMultiCallback)metadataCallbacks
{
  return self->_metadataCallbacks;
}

void __67__MRNowPlayingPlayerClientCallbacks_addCommandHandlerBlock_forKey___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 160);
  id v3 = (id)[*(id *)(a1 + 48) copy];
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];
}

- (void)addCommandHandlerBlock:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MRNowPlayingPlayerClientCallbacks_addCommandHandlerBlock_forKey___block_invoke;
  block[3] = &unk_1E57D13A8;
  id v12 = v7;
  id v13 = v6;
  block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(serialQueue, block);
}

uint64_t __76__MRNowPlayingPlayerClientCallbacks_setPlaybackSessionMigrateBeginCallback___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 104) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __74__MRNowPlayingPlayerClientCallbacks_setPlaybackSessionMigrateEndCallback___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 112) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)setPlaybackSessionMigrateEndCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)setPlaybackSessionMigrateBeginCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (id)videoThumbnailsCallback
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__32;
  uint64_t v8 = __Block_byref_object_dispose__32;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __60__MRNowPlayingPlayerClientCallbacks_videoThumbnailsCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setVideoThumbnailsCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

uint64_t __64__MRNowPlayingPlayerClientCallbacks_setVideoThumbnailsCallback___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 144) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (id)audioAmplitudeSamplesCallback
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__32;
  uint64_t v8 = __Block_byref_object_dispose__32;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  uint64_t v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __66__MRNowPlayingPlayerClientCallbacks_audioAmplitudeSamplesCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 152));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setAudioAmplitudeSamplesCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

uint64_t __70__MRNowPlayingPlayerClientCallbacks_setAudioAmplitudeSamplesCallback___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 152) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (id)playbackSessionCallback
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__32;
  uint64_t v8 = __Block_byref_object_dispose__32;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  uint64_t v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __60__MRNowPlayingPlayerClientCallbacks_playbackSessionCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 96));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)playbackSessionMigrateBeginCallback
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__32;
  uint64_t v8 = __Block_byref_object_dispose__32;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  uint64_t v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __72__MRNowPlayingPlayerClientCallbacks_playbackSessionMigrateBeginCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 104));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)playbackSessionMigrateEndCallback
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__32;
  uint64_t v8 = __Block_byref_object_dispose__32;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  uint64_t v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __70__MRNowPlayingPlayerClientCallbacks_playbackSessionMigrateEndCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 112));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)playbackSessionMigrateRequestCallback
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__32;
  uint64_t v8 = __Block_byref_object_dispose__32;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  uint64_t v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __74__MRNowPlayingPlayerClientCallbacks_playbackSessionMigrateRequestCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 120));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)endLyricsEventCallback
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__32;
  uint64_t v8 = __Block_byref_object_dispose__32;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  uint64_t v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __59__MRNowPlayingPlayerClientCallbacks_endLyricsEventCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 136));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setBeginLyricsEventCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

uint64_t __65__MRNowPlayingPlayerClientCallbacks_setBeginLyricsEventCallback___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 136) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (id)beginLyricsEventCallback
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__32;
  uint64_t v8 = __Block_byref_object_dispose__32;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  uint64_t v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __61__MRNowPlayingPlayerClientCallbacks_beginLyricsEventCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 128));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setEndLyricsEventCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

uint64_t __63__MRNowPlayingPlayerClientCallbacks_setEndLyricsEventCallback___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 128) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)hasPlaybackQueueCallbacks
{
  id v3 = +[MRNowPlayingOriginClientManager sharedManager];
  id v4 = [v3 originClientForPlayerPath:self->_playerPath];

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  BOOL v11 = 0;
  id v5 = [v4 playbackQueueCallback];
  BOOL v6 = v5 != 0;

  BOOL v11 = v6;
  msv_dispatch_sync_on_queue();
  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

uint64_t __62__MRNowPlayingPlayerClientCallbacks_hasPlaybackQueueCallbacks__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    BOOL v2 = 1;
  }
  else
  {
    uint64_t v3 = result;
    uint64_t result = objc_msgSend(*(id *)(result + 32), "_onQueue_capabilities");
    BOOL v2 = result != 0;
    uint64_t v1 = *(void *)(*(void *)(v3 + 40) + 8);
  }
  *(unsigned char *)(v1 + 24) = v2;
  return result;
}

- (void)removeCommandHandlerBlockForKey:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__MRNowPlayingPlayerClientCallbacks_removeCommandHandlerBlockForKey___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __69__MRNowPlayingPlayerClientCallbacks_removeCommandHandlerBlockForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) removeObjectForKey:*(void *)(a1 + 40)];
}

- (NSArray)commandHandlerBlocks
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__21;
  uint64_t v10 = __Block_byref_object_dispose__22;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__MRNowPlayingPlayerClientCallbacks_commandHandlerBlocks__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __57__MRNowPlayingPlayerClientCallbacks_commandHandlerBlocks__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 160) allValues];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)registerNowPlayingInfoBackedPlaybackQueueDataSourceCallbacks
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaRemote.PlaybackQueueNowPlayingInfo.serialQueue", 0);
  [(MRNowPlayingPlayerClientCallbacks *)self registerNowPlayingInfoCallbacks:v3];
  [(MRNowPlayingPlayerClientCallbacks *)self registerNowPlayingInfoAssetCallbacks:v3];
  [(MRNowPlayingPlayerClientCallbacks *)self registerNowPlayingInfoArtworkAssetCallback:v3];
}

- (void)registerNowPlayingInfoCallbacks:(id)a3
{
  id v4 = a3;
  if (!self->_createItemToken)
  {
    objc_initWeak(&location, self);
    createItemForOffsetCallbacks = self->_createItemForOffsetCallbacks;
    uint64_t v6 = (void *)MEMORY[0x1E4F77978];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__MRNowPlayingPlayerClientCallbacks_registerNowPlayingInfoCallbacks___block_invoke;
    v19[3] = &unk_1E57D75B0;
    objc_copyWeak(&v20, &location);
    id v7 = (void *)MEMORY[0x1997190F0](v19);
    uint64_t v8 = [v6 callbackWithQueue:v4 block:v7];
    id v9 = (MSVMultiCallback *)MRMediaRemotePlaybackQueueDataSourceSourceAddCallbackToList(createItemForOffsetCallbacks, 2, v8);
    createItemToken = self->_createItemToken;
    self->_createItemToken = v9;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  if (!self->_createItemForIdentifierToken)
  {
    objc_initWeak(&location, self);
    createItemForIdentifierCallbacks = self->_createItemForIdentifierCallbacks;
    id v12 = (void *)MEMORY[0x1E4F77978];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __69__MRNowPlayingPlayerClientCallbacks_registerNowPlayingInfoCallbacks___block_invoke_2;
    v17[3] = &unk_1E57D75D8;
    objc_copyWeak(&v18, &location);
    id v13 = (void *)MEMORY[0x1997190F0](v17);
    v14 = [v12 callbackWithQueue:v4 block:v13];
    v15 = (MSVMultiCallback *)MRMediaRemotePlaybackQueueDataSourceSourceAddCallbackToList(createItemForIdentifierCallbacks, 2, v14);
    createItemForIdentifierToken = self->_createItemForIdentifierToken;
    self->_createItemForIdentifierToken = v15;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

uint64_t __69__MRNowPlayingPlayerClientCallbacks_registerNowPlayingInfoCallbacks___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  uint64_t v5 = 0;
  if (!a2 && WeakRetained)
  {
    uint64_t v6 = +[MRNowPlayingOriginClientManager sharedManager];
    id v7 = [v4 playerPath];
    uint64_t v8 = [v6 playerClientForPlayerPath:v7];

    id v9 = [v8 nowPlayingInfo];
    if (v9)
    {
      uint64_t v10 = +[MRContentItem extractedIdentifierFromNowPlayingInfo:v9];
      uint64_t v5 = MRContentItemCreate(*MEMORY[0x1E4F1CF80], (uint64_t)v10);
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

uint64_t __69__MRNowPlayingPlayerClientCallbacks_registerNowPlayingInfoCallbacks___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  uint64_t v5 = 0;
  if (a2 && WeakRetained)
  {
    uint64_t v6 = +[MRNowPlayingOriginClientManager sharedManager];
    id v7 = [v4 playerPath];
    uint64_t v8 = [v6 playerClientForPlayerPath:v7];

    id v9 = [v8 nowPlayingInfo];
    if (v9)
    {
      uint64_t v10 = +[MRContentItem extractedIdentifierFromNowPlayingInfo:v9];
      if ([v10 isEqualToString:a2]) {
        uint64_t v5 = MRContentItemCreate(*MEMORY[0x1E4F1CF80], a2);
      }
      else {
        uint64_t v5 = 0;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

- (void)registerNowPlayingInfoAssetCallbacks:(id)a3
{
  id v4 = a3;
  if (!self->_metadataToken || !self->_languageToken)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = (void *)MEMORY[0x1E4F77978];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __74__MRNowPlayingPlayerClientCallbacks_registerNowPlayingInfoAssetCallbacks___block_invoke;
    v15 = &unk_1E57D7600;
    objc_copyWeak(&v16, &location);
    uint64_t v6 = (void *)MEMORY[0x1997190F0](&v12);
    id v7 = objc_msgSend(v5, "callbackWithQueue:block:", v4, v6, v12, v13, v14, v15);

    if (!self->_metadataToken)
    {
      uint64_t v8 = (MSVMultiCallback *)MRMediaRemotePlaybackQueueDataSourceSourceAddCallbackToList(self->_metadataCallbacks, 2, v7);
      metadataToken = self->_metadataToken;
      self->_metadataToken = v8;
    }
    if (!self->_languageToken)
    {
      uint64_t v10 = (MSVMultiCallback *)MRMediaRemotePlaybackQueueDataSourceSourceAddCallbackToList(self->_languageOptionsCallbacks, 2, v7);
      languageToken = self->_languageToken;
      self->_languageToken = v10;
    }
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __74__MRNowPlayingPlayerClientCallbacks_registerNowPlayingInfoAssetCallbacks___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v11 = +[MRNowPlayingOriginClientManager sharedManager];
    uint64_t v12 = [WeakRetained playerPath];
    uint64_t v13 = [v11 playerClientForPlayerPath:v12];

    v14 = [v13 nowPlayingInfo];
    if (v14)
    {
      v15 = +[MRContentItem extractedIdentifierFromNowPlayingInfo:v14];
      id v16 = [v8 identifier];
      if ([v15 isEqualToString:v16])
      {
        v17 = [v13 nowPlayingArtwork];

        if (v17) {
          MRContentItemSetHasArtworkData(v8, 1);
        }
        [v8 setNowPlayingInfo:v14 policy:0 request:v7];
        id Error = 0;
      }
      else
      {
        id Error = (id)MRMediaRemoteCreateError(15);
      }
    }
    else
    {
      id Error = 0;
    }

    uint64_t v18 = (uint64_t)Error;
  }
  else
  {
    uint64_t v18 = MRMediaRemoteCreateError(4);
  }
  id v20 = (id)v18;
  v9[2](v9);
}

- (void)registerNowPlayingInfoArtworkAssetCallback:(id)a3
{
  id v4 = a3;
  if (!self->_artworkToken)
  {
    objc_initWeak(&location, self);
    artworkCallbacks = self->_artworkCallbacks;
    uint64_t v6 = (void *)MEMORY[0x1E4F77978];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __80__MRNowPlayingPlayerClientCallbacks_registerNowPlayingInfoArtworkAssetCallback___block_invoke;
    v14 = &unk_1E57D7600;
    objc_copyWeak(&v15, &location);
    id v7 = (void *)MEMORY[0x1997190F0](&v11);
    id v8 = objc_msgSend(v6, "callbackWithQueue:block:", v4, v7, v11, v12, v13, v14);
    id v9 = (MSVMultiCallback *)MRMediaRemotePlaybackQueueDataSourceSourceAddCallbackToList(artworkCallbacks, 2, v8);
    artworkToken = self->_artworkToken;
    self->_artworkToken = v9;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __80__MRNowPlayingPlayerClientCallbacks_registerNowPlayingInfoArtworkAssetCallback___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = (id *)(a1 + 32);
  uint64_t v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  if (WeakRetained)
  {
    id v8 = +[MRNowPlayingOriginClientManager sharedManager];
    id v9 = [WeakRetained playerPath];
    uint64_t v10 = [v8 playerClientForPlayerPath:v9];

    uint64_t v11 = [v10 nowPlayingArtwork];
    uint64_t v12 = [v10 nowPlayingInfo];
    uint64_t v13 = +[MRContentItem extractedIdentifierFromNowPlayingInfo:v12];
    v14 = MRContentItemGetIdentifier(a3);
    if ([v13 isEqualToString:v14])
    {
      id v20 = v13;
      id v21 = (id)[v11 copyImageData];
      MRContentItemSetArtworkData(a3, (uint64_t)v21);
      id v15 = [v12 objectForKey:@"kMRMediaRemoteNowPlayingInfoArtworkDataWidth"];
      uint64_t v16 = [v15 longValue];
      v17 = [v12 objectForKey:@"kMRMediaRemoteNowPlayingInfoArtworkDataHeight"];
      MRContentItemSetArtworkDataSize(a3, v16, [v17 longValue]);

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = [v11 mimeType];
        MRContentItemSetArtworkMIMEType(a3, v18);
      }
      id Error = 0;
      uint64_t v13 = v20;
    }
    else
    {
      id Error = (id)MRMediaRemoteCreateError(15);
    }

    uint64_t v19 = (uint64_t)Error;
  }
  else
  {
    uint64_t v19 = MRMediaRemoteCreateError(4);
  }
  id v23 = (id)v19;
  v6[2](v6);
}

- (BOOL)removePlaybackQueueDataSourceCallback:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__MRNowPlayingPlayerClientCallbacks_removePlaybackQueueDataSourceCallback___block_invoke;
  block[3] = &unk_1E57D7628;
  id v9 = v4;
  uint64_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

uint64_t __75__MRNowPlayingPlayerClientCallbacks_removePlaybackQueueDataSourceCallback___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) hasPlaybackQueueCallbacks];
  if (([*(id *)(*(void *)(a1 + 32) + 16) removeCallback:*(void *)(a1 + 40)] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 32) removeCallback:*(void *)(a1 + 40)] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 24) removeCallback:*(void *)(a1 + 40)] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 40) removeCallback:*(void *)(a1 + 40)] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 48) removeCallback:*(void *)(a1 + 40)] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 64) removeCallback:*(void *)(a1 + 40)] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 72) removeCallback:*(void *)(a1 + 40)] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 56) removeCallback:*(void *)(a1 + 40)] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 80) removeCallback:*(void *)(a1 + 40)] & 1) != 0)
  {
    char v2 = 1;
  }
  else
  {
    char v2 = [*(id *)(*(void *)(a1 + 32) + 88) removeCallback:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2;
  dispatch_queue_t v3 = *(void **)(a1 + 32);

  return [v3 hasPlaybackQueueCallbacks];
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableArtworkFormatsCallbacks, 0);
  objc_storeStrong((id *)&self->_formattedArtworkCallbacks, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_artworkToken, 0);
  objc_storeStrong((id *)&self->_languageToken, 0);
  objc_storeStrong((id *)&self->_metadataToken, 0);
  objc_storeStrong((id *)&self->_createItemForIdentifierToken, 0);
  objc_storeStrong((id *)&self->_createItemToken, 0);
  objc_storeStrong((id *)&self->_commandHandlerBlocks, 0);
  objc_storeStrong(&self->_audioAmplitudeSamplesCallback, 0);
  objc_storeStrong(&self->_videoThumbnailsCallback, 0);
  objc_storeStrong(&self->_endLyricsEventCallback, 0);
  objc_storeStrong(&self->_beginLyricsEventCallback, 0);
  objc_storeStrong(&self->_playbackSessionMigrateRequestCallback, 0);
  objc_storeStrong(&self->_playbackSessionMigrateEndCallback, 0);
  objc_storeStrong(&self->_playbackSessionMigrateBeginCallback, 0);
  objc_storeStrong(&self->_playbackSessionCallback, 0);
  objc_storeStrong((id *)&self->_artworkCallbacks, 0);
  objc_storeStrong((id *)&self->_lyricsCallbacks, 0);
  objc_storeStrong((id *)&self->_transcriptAlignmentsCallbacks, 0);
  objc_storeStrong((id *)&self->_infoCallbacks, 0);
  objc_storeStrong((id *)&self->_languageOptionsCallbacks, 0);
  objc_storeStrong((id *)&self->_metadataCallbacks, 0);
  objc_storeStrong((id *)&self->_createChildItemCallbacks, 0);
  objc_storeStrong((id *)&self->_createItemForIdentifierCallbacks, 0);
  objc_storeStrong((id *)&self->_createItemForOffsetCallbacks, 0);
  objc_storeStrong((id *)&self->_createPlaybackQueueForRequestCallbacks, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end