@interface TVPMediaItemLoader
+ (id)loaderForMediaItem:(id)a3;
+ (id)tempDirURL;
+ (void)initialize;
+ (void)removeTemporaryDownloadDirectory;
- (AVURLAsset)AVAsset;
- (AVURLAsset)AVAssetInternal;
- (AVURLAsset)existingAVAsset;
- (BOOL)_needToLoadBlockingMetadataKeys;
- (BOOL)allowsCellularUsage;
- (BOOL)allowsConstrainedNetworkUsage;
- (BOOL)cleanedUp;
- (BOOL)containsStreamingAVAsset;
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (NSError)error;
- (NSString)description;
- (NSString)mediaItemLoaderGUID;
- (NSString)state;
- (NSTimer)diskSpaceMonitorTimer;
- (OS_dispatch_queue)assetInternalAccessQueue;
- (OS_dispatch_queue)assetLoadContextAccessQueue;
- (TVPContentKeySession)contentKeySession;
- (TVPMediaItem)mediaItem;
- (TVPMediaItemLoader)initWithMediaItem:(id)a3;
- (TVPMediaItemTimingData)timingData;
- (TVPStateMachine)stateMachine;
- (id)_advisoryInfoFromMetadata:(id)a3 keyIdentifierMap:(id)a4 withTotalCount:(unint64_t)a5;
- (id)_advisoryKeyNamesWithCount:(unint64_t)a3;
- (id)_avAssetOptions;
- (id)_contentKeyLoader;
- (id)_contentKeyRequestParamsFromBase64String:(id)a3;
- (id)_metadataKeysToLoad;
- (id)_numberValueForKey:(id)a3 fromMetadata:(id)a4 andKeyIdentifierMap:(id)a5;
- (id)_productPlacementInfoFromMetadata:(id)a3 keyIdentifierMap:(id)a4;
- (id)_promoInfoFromMetadata:(id)a3 keyIdentifierMap:(id)a4 forSkipKey:(id)a5 skipCounter:(unint64_t)a6;
- (id)_rollInfoFromMetadata:(id)a3 keyIdentifierMap:(id)a4 forType:(unint64_t)a5 withTotalCount:(unint64_t)a6;
- (id)_rollKeyNameFromType:(unint64_t)a3;
- (id)_rollKeyNamesForType:(unint64_t)a3 withCount:(unint64_t)a4;
- (id)_skipInfoFromMetadata:(id)a3 keyIdentifierMap:(id)a4 forType:(unint64_t)a5 withTotalCount:(unint64_t)a6;
- (id)_skipKeyNameFromType:(unint64_t)a3;
- (id)_skipKeyNamesForType:(unint64_t)a3 withCount:(unint64_t)a4;
- (id)_stringValueForKey:(id)a3 fromMetadata:(id)a4 andKeyIdentifierMap:(id)a5;
- (id)_tomatoFreshnessFromString:(id)a3;
- (id)newPlayerItem;
- (unint64_t)_rollTypeFromMetadataItemKey:(id)a3;
- (unint64_t)_skipTypeFromMetadataItemKey:(id)a3;
- (unint64_t)assetLoadContext;
- (unint64_t)refCount;
- (void)_avAudioSessionMediaServicesWereReset:(id)a3;
- (void)_cleanUp;
- (void)_loadMediaItemMetadataAsynchronously;
- (void)_mediaItemPlaybackErrorDidOccur:(id)a3;
- (void)_mediaItemStopPlayback:(id)a3;
- (void)_onAssetInternalAccessQueue_updateContentKeySessionWithContentKeyLoader:(id)a3;
- (void)_registerStateMachineHandlers;
- (void)cleanupIfNecessary;
- (void)dealloc;
- (void)loadIfNecessary;
- (void)loadSHA1DigestWithCompletion:(id)a3;
- (void)prepareForPlaybackInitiation;
- (void)setAVAsset:(id)a3;
- (void)setAVAssetInternal:(id)a3;
- (void)setAllowsCellularUsage:(BOOL)a3;
- (void)setAllowsConstrainedNetworkUsage:(BOOL)a3;
- (void)setAssetInternalAccessQueue:(id)a3;
- (void)setAssetLoadContext:(unint64_t)a3;
- (void)setAssetLoadContextAccessQueue:(id)a3;
- (void)setCleanedUp:(BOOL)a3;
- (void)setContentKeySession:(id)a3;
- (void)setDiskSpaceMonitorTimer:(id)a3;
- (void)setError:(id)a3;
- (void)setExistingAVAsset:(id)a3;
- (void)setMediaItem:(id)a3;
- (void)setMediaItemLoaderGUID:(id)a3;
- (void)setRefCount:(unint64_t)a3;
- (void)setState:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setTimingData:(id)a3;
@end

@implementation TVPMediaItemLoader

+ (void)removeTemporaryDownloadDirectory
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_236FC5000, v0, v1, "Error deleting directory at %@: %@");
}

+ (id)tempDirURL
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = [v2 URLsForDirectory:13 inDomains:1];
  v4 = [v3 firstObject];
  v5 = [v4 URLByAppendingPathComponent:@"com.apple.TVPlayback" isDirectory:1];

  return v5;
}

+ (void)initialize
{
  if (initialize_onceToken_9 != -1) {
    dispatch_once(&initialize_onceToken_9, &__block_literal_global_18);
  }
}

uint64_t __32__TVPMediaItemLoader_initialize__block_invoke()
{
  sMediaItemLoaderLogObject = (uint64_t)os_log_create("com.apple.AppleTV.playback", "TVPMediaItemLoader");
  return MEMORY[0x270F9A758]();
}

+ (id)loaderForMediaItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if (loaderForMediaItem__onceToken != -1)
  {
    dispatch_once(&loaderForMediaItem__onceToken, &__block_literal_global_68);
    if (v4) {
      goto LABEL_3;
    }
LABEL_15:
    id v13 = 0;
    goto LABEL_16;
  }
  if (!v3) {
    goto LABEL_15;
  }
LABEL_3:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend((id)sLoaderHashTable, "allObjects", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      v11 = [v10 mediaItem];
      char v12 = [v11 isEqualToMediaItem:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v13 = v10;

    if (v13) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_11:
  }
  id v13 = (id)[objc_alloc((Class)objc_opt_class()) initWithMediaItem:v4];
  [(id)sLoaderHashTable addObject:v13];
LABEL_16:

  return v13;
}

uint64_t __41__TVPMediaItemLoader_loaderForMediaItem___block_invoke()
{
  sLoaderHashTable = [MEMORY[0x263F088B0] weakObjectsHashTable];
  return MEMORY[0x270F9A758]();
}

- (TVPMediaItemLoader)initWithMediaItem:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)TVPMediaItemLoader;
  uint64_t v6 = [(TVPMediaItemLoader *)&v30 init];
  if (v6)
  {
    uint64_t v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = initWithMediaItem__instanceNumber++;
    v10 = [v7 stringWithFormat:@"%@ %ld (%@)", v8, v9, v5];
    objc_initWeak(&location, v6);
    objc_storeStrong((id *)v6 + 2, a3);
    v11 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = @"Cleaned up";

    *(_WORD *)(v6 + 9) = 257;
    id v12 = objc_alloc_init(MEMORY[0x263F08C38]);
    id v13 = [v12 UUIDString];
    uint64_t v14 = [v13 copy];
    long long v15 = (void *)*((void *)v6 + 15);
    *((void *)v6 + 15) = v14;

    dispatch_queue_t v16 = dispatch_queue_create("AVAssetInternal access queue", 0);
    long long v17 = (void *)*((void *)v6 + 11);
    *((void *)v6 + 11) = v16;

    dispatch_queue_t v18 = dispatch_queue_create("assetLoadContext access queue", 0);
    v19 = (void *)*((void *)v6 + 12);
    *((void *)v6 + 12) = v18;

    uint64_t v20 = [TVPStateMachine alloc];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __40__TVPMediaItemLoader_initWithMediaItem___block_invoke;
    v27[3] = &unk_264CC5228;
    objc_copyWeak(&v28, &location);
    uint64_t v21 = [(TVPStateMachine *)v20 initWithName:v10 initialState:@"Cleaned up" mode:0 stateChangeHandler:v27];
    v22 = (void *)*((void *)v6 + 9);
    *((void *)v6 + 9) = v21;

    v23 = [MEMORY[0x263F087C8] defaultCenter];
    [v23 addObserver:v6 selector:sel__stopBackgroundCaching_ name:@"com.apple.TVPMediaItemLoader.TVPMediaItemLoaderStopBackgroundCaching" object:0 suspensionBehavior:4];

    v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 addObserver:v6 selector:sel__mediaItemPlaybackErrorDidOccur_ name:@"TVPMediaItemPlaybackErrorDidOccurNotification" object:v5];

    v25 = [MEMORY[0x263F08A00] defaultCenter];
    [v25 addObserver:v6 selector:sel__mediaItemStopPlayback_ name:@"TVPMediaItemStopPlaybackNotification" object:v5];

    [*((id *)v6 + 9) setCallsStateChangeHandlerSynchronously:1];
    [*((id *)v6 + 9) setLogObject:sMediaItemLoaderLogObject];
    [v6 _registerStateMachineHandlers];
    [*((id *)v6 + 9) setShouldAcceptEvents:1];
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return (TVPMediaItemLoader *)v6;
}

void __40__TVPMediaItemLoader_initWithMediaItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = (void *)sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v9 = [WeakRetained error];
    id v10 = objc_loadWeakRetained((id *)(a1 + 32));
    v11 = [v10 AVAsset];
    int v13 = 138412802;
    id v14 = v5;
    __int16 v15 = 2112;
    dispatch_queue_t v16 = v9;
    __int16 v17 = 2112;
    dispatch_queue_t v18 = v11;
    _os_log_impl(&dword_236FC5000, v7, OS_LOG_TYPE_INFO, "State did change to %@.  error property is %@, AVAsset property is %@", (uint8_t *)&v13, 0x20u);
  }
  id v12 = objc_loadWeakRetained((id *)(a1 + 32));
  [v12 setState:v5];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  [(TVPMediaItemLoader *)self _cleanUp];
  [(TVPStateMachine *)self->_stateMachine deregisterHandlers];
  v5.receiver = self;
  v5.super_class = (Class)TVPMediaItemLoader;
  [(TVPMediaItemLoader *)&v5 dealloc];
}

- (void)loadIfNecessary
{
  unint64_t v3 = [(TVPMediaItemLoader *)self refCount];
  [(TVPMediaItemLoader *)self setRefCount:v3 + 1];
  if (!v3)
  {
    id v4 = [(TVPMediaItemLoader *)self stateMachine];
    [v4 postEvent:@"Load"];
  }
}

- (void)cleanupIfNecessary
{
  if ([(TVPMediaItemLoader *)self refCount])
  {
    [(TVPMediaItemLoader *)self setRefCount:[(TVPMediaItemLoader *)self refCount] - 1];
    if (![(TVPMediaItemLoader *)self refCount])
    {
      id v3 = [(TVPMediaItemLoader *)self stateMachine];
      [v3 postEvent:@"Clean up"];
    }
  }
}

- (void)prepareForPlaybackInitiation
{
  id v2 = [(TVPMediaItemLoader *)self stateMachine];
  [v2 postEvent:@"Prepare for playback initiation"];
}

- (NSString)description
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__3;
  __int16 v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  id v3 = [(TVPMediaItemLoader *)self assetInternalAccessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__TVPMediaItemLoader_description__block_invoke;
  block[3] = &unk_264CC7048;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(v3, block);

  id v4 = NSString;
  objc_super v5 = [(TVPMediaItemLoader *)self mediaItem];
  uint64_t v6 = v12[5];
  uint64_t v7 = [(TVPMediaItemLoader *)self state];
  uint64_t v8 = [v4 stringWithFormat:@"TVPMediaItem: %@ AVAsset: %@ State: %@", v5, v6, v7];

  _Block_object_dispose(&v11, 8);
  return (NSString *)v8;
}

uint64_t __33__TVPMediaItemLoader_description__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) AVAssetInternal];
  return MEMORY[0x270F9A758]();
}

- (AVURLAsset)AVAsset
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__3;
  uint64_t v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  id v3 = [(TVPMediaItemLoader *)self stateMachine];
  id v4 = [v3 currentState];

  if (([v4 isEqualToString:@"AVAsset keys loaded"] & 1) != 0
    || ([v4 isEqualToString:@"Preparing for playback initiation"] & 1) != 0
    || [v4 isEqualToString:@"Ready for playback"])
  {
    objc_super v5 = [(TVPMediaItemLoader *)self assetInternalAccessQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __29__TVPMediaItemLoader_AVAsset__block_invoke;
    v8[3] = &unk_264CC7048;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v5, v8);
  }
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return (AVURLAsset *)v6;
}

uint64_t __29__TVPMediaItemLoader_AVAsset__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) AVAssetInternal];
  return MEMORY[0x270F9A758]();
}

- (TVPContentKeySession)contentKeySession
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__3;
  __int16 v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  id v3 = [(TVPMediaItemLoader *)self _contentKeyLoader];
  id v4 = [(TVPMediaItemLoader *)self assetInternalAccessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__TVPMediaItemLoader_contentKeySession__block_invoke;
  block[3] = &unk_264CC7070;
  block[4] = self;
  id v9 = v3;
  id v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, block);

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (TVPContentKeySession *)v6;
}

void __39__TVPMediaItemLoader_contentKeySession__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onAssetInternalAccessQueue_updateContentKeySessionWithContentKeyLoader:", *(void *)(a1 + 40));
  id v2 = *(void **)(*(void *)(a1 + 32) + 64);
  id v3 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (BOOL)containsStreamingAVAsset
{
  id v3 = [(TVPMediaItemLoader *)self stateMachine];
  id v4 = [v3 currentState];

  if (([v4 isEqualToString:@"AVAsset keys loaded"] & 1) != 0
    || ([v4 isEqualToString:@"Preparing for playback initiation"] & 1) != 0
    || [v4 isEqualToString:@"Ready for playback"])
  {
    id v5 = [(TVPMediaItemLoader *)self AVAsset];
    char v6 = [v5 _isStreaming];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)newPlayerItem
{
  id v3 = [(TVPMediaItemLoader *)self stateMachine];
  id v4 = [v3 currentState];

  if (([v4 isEqualToString:@"AVAsset keys loaded"] & 1) == 0
    && ([v4 isEqualToString:@"Preparing for playback initiation"] & 1) == 0
    && ![v4 isEqualToString:@"Ready for playback"])
  {
    char v6 = 0;
    goto LABEL_42;
  }
  v40 = v4;
  id v5 = [(TVPMediaItemLoader *)self AVAsset];
  char v6 = [[TVPPlayerItem alloc] initWithAsset:v5];
  [(TVPPlayerItem *)v6 setMediaItemLoader:self];
  uint64_t v7 = [(TVPMediaItemLoader *)self mediaItem];
  [(TVPPlayerItem *)v6 setContinuesPlayingDuringPrerollForSeek:0];
  if ([v7 hasTrait:@"TVPMediaItemTraitMinimizeNetworkUsageWhilePaused"]) {
    [(TVPPlayerItem *)v6 setPreferredForwardBufferDuration:50.0];
  }
  if (![(TVPMediaItemLoader *)self containsStreamingAVAsset])
  {
    uint64_t v8 = [v5 tracksWithMediaType:*MEMORY[0x263EF9D48]];
    uint64_t v9 = [v8 count];

    if (!v9) {
      [(TVPPlayerItem *)v6 setPlaybackLikelyToKeepUpTrigger:1];
    }
  }
  id v10 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataForwardPlaybackEndTime"];
  uint64_t v11 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataReversePlaybackEndTime"];
  if (v10)
  {
    memset(&v44, 0, sizeof(v44));
    [v10 doubleValue];
    CMTimeMakeWithSeconds(&v44, v12, 1000000);
    CMTime v43 = v44;
    [(TVPPlayerItem *)v6 setForwardPlaybackEndTime:&v43];
  }
  if (v11)
  {
    memset(&v44, 0, sizeof(v44));
    [v11 doubleValue];
    CMTimeMakeWithSeconds(&v44, v13, 1000000);
    CMTime v43 = v44;
    [(TVPPlayerItem *)v6 setReversePlaybackEndTime:&v43];
  }
  v38 = v10;
  id v14 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataAutomaticallyHandlesInterstitialEvents"];
  __int16 v15 = v14;
  if (v14) {
    -[TVPPlayerItem setAutomaticallyHandlesInterstitialEvents:](v6, "setAutomaticallyHandlesInterstitialEvents:", [v14 BOOLValue]);
  }
  v36 = v15;
  CFDictionaryRef v16 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataTimeToPauseBuffering"];
  CFDictionaryRef v17 = v16;
  if (v16)
  {
    CMTimeMakeFromDictionary(&v42, v16);
    [(TVPPlayerItem *)v6 setTimeToPauseBuffering:&v42];
  }
  CFDictionaryRef v18 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataTimeToPausePlayback"];

  if (v18)
  {
    CMTimeMakeFromDictionary(&v41, v18);
    [(TVPPlayerItem *)v6 setTimeToPausePlayback:&v41];
  }
  uint64_t v19 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataDateRangeCollector"];
  if (v19)
  {
    [(TVPPlayerItem *)v6 addMediaDataCollector:v19];
    [v7 removeMediaItemMetadataForProperty:@"TVPMediaItemMetadataDateRangeCollector"];
  }
  v34 = (void *)v19;
  CFDictionaryRef v35 = v18;
  v37 = v11;
  v39 = v5;
  uint64_t v20 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataWebVTTStyles"];
  if (v20)
  {
    uint64_t v21 = [MEMORY[0x263EFA8B0] textStyleRulesFromPropertyList:v20];
    [(TVPPlayerItem *)v6 setTextStyleRules:v21];
  }
  id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v23 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataGaplessHeuristicInfo"];
  v24 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataGaplessEncodingDelayInFrames"];
  v25 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataGaplessEncodingDrainInFrames"];
  v26 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataGaplessDurationInFrames"];
  v27 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataGaplessLastPacketsResync"];
  if (v23) {
    [v22 setObject:v23 forKey:*MEMORY[0x263EFA080]];
  }
  if (v24) {
    [v22 setObject:v24 forKey:*MEMORY[0x263EFA070]];
  }
  if (v25) {
    [v22 setObject:v25 forKey:*MEMORY[0x263EFA078]];
  }
  if (v26) {
    [v22 setObject:v26 forKey:*MEMORY[0x263EFA068]];
  }
  if (v27) {
    [v22 setObject:v27 forKey:*MEMORY[0x263EFA088]];
  }
  if ([v22 count]) {
    [(TVPPlayerItem *)v6 setGaplessInfo:v22];
  }
  id v28 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataMaxHLSVideoResolution"];
  v29 = v28;
  if (v28)
  {
    uint64_t v30 = [v28 integerValue];
    if (!v30)
    {
      double v31 = 576.0;
      double v32 = 1024.0;
      goto LABEL_40;
    }
    if (v30 == 1)
    {
      double v31 = 1080.0;
      double v32 = 1920.0;
LABEL_40:
      -[TVPPlayerItem setPreferredMaximumResolution:](v6, "setPreferredMaximumResolution:", v32, v31);
    }
  }
  [(TVPPlayerItem *)v6 setAllowedAudioSpatializationFormats:7];

  id v4 = v40;
LABEL_42:

  return v6;
}

- (void)loadSHA1DigestWithCompletion:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(TVPMediaItemLoader *)self stateMachine];
  char v6 = [v5 currentState];

  if (([v6 isEqualToString:@"AVAsset keys loaded"] & 1) != 0
    || ([v6 isEqualToString:@"Preparing for playback initiation"] & 1) != 0
    || [v6 isEqualToString:@"Ready for playback"])
  {
    uint64_t v7 = [(TVPMediaItemLoader *)self AVAssetInternal];
    v16[0] = @"SHA1Digest";
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __51__TVPMediaItemLoader_loadSHA1DigestWithCompletion___block_invoke;
    v12[3] = &unk_264CC69F0;
    id v13 = v7;
    id v14 = @"SHA1Digest";
    id v15 = v4;
    id v9 = v7;
    [v9 loadValuesAsynchronouslyForKeys:v8 completionHandler:v12];
  }
  else
  {
    if (!v4) {
      goto LABEL_6;
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__TVPMediaItemLoader_loadSHA1DigestWithCompletion___block_invoke_3;
    v10[3] = &unk_264CC55B0;
    id v11 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v10);
    id v9 = v11;
  }

LABEL_6:
}

void __51__TVPMediaItemLoader_loadSHA1DigestWithCompletion___block_invoke(id *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__TVPMediaItemLoader_loadSHA1DigestWithCompletion___block_invoke_2;
  block[3] = &unk_264CC69F0;
  id v3 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __51__TVPMediaItemLoader_loadSHA1DigestWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = 0;
  uint64_t v4 = [v2 statusOfValueForKey:v3 error:&v8];
  id v5 = v8;
  uint64_t v6 = *(void *)(a1 + 48);
  if (v4 == 2)
  {
    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) SHA1Digest];
      (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
    }
  }
  else if (v6)
  {
    (*(void (**)(void, void, id))(v6 + 16))(*(void *)(a1 + 48), 0, v5);
  }
}

uint64_t __51__TVPMediaItemLoader_loadSHA1DigestWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_registerStateMachineHandlers
{
  v50[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(TVPMediaItemLoader *)self stateMachine];
  objc_initWeak(&location, self);
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke;
  v46[3] = &unk_264CC7098;
  objc_copyWeak(&v47, &location);
  uint64_t v4 = (void *)MEMORY[0x237E144A0](v46);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2;
  v44[3] = &unk_264CC70C0;
  objc_copyWeak(&v45, &location);
  id v5 = (void *)MEMORY[0x237E144A0](v44);
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_106;
  v40[3] = &unk_264CC7160;
  objc_copyWeak(&v43, &location);
  id v6 = v3;
  id v41 = v6;
  id v16 = v5;
  id v42 = v16;
  uint64_t v7 = (void *)MEMORY[0x237E144A0](v40);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_163;
  v37[3] = &unk_264CC56A0;
  objc_copyWeak(&v39, &location);
  id v8 = v6;
  id v38 = v8;
  [v8 registerHandlerForEvent:@"Load" onState:@"Cleaned up" withBlock:v37];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_3_179;
  v33[3] = &unk_264CC6358;
  objc_copyWeak(&v36, &location);
  id v15 = v4;
  id v35 = v15;
  id v9 = v8;
  id v34 = v9;
  [v9 registerHandlerForEvent:@"Did finish preparing to load" onState:@"Preparing for loading" withBlock:v33];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_5;
  v31[3] = &unk_264CC56F0;
  id v10 = v7;
  id v32 = v10;
  [v9 registerHandlerForEvent:@"Disk space purge did complete" onState:@"Purging disk space during initial loading if necessary" withBlock:v31];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_6;
  v29[3] = &unk_264CC5650;
  objc_copyWeak(&v30, &location);
  [v9 registerHandlerForEvent:@"AVAsset keys did load successfully" onState:@"Loading AVAsset keys" withBlock:v29];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_8;
  v27[3] = &unk_264CC5650;
  objc_copyWeak(&v28, &location);
  [v9 registerHandlerForEvent:@"AVAsset metadata did load successfully" onState:@"Loading AVAsset keys" withBlock:v27];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_9;
  v24[3] = &unk_264CC56A0;
  objc_copyWeak(&v26, &location);
  id v11 = v9;
  id v25 = v11;
  [v11 registerHandlerForEvent:@"Prepare for playback initiation" onState:@"AVAsset keys loaded" withBlock:v24];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_184;
  v21[3] = &unk_264CC56A0;
  objc_copyWeak(&v23, &location);
  id v12 = v11;
  id v22 = v12;
  [v12 registerHandlerForEvent:@"Did finish preparing for playback initiation" onState:@"Preparing for playback initiation" withBlock:v21];
  v50[0] = @"Cleaned up";
  v50[1] = @"Failed";
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:2];
  [v12 registerHandlerForEvent:@"Failure" onStates:v13 withBlock:&__block_literal_global_188];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_5_189;
  v19[3] = &unk_264CC5650;
  objc_copyWeak(&v20, &location);
  [v12 registerDefaultHandlerForEvent:@"Failure" withBlock:v19];
  v49[0] = @"Cleaned up";
  v49[1] = @"Failed";
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:2];
  [v12 registerHandlerForEvent:@"Clean up" onStates:v14 withBlock:&__block_literal_global_192];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_193;
  v17[3] = &unk_264CC5650;
  objc_copyWeak(&v18, &location);
  [v12 registerDefaultHandlerForEvent:@"Clean up" withBlock:v17];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v39);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
}

__CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke(uint64_t a1)
{
  id v2 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Content will not be cached to disk; no purge necessary",
      buf,
      2u);
  }
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained stateMachine];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_102;
  v7[3] = &unk_264CC5600;
  objc_copyWeak(&v8, v3);
  [v5 executeBlockAfterCurrentStateTransition:v7];

  objc_destroyWeak(&v8);
  return @"Purging disk space during initial loading if necessary";
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_102(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained stateMachine];
  uint64_t v4 = @"success";
  v5[0] = MEMORY[0x263EFFA88];
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 postEvent:@"Disk space purge did complete" withContext:0 userInfo:v3];
}

id __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  os_log_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [(id)objc_opt_class() removeTemporaryDownloadDirectory];

  id v3 = objc_loadWeakRetained(v1);
  uint64_t v4 = [(id)objc_opt_class() tempDirURL];

  id v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [v4 URLByDeletingLastPathComponent];
  uint64_t v7 = [v6 path];
  id v26 = 0;
  id v8 = [v5 attributesOfFileSystemForPath:v7 error:&v26];
  id v9 = v26;

  if (v8)
  {
    id v10 = [v8 objectForKey:*MEMORY[0x263F080C8]];
    id v11 = objc_loadWeakRetained(v1);
    id v12 = [v11 mediaItem];
    id v13 = [v12 mediaItemMetadataForProperty:@"TVPMediaItemMetadataFileSize"];

    id v14 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v10;
      __int16 v29 = 2112;
      id v30 = v13;
      _os_log_impl(&dword_236FC5000, v14, OS_LOG_TYPE_DEFAULT, "Free space is %@, file size is %@", buf, 0x16u);
    }
    if (v10 && v13)
    {
      unint64_t v15 = [v10 unsignedLongLongValue];
      if (v15 > [v13 unsignedLongLongValue] + 524288000)
      {
        id v16 = [MEMORY[0x263F08850] defaultManager];
        id v25 = v9;
        int v17 = [v16 createDirectoryAtURL:v4 withIntermediateDirectories:0 attributes:0 error:&v25];
        id v18 = v25;

        if (v17)
        {
          id v19 = objc_loadWeakRetained(v1);
          id v20 = [v19 mediaItem];
          uint64_t v21 = [v20 mediaItemURL];

          id v22 = [v21 lastPathComponent];
          if ([v22 length])
          {
            id v23 = [v4 URLByAppendingPathComponent:v22 isDirectory:0];
          }
          else
          {
            if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR)) {
              __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_2();
            }
            id v23 = 0;
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR)) {
            __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_3();
          }
          id v23 = 0;
        }
        goto LABEL_18;
      }
      if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR)) {
        __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_4();
      }
    }
    else if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
    {
      __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_5();
    }
    id v23 = 0;
    id v18 = v9;
LABEL_18:

    id v9 = v18;
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR)) {
    __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_1();
  }
  id v23 = 0;
LABEL_19:

  return v23;
}

__CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_106(uint64_t a1, int a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = [*(id *)(a1 + 32) currentState];
  if (WeakRetained)
  {
    v33 = [WeakRetained mediaItem];
    uint64_t v7 = [v33 mediaItemURL];
    id v8 = v7;
    if (v7
      && ([v7 absoluteString],
          id v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 length],
          v9,
          v10))
    {
      id v11 = objc_loadWeakRetained(v4);
      id v12 = [v11 mediaItem];
      id v13 = [v12 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
      [v13 addStartEventWithName:TVPPlaybackReportingEventLoadAVAssetKeysTotal];

      id v14 = objc_loadWeakRetained(v4);
      unint64_t v15 = [v14 mediaItem];
      id v16 = [v15 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
      [v16 addStartEventWithName:TVPPlaybackReportingEventLoadAVAssetKeysPrimary];

      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      double v18 = v17;
      id v32 = [WeakRetained timingData];
      [v32 setStartTimeForLoadingAVAssetKeys:v18];
      id v19 = [WeakRetained _avAssetOptions];
      id v20 = [WeakRetained mediaItem];
      LODWORD(v16) = [v20 hasTrait:@"TVPMediaItemTraitUseTempDownload"];

      if (v16)
      {
        uint64_t v21 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        id v22 = sMediaItemLoaderLogObject;
        if (v21)
        {
          if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v21;
            _os_log_impl(&dword_236FC5000, v22, OS_LOG_TYPE_DEFAULT, "Setting AVAsset destination URL to %@", (uint8_t *)&buf, 0xCu);
          }
          [v19 setObject:v21 forKey:*MEMORY[0x263EFA230]];
        }
        else if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
        {
          __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_106_cold_2();
        }
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v50 = 0x2020000000;
      uint64_t v51 = 0;
      if (a2)
      {
        v24 = sMediaItemLoaderLogObject;
        if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v45 = 0;
          _os_log_impl(&dword_236FC5000, v24, OS_LOG_TYPE_DEFAULT, "Disabling AVAssetCache", v45, 2u);
        }
        [v19 removeObjectForKey:*MEMORY[0x263EFA210]];
      }
      else
      {
        [v33 hasTrait:@"TVPMediaItemTraitRequiresAppToRunIfBackgroundedDuringPlayback"];
      }
      id v25 = [WeakRetained _contentKeyLoader];
      id v26 = [WeakRetained assetLoadContextAccessQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_113;
      block[3] = &unk_264CC7048;
      p_long long buf = &buf;
      id v27 = WeakRetained;
      id v43 = v27;
      dispatch_sync(v26, block);

      id v28 = [v27 assetInternalAccessQueue];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_114;
      v34[3] = &unk_264CC7138;
      v40 = &buf;
      id v35 = v27;
      id v36 = v19;
      id v37 = v8;
      id v38 = *(id *)(a1 + 32);
      id v39 = v25;
      id v29 = v25;
      id v30 = v19;
      objc_copyWeak(&v41, v4);
      dispatch_async(v28, v34);

      objc_destroyWeak(&v41);
      _Block_object_dispose(&buf, 8);

      id v6 = @"Loading AVAsset keys";
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR)) {
        __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_106_cold_1();
      }
      id v23 = *(void **)(a1 + 32);
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_107;
      v46[3] = &unk_264CC5100;
      objc_copyWeak(&v48, v4);
      id v47 = *(id *)(a1 + 32);
      [v23 executeBlockAfterCurrentStateTransition:v46];

      objc_destroyWeak(&v48);
    }
  }
  return v6;
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_107(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"TVPlaybackErrorDomain" code:802 userInfo:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained mediaItem];
  id v5 = [v4 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
  [v5 addSingleShotEventWithName:TVPPlaybackReportingEventError value:v2];

  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = [v6 mediaItem];
  id v8 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
  [v8 addSingleShotEventWithName:TVPPlaybackReportingEventErrorEvent value:TVPPlaybackReportingEventLoadAVAssetKeysTotal];

  id v9 = *(void **)(a1 + 32);
  id v11 = @"error";
  v12[0] = v2;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [v9 postEvent:@"Failure" withContext:0 userInfo:v10];
}

uint64_t __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_113(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) assetLoadContext];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_114(uint64_t a1)
{
  v62[2] = *MEMORY[0x263EF8340];
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  id v2 = [*(id *)(a1 + 32) assetLoadContextAccessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_3;
  block[3] = &unk_264CC7048;
  v53 = &v54;
  id v52 = *(id *)(a1 + 32);
  dispatch_sync(v2, block);

  if (v55[3] != *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
    goto LABEL_46;
  }
  id v3 = (void *)[*(id *)(a1 + 40) mutableCopy];
  uint64_t v4 = *MEMORY[0x263EFA248];
  v62[0] = *MEMORY[0x263EFA298];
  v62[1] = v4;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:2];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v48 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v10 = [v3 objectForKey:v9];
        BOOL v11 = v10 == 0;

        if (!v11) {
          [v3 setObject:@"OMITTED" forKey:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v61 count:16];
    }
    while (v6);
  }

  id v12 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v60 = (uint64_t)v3;
    _os_log_impl(&dword_236FC5000, v12, OS_LOG_TYPE_DEFAULT, "AVAsset options: %@", buf, 0xCu);
  }
  id v13 = [*(id *)(a1 + 40) objectForKey:*MEMORY[0x263EFA2F0]];
  id v14 = [v13 objectForKey:*MEMORY[0x263EFA2E0]];

  uint64_t v15 = sMediaItemLoaderLogObject;
  BOOL v16 = os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v60 = (uint64_t)v14;
      double v17 = "AVURLAssetiTunesStoreContentHLSAssetURLStringKey is present: %@";
      double v18 = v15;
      uint32_t v19 = 12;
LABEL_18:
      _os_log_impl(&dword_236FC5000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    }
  }
  else if (v16)
  {
    *(_WORD *)long long buf = 0;
    double v17 = "AVURLAssetiTunesStoreContentHLSAssetURLStringKey is absent";
    double v18 = v15;
    uint32_t v19 = 2;
    goto LABEL_18;
  }
  id v20 = [*(id *)(a1 + 32) existingAVAsset];
  if (v20)
  {
    uint64_t v21 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_236FC5000, v21, OS_LOG_TYPE_DEFAULT, "Using existing AVURLAsset instead of creating new one", buf, 2u);
    }
    id v22 = 0;
  }
  else
  {
    id v23 = [*(id *)(a1 + 40) objectForKey:*MEMORY[0x263EFA238]];
    if (v23)
    {
      v24 = (id)sMediaItemLoaderLogObject;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = [v23 unsignedLongValue];
        *(_DWORD *)long long buf = 134217984;
        uint64_t v60 = v25;
        _os_log_impl(&dword_236FC5000, v24, OS_LOG_TYPE_DEFAULT, "Asset will be created using download token %lu", buf, 0xCu);
      }
    }
    id v26 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v60 = v27;
      _os_log_impl(&dword_236FC5000, v26, OS_LOG_TYPE_DEFAULT, "Creating AVURLAsset for %@", buf, 0xCu);
    }
    id v20 = (void *)[objc_alloc(MEMORY[0x263EFA8D0]) initWithURL:*(void *)(a1 + 48) options:*(void *)(a1 + 40)];
    uint64_t v28 = [v20 statusOfValueForKey:@"URL" error:0];
    id v29 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v60 = v28;
      _os_log_impl(&dword_236FC5000, v29, OS_LOG_TYPE_DEFAULT, "Status of AVAsset key [URL] is %ld", buf, 0xCu);
    }
    id v22 = 0;
    if (v23 && v28 == 3)
    {
      if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR)) {
        __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_114_cold_2();
      }
      id v22 = [MEMORY[0x263F087E8] errorWithDomain:@"TVPlaybackErrorDomain" code:833 userInfo:0];
    }
  }
  if (!v20 || v22)
  {
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR)) {
      __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_114_cold_1();
    }
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_122;
    v43[3] = &unk_264CC6538;
    id v44 = v22;
    id v45 = *(id *)(a1 + 32);
    id v46 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x263EF83A0], v43);

    id v36 = v44;
  }
  else
  {
    v58[0] = @"tracks";
    v58[1] = @"availableMediaCharacteristicsWithMediaSelectionOptions";
    v58[2] = @"availableChapterLocales";
    v58[3] = @"duration";
    v58[4] = @"availableMetadataFormats";
    v58[5] = @"preferredSoundCheckVolumeNormalization";
    v58[6] = @"streaming";
    v58[7] = @"playable";
    v58[8] = @"availableVideoDynamicRanges";
    v58[9] = @"maximumVideoResolution";
    v58[10] = @"metadata";
    id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:11];
    uint64_t v31 = [MEMORY[0x263F08A00] defaultCenter];
    [v31 addObserver:*(void *)(a1 + 32) selector:sel__avAudioSessionMediaServicesWereReset_ name:*MEMORY[0x263EF90F8] object:0];

    if (!*(void *)(a1 + 64))
    {
      id v32 = [v20 resourceLoader];
      uint64_t v33 = *(void *)(a1 + 32);
      uint64_t v34 = MEMORY[0x263EF83A0];
      id v35 = MEMORY[0x263EF83A0];
      [v32 setDelegate:v33 queue:v34];
    }
    [*(id *)(a1 + 32) setAVAssetInternal:v20];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_158;
    v37[3] = &unk_264CC7110;
    id v36 = v30;
    id v38 = v36;
    id v39 = v20;
    objc_copyWeak(&v42, (id *)(a1 + 80));
    uint64_t v41 = *(void *)(a1 + 72);
    id v40 = *(id *)(a1 + 56);
    [v39 loadValuesAsynchronouslyForKeys:v36 completionHandler:v37];

    objc_destroyWeak(&v42);
  }

LABEL_46:
  _Block_object_dispose(&v54, 8);
}

uint64_t __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) assetLoadContext];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_122(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [MEMORY[0x263F087E8] errorWithDomain:@"TVPlaybackErrorDomain" code:821 userInfo:0];
  }
  uint64_t v4 = v3;
  id v5 = [*(id *)(a1 + 40) mediaItem];
  uint64_t v6 = [v5 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
  [v6 addSingleShotEventWithName:TVPPlaybackReportingEventError value:v4];

  uint64_t v7 = [*(id *)(a1 + 40) mediaItem];
  id v8 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
  [v8 addSingleShotEventWithName:TVPPlaybackReportingEventErrorEvent value:TVPPlaybackReportingEventLoadAVAssetKeysTotal];

  uint64_t v9 = *(void **)(a1 + 48);
  BOOL v11 = @"error";
  v12[0] = v4;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [v9 postEvent:@"Failure" withContext:0 userInfo:v10];
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_158(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  uint64_t v4 = 0;
  id v5 = 0;
  if (v2)
  {
    uint64_t v6 = *(void *)v28;
    *(void *)&long long v3 = 138412290;
    long long v17 = v3;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 8 * v7);
        uint64_t v9 = *(void **)(a1 + 40);
        id v26 = v4;
        uint64_t v10 = objc_msgSend(v9, "statusOfValueForKey:error:", v8, &v26, v17);
        id v11 = v26;

        id v12 = sMediaItemLoaderLogObject;
        if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          uint64_t v32 = v8;
          __int16 v33 = 2048;
          uint64_t v34 = v10;
          _os_log_impl(&dword_236FC5000, v12, OS_LOG_TYPE_DEFAULT, "Status of AVAsset key [%@] is %ld", buf, 0x16u);
        }
        uint64_t v4 = v11;
        if (v10 == 3)
        {
          if (!objc_msgSend(MEMORY[0x263EFA470], "tvp_shouldIgnoreLoadFailureForKey:error:logObject:", v8, v11, sMediaItemLoaderLogObject))
          {
            LOBYTE(v2) = 1;
            goto LABEL_19;
          }
          ++v5;
          id v13 = sMediaItemLoaderLogObject;
          if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = v17;
            uint64_t v32 = v8;
            _os_log_impl(&dword_236FC5000, v13, OS_LOG_TYPE_DEFAULT, "Ignoring failure of non-essential key [%@]", buf, 0xCu);
          }
        }
        else if (v10 == 2)
        {
          ++v5;
        }
        ++v7;
      }
      while (v2 != v7);
      uint64_t v14 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      uint64_t v2 = v14;
    }
    while (v14);
  }
LABEL_19:

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_160;
  block[3] = &unk_264CC70E8;
  objc_copyWeak(v24, (id *)(a1 + 64));
  char v25 = v2;
  uint64_t v15 = *(void **)(a1 + 48);
  uint64_t v23 = *(void *)(a1 + 56);
  id v20 = v4;
  id v21 = v15;
  v24[1] = v5;
  id v22 = *(id *)(a1 + 32);
  id v16 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v24);
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_160(uint64_t a1)
{
  v25[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  long long v3 = WeakRetained;
  if (WeakRetained)
  {
    *(void *)long long buf = 0;
    id v21 = buf;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    uint64_t v4 = [WeakRetained assetLoadContextAccessQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_161;
    block[3] = &unk_264CC7048;
    uint32_t v19 = buf;
    id v5 = v3;
    id v18 = v5;
    dispatch_sync(v4, block);

    if (*((void *)v21 + 3) == *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (*(unsigned char *)(a1 + 80))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        if (v6)
        {
          v24 = @"error";
          v25[0] = v6;
          uint64_t v7 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
        }
        else
        {
          uint64_t v7 = 0;
        }
        id v12 = [v5 mediaItem];
        id v13 = [v12 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
        [v13 addSingleShotEventWithName:TVPPlaybackReportingEventError value:*(void *)(a1 + 32)];

        uint64_t v14 = [v5 mediaItem];
        uint64_t v15 = [v14 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
        [v15 addSingleShotEventWithName:TVPPlaybackReportingEventErrorEvent value:TVPPlaybackReportingEventLoadAVAssetKeysTotal];

        [*(id *)(a1 + 40) postEvent:@"Failure" withContext:0 userInfo:v7];
        goto LABEL_15;
      }
      uint64_t v11 = *(void *)(a1 + 72);
      if (v11 == [*(id *)(a1 + 48) count])
      {
        [*(id *)(a1 + 40) postEvent:@"AVAsset keys did load successfully"];
        goto LABEL_15;
      }
      uint64_t v9 = sMediaItemLoaderLogObject;
      if (!os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_WORD *)id v16 = 0;
      uint64_t v10 = "Not posting any event because AVAsset key loading is still in progress or cancelled";
    }
    else
    {
      uint64_t v9 = sMediaItemLoaderLogObject;
      if (!os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

        _Block_object_dispose(buf, 8);
        goto LABEL_16;
      }
      *(_WORD *)id v16 = 0;
      uint64_t v10 = "AVAsset key load completion is from previous attempt, ignoring";
    }
    _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, v10, v16, 2u);
    goto LABEL_15;
  }
  uint64_t v8 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_236FC5000, v8, OS_LOG_TYPE_DEFAULT, "Media item loader has been deallocated; ignoring AVAsset key load completion",
      buf,
      2u);
  }
LABEL_16:
}

uint64_t __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_161(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) assetLoadContext];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

__CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_163(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained mediaItem];
  id v5 = [v4 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
  [v5 addStartEventWithName:TVPPlaybackReportingEventMediaItemLoaderLoad];

  id v6 = objc_loadWeakRetained(v2);
  uint64_t v7 = [v6 mediaItem];
  uint64_t v8 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
  [v8 addStartEventWithName:TVPPlaybackReportingEventPrepareForLoading];

  id v9 = objc_loadWeakRetained(v2);
  [v9 setCleanedUp:0];

  id v10 = objc_loadWeakRetained(v2);
  uint64_t v11 = [v10 mediaItem];

  id v12 = objc_alloc_init(TVPMediaItemTimingData);
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  -[TVPMediaItemTimingData setStartTimeForPreparingForLoading:](v12, "setStartTimeForPreparingForLoading:");
  id v13 = objc_loadWeakRetained(v2);
  [v13 setTimingData:v12];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v14 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      char v25 = v11;
      _os_log_impl(&dword_236FC5000, v14, OS_LOG_TYPE_DEFAULT, "Calling prepareForLoadingWithCompletion for mediaItem %@", buf, 0xCu);
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_167;
    v21[3] = &unk_264CC71B0;
    uint64_t v15 = &v22;
    id v16 = v11;
    id v22 = v16;
    id v23 = *(id *)(a1 + 32);
    [v16 prepareForLoadingWithCompletion:v21];
  }
  else
  {
    long long v17 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_177;
    v19[3] = &unk_264CC5470;
    uint64_t v15 = &v20;
    id v20 = v17;
    [v20 executeBlockAfterCurrentStateTransition:v19];
  }

  return @"Preparing for loading";
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_167(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = @"NO";
    *(_DWORD *)long long buf = 138412802;
    if (a2) {
      uint64_t v8 = @"YES";
    }
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_236FC5000, v6, OS_LOG_TYPE_DEFAULT, "prepareForLoadingWithCompletion callback received for mediaItem %@.  Success is %@, error is %@", buf, 0x20u);
  }
  id v9 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_174;
  v11[3] = &unk_264CC7188;
  char v14 = a2;
  id v12 = v5;
  id v13 = v9;
  id v10 = v5;
  [v9 executeBlockAfterCurrentStateTransition:v11];
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_174(uint64_t a1)
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  [v3 setObject:v2 forKey:@"success"];

  objc_msgSend(v3, "tvp_setObjectIfNotNil:forKey:", *(void *)(a1 + 32), @"error");
  [*(id *)(a1 + 40) postEvent:@"Did finish preparing to load" withContext:0 userInfo:v3];
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_177(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  os_log_t v1 = *(void **)(a1 + 32);
  id v3 = @"success";
  v4[0] = MEMORY[0x263EFFA88];
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  [v1 postEvent:@"Did finish preparing to load" withContext:0 userInfo:v2];
}

id __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_3_179(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v10 = [WeakRetained mediaItem];
  uint64_t v11 = [v10 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
  [v11 addEndEventWithName:TVPPlaybackReportingEventPrepareForLoading];

  id v12 = objc_loadWeakRetained((id *)(a1 + 48));
  id v13 = [v12 timingData];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  objc_msgSend(v13, "setEndTimeForPreparingForLoading:");

  char v14 = [v7 objectForKey:@"success"];
  LODWORD(v10) = [v14 BOOLValue];
  uint64_t v15 = [v8 currentState];

  if (v10)
  {
    uint64_t v16 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    uint64_t v15 = (void *)v16;
  }
  else
  {
    __int16 v17 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_4;
    v19[3] = &unk_264CC52C8;
    id v20 = v7;
    id v21 = *(id *)(a1 + 32);
    [v17 executeBlockAfterCurrentStateTransition:v19];
  }
  return v15;
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_4(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"error"];
  id v3 = (void *)v2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v2)
  {
    id v6 = @"error";
    v7[0] = v2;
    id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [v4 postEvent:@"Failure" withContext:0 userInfo:v5];
  }
  else
  {
    [v4 postEvent:@"Failure" withContext:0 userInfo:0];
  }
}

uint64_t __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

__CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v13);
  uint64_t v15 = [WeakRetained mediaItem];
  uint64_t v16 = [v15 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
  [v16 addEndEventWithName:TVPPlaybackReportingEventLoadAVAssetKeysPrimary];

  id v17 = objc_loadWeakRetained(v13);
  int v18 = [v17 _needToLoadBlockingMetadataKeys];

  id v19 = objc_loadWeakRetained(v13);
  id v20 = [v19 mediaItem];
  id v21 = [v20 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
  id v22 = v21;
  if (v18)
  {
    [v21 addStartEventWithName:TVPPlaybackReportingEventLoadAVAssetKeysSecondary];

    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_7;
    v32[3] = &unk_264CC5600;
    objc_copyWeak(&v33, v13);
    [v9 executeBlockAfterCurrentStateTransition:v32];
    id v23 = [v9 currentState];
    objc_destroyWeak(&v33);
  }
  else
  {
    [v21 addEndEventWithName:TVPPlaybackReportingEventLoadAVAssetKeysTotal];

    id v24 = objc_loadWeakRetained(v13);
    char v25 = [v24 mediaItem];
    uint64_t v26 = [v25 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
    [v26 addEndEventWithName:TVPPlaybackReportingEventMediaItemLoaderLoad];

    id v27 = objc_loadWeakRetained(v13);
    long long v28 = [v27 timingData];
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    objc_msgSend(v28, "setEndTimeForLoadingAVAssetKeys:");

    id v29 = objc_loadWeakRetained(v13);
    long long v30 = [v29 mediaItem];
    [v30 setMediaItemMetadata:MEMORY[0x263EFFA88] forProperty:@"TVPMediaItemMetadataHLSMetadataIsLoaded"];

    id v23 = @"AVAsset keys loaded";
  }

  return v23;
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _loadMediaItemMetadataAsynchronously];
}

__CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_8(uint64_t a1)
{
  os_log_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained mediaItem];
  uint64_t v4 = [v3 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
  [v4 addEndEventWithName:TVPPlaybackReportingEventLoadAVAssetKeysSecondary];

  id v5 = objc_loadWeakRetained(v1);
  id v6 = [v5 mediaItem];
  id v7 = [v6 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
  [v7 addEndEventWithName:TVPPlaybackReportingEventLoadAVAssetKeysTotal];

  id v8 = objc_loadWeakRetained(v1);
  id v9 = [v8 mediaItem];
  id v10 = [v9 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
  [v10 addEndEventWithName:TVPPlaybackReportingEventMediaItemLoaderLoad];

  id v11 = objc_loadWeakRetained(v1);
  id v12 = [v11 timingData];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  objc_msgSend(v12, "setEndTimeForLoadingAVAssetKeys:");

  id v13 = objc_loadWeakRetained(v1);
  char v14 = [v13 mediaItem];
  [v14 setMediaItemMetadata:MEMORY[0x263EFFA88] forProperty:@"TVPMediaItemMetadataHLSMetadataIsLoaded"];

  return @"AVAsset keys loaded";
}

__CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v28 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v13 = [WeakRetained mediaItem];
  char v14 = [v13 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
  [v14 addStartEventWithName:TVPPlaybackReportingEventPrepareForPlaybackInitiation];

  id v15 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v16 = [v15 mediaItem];

  id v17 = objc_loadWeakRetained((id *)(a1 + 40));
  int v18 = [v17 timingData];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  objc_msgSend(v18, "setStartTimeForPreparingForPlaybackInitiation:");

  id v19 = objc_loadWeakRetained((id *)(a1 + 40));
  id v20 = [v19 _contentKeyLoader];

  id v21 = objc_loadWeakRetained((id *)(a1 + 40));
  id v22 = [v21 assetInternalAccessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_10;
  block[3] = &unk_264CC5100;
  objc_copyWeak(&v37, (id *)(a1 + 40));
  id v23 = v20;
  id v36 = v23;
  dispatch_sync(v22, block);

  if (objc_opt_respondsToSelector())
  {
    id v24 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v39 = v16;
      _os_log_impl(&dword_236FC5000, v24, OS_LOG_TYPE_DEFAULT, "Calling prepareForPlaybackInitiationWithCompletion for mediaItem %@", buf, 0xCu);
    }
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_182;
    v32[3] = &unk_264CC71B0;
    id v33 = v16;
    id v34 = *(id *)(a1 + 32);
    objc_msgSend(v33, "prepareForPlaybackInitiationWithCompletion:", v32, v28);

    char v25 = &v33;
  }
  else
  {
    uint64_t v26 = *(void **)(a1 + 32);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_183;
    v30[3] = &unk_264CC5470;
    id v31 = v26;
    objc_msgSend(v31, "executeBlockAfterCurrentStateTransition:", v30, v28);
    char v25 = &v31;
  }

  objc_destroyWeak(&v37);
  return @"Preparing for playback initiation";
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_onAssetInternalAccessQueue_updateContentKeySessionWithContentKeyLoader:", *(void *)(a1 + 32));
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_182(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = @"NO";
    int v11 = 138412802;
    if (a2) {
      id v8 = @"YES";
    }
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    char v14 = v8;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_236FC5000, v6, OS_LOG_TYPE_DEFAULT, "prepareForPlaybackInitiationWithCompletion callback received for mediaItem %@.  Success is %@, error is %@", (uint8_t *)&v11, 0x20u);
  }
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v10 = [NSNumber numberWithBool:a2];
  [v9 setObject:v10 forKey:@"success"];

  objc_msgSend(v9, "tvp_setObjectIfNotNil:forKey:", v5, @"error");
  [*(id *)(a1 + 40) postEvent:@"Did finish preparing for playback initiation" withContext:0 userInfo:v9];
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_183(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  os_log_t v1 = *(void **)(a1 + 32);
  id v3 = @"success";
  v4[0] = MEMORY[0x263EFFA88];
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  [v1 postEvent:@"Did finish preparing for playback initiation" withContext:0 userInfo:v2];
}

__CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_184(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = [WeakRetained mediaItem];
  int v11 = [v10 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
  [v11 addEndEventWithName:TVPPlaybackReportingEventPrepareForPlaybackInitiation];

  uint64_t v12 = [v7 objectForKey:@"success"];
  LODWORD(v11) = [v12 BOOLValue];
  __int16 v13 = [v8 currentState];

  id v14 = objc_loadWeakRetained((id *)(a1 + 40));
  __int16 v15 = [v14 timingData];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  objc_msgSend(v15, "setEndTimeForPreparingForPlaybackInitiation:");

  if (v11)
  {

    __int16 v13 = @"Ready for playback";
  }
  else
  {
    id v16 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_3_185;
    v18[3] = &unk_264CC52C8;
    id v19 = v7;
    id v20 = *(id *)(a1 + 32);
    [v16 executeBlockAfterCurrentStateTransition:v18];
  }
  return v13;
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_3_185(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"error"];
  id v3 = (void *)v2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v2)
  {
    id v6 = @"error";
    v7[0] = v2;
    id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [v4 postEvent:@"Failure" withContext:0 userInfo:v5];
  }
  else
  {
    [v4 postEvent:@"Failure" withContext:0 userInfo:0];
  }
}

uint64_t __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_4_186(uint64_t a1, void *a2)
{
  return [a2 currentState];
}

__CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_5_189(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = [a5 objectForKey:@"error"];
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained setError:v6];

  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR)) {
    __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_5_189_cold_1();
  }
  id v9 = (void *)sLoaderHashTable;
  id v10 = objc_loadWeakRetained(v7);
  [v9 removeObject:v10];

  id v11 = objc_loadWeakRetained(v7);
  [v11 _cleanUp];

  return @"Failed";
}

uint64_t __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_190(uint64_t a1, void *a2)
{
  return [a2 currentState];
}

__CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_193(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _cleanUp];
  }

  return @"Cleaned up";
}

- (id)_contentKeyLoader
{
  id v3 = [(TVPMediaItemLoader *)self mediaItem];
  if ([v3 conformsToProtocol:&unk_26EA48068])
  {
    uint64_t v4 = [(TVPMediaItemLoader *)self mediaItem];
    char v5 = [v4 hasTrait:@"TVPMediaItemTraitAirPlayedContent"];

    if ((v5 & 1) == 0)
    {
      id v6 = [(TVPMediaItemLoader *)self mediaItem];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v6 = 0;
LABEL_6:
  return v6;
}

- (void)_onAssetInternalAccessQueue_updateContentKeySessionWithContentKeyLoader:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (self->_contentKeySession)
  {
    id v6 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      id v7 = "Content key session already exists";
      id v8 = (uint8_t *)&v12;
LABEL_4:
      _os_log_impl(&dword_236FC5000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else
  {
    if (!v4)
    {
      id v6 = sMediaItemLoaderLogObject;
      if (!os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      __int16 v13 = 0;
      id v7 = "Not creating content key session because contentKeyLoader is nil";
      id v8 = (uint8_t *)&v13;
      goto LABEL_4;
    }
    if (!self->_AVAssetInternal && os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR)) {
      -[TVPMediaItemLoader _onAssetInternalAccessQueue_updateContentKeySessionWithContentKeyLoader:]();
    }
    id v9 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Creating content key session", buf, 2u);
    }
    id v10 = [[TVPContentKeySession alloc] initWithContentKeyLoader:v5 avAsset:self->_AVAssetInternal];
    contentKeySession = self->_contentKeySession;
    self->_contentKeySession = v10;
  }
LABEL_14:
}

- (id)_avAssetOptions
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (_avAssetOptions_onceToken != -1) {
    dispatch_once(&_avAssetOptions_onceToken, &__block_literal_global_246);
  }
  id v3 = [(TVPMediaItemLoader *)self mediaItem];
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  char v5 = (void *)_avAssetOptions_metadataKeysToAVAssetKeysMappings;
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __37__TVPMediaItemLoader__avAssetOptions__block_invoke_2;
  v52[3] = &unk_264CC71D8;
  id v6 = v3;
  id v53 = v6;
  id v7 = v4;
  id v54 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v52];
  id v8 = (void *)_avAssetOptions_traitsKeysToAVAssetKeysMappings;
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  void v49[2] = __37__TVPMediaItemLoader__avAssetOptions__block_invoke_3;
  v49[3] = &unk_264CC71D8;
  id v9 = v6;
  id v50 = v9;
  id v10 = v7;
  id v51 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:v49];
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  __int16 v12 = [v9 mediaItemMetadataForProperty:@"TVPMediaItemMetadataAVURLAssetAlternativeConfigurationOptions"];
  __int16 v13 = [v9 mediaItemMetadataForProperty:@"TVPMediaItemMetadataServiceIdentifier"];
  uint64_t v14 = [v9 mediaItemMetadataForProperty:@"TVPMediaItemMetadataStoreFrontIdentifier"];
  __int16 v15 = [v9 mediaItemMetadataForProperty:@"TVPMediaItemMetadataRTCChildHierarchyToken"];
  id v16 = sMediaItemLoaderLogObject;
  BOOL v17 = os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT);
  id v45 = (void *)v14;
  if (v15)
  {
    if (v17)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_236FC5000, v16, OS_LOG_TYPE_DEFAULT, "Using existing RTC hierarchy token in media item loader", buf, 2u);
    }
  }
  else
  {
    if (v17)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_236FC5000, v16, OS_LOG_TYPE_DEFAULT, "Creating RTC hierarchy tokens in media item loader", buf, 2u);
    }
    int v18 = (void *)[MEMORY[0x263F62A08] newHierarchyTokenFromParentToken:0];
    if (v18)
    {
      id v19 = (void *)[MEMORY[0x263F62A08] newHierarchyTokenFromParentToken:v18];
      id v20 = [(TVPMediaItemLoader *)self mediaItem];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __37__TVPMediaItemLoader__avAssetOptions__block_invoke_249;
      v46[3] = &unk_264CC6538;
      void v46[4] = self;
      id v47 = v18;
      __int16 v15 = v19;
      long long v48 = v15;
      [v20 performMediaItemMetadataTransactionWithBlock:v46];

      uint64_t v14 = (uint64_t)v45;
    }
    else
    {
      __int16 v15 = 0;
    }
  }
  id v21 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v56 = v15;
    _os_log_impl(&dword_236FC5000, v21, OS_LOG_TYPE_DEFAULT, "RTC hierarchy token for AVAsset: %@", buf, 0xCu);
  }
  if (v12) {
    [v11 addEntriesFromDictionary:v12];
  }
  if (v13) {
    [v11 setObject:v13 forKey:*MEMORY[0x263EFA200]];
  }
  if (v14) {
    [v11 setObject:v14 forKey:@"StorefrontID"];
  }
  if (v15) {
    [v11 setObject:v15 forKey:*MEMORY[0x263EFA1E8]];
  }
  if ([v11 count]) {
    [v10 setObject:v11 forKey:*MEMORY[0x263EFA1F8]];
  }
  if ([v9 hasTrait:@"TVPMediaItemTraitOptimizeForHighLatency"])
  {
    uint64_t v22 = MEMORY[0x263EFFA88];
    [v10 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFA268]];
    [v10 setObject:v22 forKey:*MEMORY[0x263EFA2A0]];
  }
  if ([v9 hasTrait:@"TVPMediaItemTraitIncludeStoreCookiesInContentRequests"])
  {
    id v23 = [v9 mediaItemMetadataForProperty:@"TVPMediaItemMetadataDSID"];
    if (v23)
    {
      id v24 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
      char v25 = objc_msgSend(v24, "ams_iTunesAccountWithDSID:", v23);

      uint64_t v26 = objc_msgSend(v25, "ams_cookies");
      if (v26) {
        [v10 setObject:v26 forKey:*MEMORY[0x263EFA248]];
      }
    }
  }
  id v27 = [v9 mediaItemMetadataForProperty:@"TVPMediaItemMetadataiTunesStoreContentInfo"];
  if (v27) {
    [v10 setObject:v27 forKey:*MEMORY[0x263EFA2F0]];
  }
  uint64_t v28 = [(TVPMediaItemLoader *)self allowsCellularUsage];
  id v29 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    long long v30 = @"not ";
    if (v28) {
      long long v30 = &stru_26EA147D8;
    }
    *(_DWORD *)long long buf = 138412290;
    uint64_t v56 = v30;
    _os_log_impl(&dword_236FC5000, v29, OS_LOG_TYPE_DEFAULT, "Cellular usage is %@allowed for this media item loader", buf, 0xCu);
  }
  if (v28)
  {
    int v31 = [v9 hasTrait:@"TVPMediaItemTraitCellularPlaybackProhibited"];
    uint64_t v32 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = @"not ";
      if (v31) {
        id v33 = &stru_26EA147D8;
      }
      *(_DWORD *)long long buf = 138412290;
      uint64_t v56 = v33;
      _os_log_impl(&dword_236FC5000, v32, OS_LOG_TYPE_DEFAULT, "Cellular usage is %@prohibited for this media item", buf, 0xCu);
    }
    uint64_t v28 = v31 ^ 1u;
  }
  id v34 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    if (v28) {
      id v35 = @"Allowing";
    }
    else {
      id v35 = @"Not allowing";
    }
    *(_DWORD *)long long buf = 138412290;
    uint64_t v56 = v35;
    _os_log_impl(&dword_236FC5000, v34, OS_LOG_TYPE_DEFAULT, "%@ cellular playback of this media item", buf, 0xCu);
  }
  id v36 = [NSNumber numberWithBool:v28];
  [v10 setObject:v36 forKey:*MEMORY[0x263EFA1D0]];

  BOOL v37 = [(TVPMediaItemLoader *)self allowsConstrainedNetworkUsage];
  id v38 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    id v39 = @"not ";
    if (v37) {
      id v39 = &stru_26EA147D8;
    }
    *(_DWORD *)long long buf = 138412290;
    uint64_t v56 = v39;
    _os_log_impl(&dword_236FC5000, v38, OS_LOG_TYPE_DEFAULT, "Cellular usage is %@allowed for this media item loader", buf, 0xCu);
  }
  uint64_t v40 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v41 = @"Not allowing";
    if (v37) {
      uint64_t v41 = @"Allowing";
    }
    *(_DWORD *)long long buf = 138412290;
    uint64_t v56 = v41;
    _os_log_impl(&dword_236FC5000, v40, OS_LOG_TYPE_DEFAULT, "%@ constrained network playback of this media item", buf, 0xCu);
  }
  id v42 = [NSNumber numberWithBool:v37];
  [v10 setObject:v42 forKey:*MEMORY[0x263EFA1D8]];

  id v43 = v10;
  return v43;
}

void __37__TVPMediaItemLoader__avAssetOptions__block_invoke()
{
  v12[9] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263EFA298];
  v11[0] = @"TVPMediaItemMetadataAcquisitionDictionary";
  v11[1] = @"TVPMediaItemMetadataKeyBagPathFileURL";
  uint64_t v1 = *MEMORY[0x263EFA290];
  v12[0] = v0;
  v12[1] = v1;
  uint64_t v2 = *MEMORY[0x263EFA2C0];
  v11[2] = @"TVPMediaItemMetadataAllowAppleWirelessDirectLink";
  v11[3] = @"TVPMediaItemMetadataAirPlayAuthorizationInfo";
  uint64_t v3 = *MEMORY[0x263EFA1C8];
  void v12[2] = v2;
  v12[3] = v3;
  uint64_t v4 = *MEMORY[0x263EFA2B0];
  void v11[4] = @"TVPMediaItemMetadataSSLProperties";
  v11[5] = @"TVPMediaItemMetadataOutOfBandAlternateTracks";
  uint64_t v5 = *MEMORY[0x263EFA278];
  void v12[4] = v4;
  v12[5] = v5;
  uint64_t v6 = *MEMORY[0x263EFA250];
  v11[6] = @"TVPMediaItemMetadataHTTPHeaders";
  v11[7] = @"TVPMediaItemMetadataDownloadToken";
  uint64_t v7 = *MEMORY[0x263EFA238];
  v12[6] = v6;
  v12[7] = v7;
  v11[8] = @"TVPMediaItemMetadataDownloadDestinationURL";
  v12[8] = *MEMORY[0x263EFA230];
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:9];
  id v9 = (void *)_avAssetOptions_metadataKeysToAVAssetKeysMappings;
  _avAssetOptions_metadataKeysToAVAssetKeysMappings = v8;

  id v10 = (void *)_avAssetOptions_traitsKeysToAVAssetKeysMappings;
  _avAssetOptions_traitsKeysToAVAssetKeysMappings = MEMORY[0x263EFFA78];
}

void __37__TVPMediaItemLoader__avAssetOptions__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) mediaItemMetadataForProperty:a2];
  if (v5) {
    [*(id *)(a1 + 40) setObject:v5 forKey:v6];
  }
}

void __37__TVPMediaItemLoader__avAssetOptions__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(a1 + 32) hasTrait:a2]) {
    [*(id *)(a1 + 40) setObject:MEMORY[0x263EFFA88] forKey:v5];
  }
}

void __37__TVPMediaItemLoader__avAssetOptions__block_invoke_249(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mediaItem];
  [v2 setMediaItemMetadata:*(void *)(a1 + 40) forProperty:@"TVPMediaItemMetadataRTCParentHierarchyToken"];

  id v3 = [*(id *)(a1 + 32) mediaItem];
  [v3 setMediaItemMetadata:*(void *)(a1 + 48) forProperty:@"TVPMediaItemMetadataRTCChildHierarchyToken"];
}

- (void)_avAudioSessionMediaServicesWereReset:(id)a3
{
  uint64_t v4 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_236FC5000, v4, OS_LOG_TYPE_DEFAULT, "Received AVAudioSessionMediaServicesWereResetNotification.  Will handle on next run loop to ensure audio session has a chance to configure itself", buf, 2u);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__TVPMediaItemLoader__avAudioSessionMediaServicesWereReset___block_invoke;
  block[3] = &unk_264CC5470;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__TVPMediaItemLoader__avAudioSessionMediaServicesWereReset___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Handling AVAudioSessionMediaServicesWereResetNotification after delay", v7, 2u);
  }
  uint64_t v8 = @"error";
  id v3 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v4 = (void *)[v3 initWithDomain:*MEMORY[0x263EF98B0] code:-11819 userInfo:0];
  v9[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v6 = [*(id *)(a1 + 32) stateMachine];
  [v6 postEvent:@"Failure" withContext:0 userInfo:v5];
}

- (id)_metadataKeysToLoad
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.hls.advisory-info.count", @"com.apple.hls.cs-rating", @"com.apple.hls.description", @"com.apple.hls.display-ratings-overlay", @"com.apple.hls.episode-title", @"com.apple.hls.feature.adam-id", @"com.apple.hls.feature.duration", @"com.apple.hls.genre", @"com.apple.hls.keys", @"com.apple.hls.mid-roll.count", @"com.apple.hls.post-roll.count", @"com.apple.hls.poster", @"com.apple.hls.pre-roll.count", @"com.apple.hls.pre-roll.duration", @"com.apple.hls.product-placement-info.duration", @"com.apple.hls.product-placement-info.image", @"com.apple.hls.product-placement-info.text",
               @"com.apple.hls.rating-image",
               @"com.apple.hls.rating-system",
               @"com.apple.hls.rating-tag",
               @"com.apple.hls.rt-audience-score",
               @"com.apple.hls.rt-rating",
               @"com.apple.hls.skip.count",
               @"com.apple.hls.title",
               @"com.apple.hls.up-next.start",
               @"com.apple.hls.watched.time",
               @"com.apple.hls.photosensitivity-info.text",
               @"com.apple.hls.photosensitivity-info.image",
               @"com.apple.hls.photosensitivity-info.duration",
               @"com.apple.hls.high-motion-info.text",
               @"com.apple.hls.high-motion-info.image",
               @"com.apple.hls.high-motion-info.duration",
               @"com.apple.amp.video.recommended.viewing-distance.ratio",
               0);
}

- (BOOL)_needToLoadBlockingMetadataKeys
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__3;
  id v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  id v3 = [(TVPMediaItemLoader *)self assetInternalAccessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__TVPMediaItemLoader__needToLoadBlockingMetadataKeys__block_invoke;
  block[3] = &unk_264CC7048;
  void block[4] = self;
  void block[5] = &v20;
  dispatch_sync(v3, block);

  uint64_t v4 = (void *)v21[5];
  if (v4 && [v4 statusOfValueForKey:@"metadata" error:0] == 2)
  {
    id v5 = [(TVPMediaItemLoader *)self _metadataKeysToLoad];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = objc_msgSend((id)v21[5], "metadata", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) key];
          char v11 = [v5 containsObject:v10];

          if (v11)
          {
            LODWORD(v7) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v28 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LODWORD(v7) = 0;
  }
  __int16 v12 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = @"NO";
    if (v7) {
      __int16 v13 = @"YES";
    }
    *(_DWORD *)long long buf = 138412290;
    id v27 = v13;
    _os_log_impl(&dword_236FC5000, v12, OS_LOG_TYPE_DEFAULT, "Need to load metadata keys = %@", buf, 0xCu);
  }
  _Block_object_dispose(&v20, 8);

  return v7;
}

uint64_t __53__TVPMediaItemLoader__needToLoadBlockingMetadataKeys__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) AVAssetInternal];
  return MEMORY[0x270F9A758]();
}

- (id)_rollKeyNamesForType:(unint64_t)a3 withCount:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    uint64_t v8 = [(TVPMediaItemLoader *)self _rollKeyNameFromType:a3];
    if ([v8 length])
    {
      uint64_t v9 = 0;
      do
      {
        id v10 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.start", v8, v9];
        [v7 addObject:v10];

        char v11 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.duration", v8, v9];
        [v7 addObject:v11];

        __int16 v12 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.skippable", v8, v9];
        [v7 addObject:v12];

        if ((a3 | 2) == 3)
        {
          __int16 v13 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.adam-id", v8, v9];
          [v7 addObject:v13];

          if (a3 == 1)
          {
            uint64_t v14 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.dynamic-slot.data-set-id", v8, v9];
            [v7 addObject:v14];
          }
        }
        ++v9;
      }
      while (a4 != v9);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  long long v15 = (void *)[v7 copy];

  return v15;
}

- (id)_skipKeyNamesForType:(unint64_t)a3 withCount:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    uint64_t v8 = [(TVPMediaItemLoader *)self _skipKeyNameFromType:a3];
    if ([v8 length])
    {
      uint64_t v9 = 0;
      do
      {
        id v10 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.start", v8, v9];
        [v7 addObject:v10];

        char v11 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.duration", v8, v9];
        [v7 addObject:v11];

        __int16 v12 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.target", v8, v9];
        [v7 addObject:v12];

        __int16 v13 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.label", v8, v9];
        [v7 addObject:v13];

        uint64_t v14 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.type", v8, v9];
        [v7 addObject:v14];

        long long v15 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.enabled", v8, v9];
        [v7 addObject:v15];

        long long v16 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.image", v8, v9];
        [v7 addObject:v16];

        long long v17 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.image-width", v8, v9];
        [v7 addObject:v17];

        long long v18 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.image-height", v8, v9];
        [v7 addObject:v18];

        id v19 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.title", v8, v9];
        [v7 addObject:v19];

        uint64_t v20 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.genre", v8, v9];
        [v7 addObject:v20];

        id v21 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.rating-display-name", v8, v9];
        [v7 addObject:v21];

        uint64_t v22 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.rating-system", v8, v9];
        [v7 addObject:v22];

        id v23 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.canonical-id", v8, v9];
        [v7 addObject:v23];

        id v24 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.runtime", v8, v9];
        [v7 addObject:v24];

        id v25 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.up-next.is-added", v8, v9];
        [v7 addObject:v25];

        uint64_t v26 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.up-next.add-label", v8, v9];
        [v7 addObject:v26];

        id v27 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.up-next.added-label", v8, v9];
        [v7 addObject:v27];

        ++v9;
      }
      while (a4 != v9);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v28 = (void *)[v7 copy];

  return v28;
}

- (id)_advisoryKeyNamesWithCount:(unint64_t)a3
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    uint64_t v5 = 0;
    do
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.hls.advisory-info.%lu.key", v5);
      [v4 addObject:v6];

      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.hls.advisory-info.%lu.value", v5);
      [v4 addObject:v7];

      ++v5;
    }
    while (a3 != v5);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v8 = (void *)[v4 copy];

  return v8;
}

- (id)_tomatoFreshnessFromString:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"FRESH"] & 1) != 0
    || ([v3 isEqualToString:@"Fresh"] & 1) != 0)
  {
    uint64_t v4 = &unk_26EA25FF0;
  }
  else if (([v3 isEqualToString:@"CERTIFIED_FRESH"] & 1) != 0 {
         || [v3 isEqualToString:@"CertifiedFresh"])
  }
  {
    uint64_t v4 = &unk_26EA26008;
  }
  else
  {
    uint64_t v4 = &unk_26EA25FD8;
  }

  return v4;
}

- (id)_contentKeyRequestParamsFromBase64String:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v3 length])
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v3 options:1];
    if ([v4 length])
    {
      id v55 = 0;
      uint64_t v5 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v55];
      id v6 = v55;
      if (v5)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v31 = v6;
          uint64_t v32 = v5;
          id v33 = v4;
          id v34 = v3;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          id obj = v5;
          uint64_t v7 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
          if (!v7) {
            goto LABEL_36;
          }
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v52;
          uint64_t v35 = *(void *)v52;
          while (1)
          {
            uint64_t v10 = 0;
            uint64_t v37 = v8;
            do
            {
              if (*(void *)v52 != v9) {
                objc_enumerationMutation(obj);
              }
              char v11 = *(void **)(*((void *)&v51 + 1) + 8 * v10);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                id v27 = sMediaItemLoaderLogObject;
                if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR)) {
                  [(TVPMediaItemLoader *)&v43 _contentKeyRequestParamsFromBase64String:v27];
                }
                goto LABEL_34;
              }
              id v12 = v11;
              __int16 v13 = objc_msgSend(v12, "tvp_stringForKey:", @"uri");
              uint64_t v14 = objc_msgSend(v12, "tvp_arrayForKey:", @"keyformatversion");
              if (![v13 length]) {
                goto LABEL_31;
              }
              id v42 = v12;
              long long v15 = objc_alloc_init(TVPContentKeyRequestParams);
              id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
              id v39 = v15;
              uint64_t v41 = v13;
              [(TVPContentKeyRequestParams *)v15 setKeyIdentifier:v13];
              long long v49 = 0u;
              long long v50 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              uint64_t v40 = v14;
              id v17 = v14;
              uint64_t v18 = [v17 countByEnumeratingWithState:&v47 objects:v56 count:16];
              if (!v18) {
                goto LABEL_28;
              }
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v48;
              do
              {
                uint64_t v21 = 0;
                do
                {
                  if (*(void *)v48 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v22 = *(void **)(*((void *)&v47 + 1) + 8 * v21);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v23 = v22;
LABEL_22:
                    id v25 = v23;
                    if (v23)
                    {
                      [v16 addObject:v23];
                    }
                    goto LABEL_26;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v24 = [v22 integerValue];
                    if (v24 < 1) {
                      goto LABEL_26;
                    }
                    id v23 = [NSNumber numberWithInteger:v24];
                    goto LABEL_22;
                  }
                  uint64_t v26 = sMediaItemLoaderLogObject;
                  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR)) {
                    [(TVPMediaItemLoader *)&buf _contentKeyRequestParamsFromBase64String:v26];
                  }
LABEL_26:
                  ++v21;
                }
                while (v19 != v21);
                uint64_t v19 = [v17 countByEnumeratingWithState:&v47 objects:v56 count:16];
              }
              while (v19);
LABEL_28:

              if ([v16 count]) {
                [(TVPContentKeyRequestParams *)v39 setKeyFormatVersions:v16];
              }
              objc_msgSend(v36, "addObject:", v39, v31, v32, v33, v34);

              uint64_t v8 = v37;
              uint64_t v9 = v35;
              __int16 v13 = v41;
              id v12 = v42;
              uint64_t v14 = v40;
LABEL_31:

LABEL_34:
              ++v10;
            }
            while (v10 != v8);
            uint64_t v8 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
            if (!v8)
            {
LABEL_36:

              uint64_t v4 = v33;
              id v3 = v34;
              id v6 = v31;
              uint64_t v5 = v32;
              goto LABEL_41;
            }
          }
        }
        if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR)) {
          -[TVPMediaItemLoader _contentKeyRequestParamsFromBase64String:].cold.4();
        }
      }
      else if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
      {
        -[TVPMediaItemLoader _contentKeyRequestParamsFromBase64String:]();
      }
LABEL_41:
    }
  }
  if (objc_msgSend(v36, "count", v31, v32, v33, v34)) {
    uint64_t v28 = v36;
  }
  else {
    uint64_t v28 = 0;
  }
  id v29 = v28;

  return v29;
}

- (void)_loadMediaItemMetadataAsynchronously
{
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__3;
  uint64_t v41 = __Block_byref_object_dispose__3;
  id v42 = 0;
  objc_initWeak(&location, self);
  id v3 = [(TVPMediaItemLoader *)self assetInternalAccessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke;
  block[3] = &unk_264CC7200;
  void block[4] = &v37;
  objc_copyWeak(&v35, &location);
  dispatch_sync(v3, block);

  uint64_t v4 = (void *)v38[5];
  if (v4 && [v4 statusOfValueForKey:@"metadata" error:0] == 2)
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__3;
    void v32[4] = __Block_byref_object_dispose__3;
    id v33 = (id)objc_opt_new();
    dispatch_group_t v5 = dispatch_group_create();
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_2;
    v29[3] = &unk_264CC7228;
    id v6 = v5;
    long long v30 = v6;
    id v31 = v32;
    uint64_t v7 = (void (**)(void, void, void))MEMORY[0x237E144A0](v29);
    uint64_t v8 = [(id)v38[5] metadata];
    if ([v8 count])
    {
      v28[0] = 0;
      v28[1] = v28;
      v28[2] = 0x2020000000;
      v28[3] = 0;
      uint64_t v9 = [(TVPMediaItemLoader *)self assetLoadContextAccessQueue];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_467;
      v27[3] = &unk_264CC7048;
      void v27[4] = self;
      v27[5] = v28;
      dispatch_sync(v9, v27);

      uint64_t v10 = [(TVPMediaItemLoader *)self _metadataKeysToLoad];
      char v11 = sMediaItemLoaderLogObject;
      if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl(&dword_236FC5000, v11, OS_LOG_TYPE_DEFAULT, "Loading the counts for AVAsset metadata items.", buf, 2u);
      }
      ((void (**)(void, void *, void *))v7)[2](v7, v8, v10);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_468;
      v17[3] = &unk_264CC72C8;
      objc_copyWeak(&v25, &location);
      uint64_t v22 = v32;
      id v23 = &v37;
      id v18 = v8;
      id v19 = v10;
      uint64_t v21 = v7;
      uint64_t v20 = v6;
      uint64_t v24 = v28;
      id v12 = v10;
      dispatch_group_notify(v20, MEMORY[0x263EF83A0], v17);

      objc_destroyWeak(&v25);
      _Block_object_dispose(v28, 8);
    }
    else
    {
      id v15 = objc_loadWeakRetained(&location);
      id v16 = [v15 stateMachine];
      [v16 postEvent:@"AVAsset metadata did load successfully"];
    }
    _Block_object_dispose(v32, 8);
  }
  else
  {
    id v13 = objc_loadWeakRetained(&location);
    uint64_t v14 = [v13 stateMachine];
    [v14 postEvent:@"AVAsset metadata did load successfully"];
  }
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v37, 8);
}

void __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained AVAssetInternal];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint8_t buf = 138412290;
    id v31 = v6;
    _os_log_impl(&dword_236FC5000, v7, OS_LOG_TYPE_DEFAULT, "Will load AVAsset metadata keys = %@", buf, 0xCu);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    id v19 = v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "key", v19);
        if ([v6 containsObject:v14])
        {
          id v15 = [v13 identifier];

          if (v15)
          {
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
            id v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            id v17 = [v13 identifier];
            [v16 setObject:v17 forKey:v14];

            uint64_t v28 = @"value";
            id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
            v20[0] = MEMORY[0x263EF8330];
            v20[1] = 3221225472;
            v21[0] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_465;
            v21[1] = &unk_264CC6538;
            v21[2] = v13;
            id v22 = v14;
            id v23 = *(id *)(a1 + 32);
            [v13 loadValuesAsynchronouslyForKeys:v18 completionHandler:v20];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }
}

void __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_465(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) statusOfValueForKey:@"value" error:0];
  uint64_t v3 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v4;
    __int16 v7 = 2048;
    uint64_t v8 = v2;
    _os_log_impl(&dword_236FC5000, v3, OS_LOG_TYPE_DEFAULT, "Status of AVAsset Metadata key [%@] is = %ld", (uint8_t *)&v5, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_467(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) assetLoadContext];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_468(uint64_t a1)
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  from = (id *)(a1 + 88);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v68 = [WeakRetained _stringValueForKey:@"com.apple.hls.feature.adam-id" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  v67 = [WeakRetained _numberValueForKey:@"com.apple.hls.up-next.start" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  v66 = [WeakRetained _numberValueForKey:@"com.apple.hls.watched.time" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  v65 = [WeakRetained _numberValueForKey:@"com.apple.hls.pre-roll.duration" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  v64 = [WeakRetained _numberValueForKey:@"com.apple.hls.feature.duration" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  v63 = [WeakRetained _stringValueForKey:@"com.apple.hls.rating-image" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  v61 = [WeakRetained _stringValueForKey:@"com.apple.hls.display-ratings-overlay" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  id v45 = [WeakRetained _stringValueForKey:@"com.apple.hls.title" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  v59 = [WeakRetained _stringValueForKey:@"com.apple.hls.episode-title" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint8_t v43 = [WeakRetained _stringValueForKey:@"com.apple.hls.description" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v41 = [WeakRetained _stringValueForKey:@"com.apple.hls.genre" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v39 = [WeakRetained _stringValueForKey:@"com.apple.hls.rating-tag" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v37 = [WeakRetained _stringValueForKey:@"com.apple.hls.rating-system" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v58 = [WeakRetained _stringValueForKey:@"com.apple.hls.photosensitivity-info.text" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v57 = [WeakRetained _stringValueForKey:@"com.apple.hls.photosensitivity-info.image" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v56 = [WeakRetained _numberValueForKey:@"com.apple.hls.photosensitivity-info.duration" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  long long v54 = [WeakRetained _stringValueForKey:@"com.apple.hls.high-motion-info.text" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  long long v52 = [WeakRetained _stringValueForKey:@"com.apple.hls.high-motion-info.image" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  long long v50 = [WeakRetained _numberValueForKey:@"com.apple.hls.high-motion-info.duration" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  id v35 = [WeakRetained _numberValueForKey:@"com.apple.hls.cs-rating" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  id v33 = [WeakRetained _stringValueForKey:@"com.apple.hls.rt-rating" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  id v31 = [WeakRetained _numberValueForKey:@"com.apple.hls.rt-audience-score" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  id v29 = [WeakRetained _stringValueForKey:@"com.apple.hls.poster" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  long long v27 = [WeakRetained _stringValueForKey:@"com.apple.hls.keys" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  long long v48 = [WeakRetained _numberValueForKey:@"com.apple.amp.video.recommended.viewing-distance.ratio" fromMetadata:*(void *)(a1 + 32) andKeyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x2020000000;
  uint64_t v131 = 0;
  uint64_t v124 = 0;
  v125 = &v124;
  uint64_t v126 = 0x2020000000;
  uint64_t v127 = 0;
  uint64_t v120 = 0;
  v121 = &v120;
  uint64_t v122 = 0x2020000000;
  uint64_t v123 = 0;
  uint64_t v116 = 0;
  v117 = &v116;
  uint64_t v118 = 0x2020000000;
  uint64_t v119 = 0;
  uint64_t v112 = 0;
  v113 = &v112;
  uint64_t v114 = 0x2020000000;
  uint64_t v115 = 0;
  v111[0] = MEMORY[0x263EF8330];
  v111[1] = 3221225472;
  v111[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_2_469;
  v111[3] = &unk_264CC7250;
  v111[4] = WeakRetained;
  v111[5] = &v128;
  v111[6] = &v124;
  v111[7] = &v120;
  v111[8] = &v116;
  v111[9] = &v112;
  uint64_t v2 = (void (**)(void, void))MEMORY[0x237E144A0](v111);
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) metadata];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v107 objects:v132 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v108;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v108 != v5) {
          objc_enumerationMutation(v3);
        }
        __int16 v7 = *(void **)(*((void *)&v107 + 1) + 8 * i);
        uint64_t v8 = [v7 key];
        if ([*(id *)(a1 + 40) containsObject:v8]
          && [v7 statusOfValueForKey:@"value" error:0] == 2)
        {
          ((void (**)(void, void *))v2)[2](v2, v7);
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v107 objects:v132 count:16];
    }
    while (v4);
  }

  uint64_t v9 = [MEMORY[0x263EFF9C0] set];
  uint64_t v10 = [WeakRetained _rollKeyNamesForType:1 withCount:v129[3]];
  [v9 addObjectsFromArray:v10];

  uint64_t v11 = [WeakRetained _rollKeyNamesForType:2 withCount:v125[3]];
  [v9 addObjectsFromArray:v11];

  id v12 = [WeakRetained _rollKeyNamesForType:3 withCount:v121[3]];
  [v9 addObjectsFromArray:v12];

  id v13 = [WeakRetained _skipKeyNamesForType:1 withCount:v117[3]];
  [v9 addObjectsFromArray:v13];

  uint64_t v14 = [WeakRetained _advisoryKeyNamesWithCount:v113[3]];
  [v9 addObjectsFromArray:v14];

  id v15 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl(&dword_236FC5000, v15, OS_LOG_TYPE_DEFAULT, "Loading the values for AVAsset metadata items.", buf, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v16 = *(NSObject **)(a1 + 48);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_476;
  block[3] = &unk_264CC72A0;
  group = v16;
  objc_copyWeak(&v105, from);
  uint64_t v98 = *(void *)(a1 + 80);
  id v17 = *(id *)(a1 + 32);
  uint64_t v99 = *(void *)(a1 + 64);
  v100 = &v128;
  v101 = &v124;
  v102 = &v120;
  v103 = &v116;
  v104 = &v112;
  id v72 = v17;
  id v73 = v67;
  id v74 = v66;
  id v75 = v65;
  id v76 = v64;
  id v77 = v63;
  id v78 = v57;
  id v79 = v56;
  id v80 = v58;
  id v81 = v52;
  id v82 = v50;
  id v83 = v54;
  id v84 = v48;
  id v85 = v68;
  id v86 = v61;
  id v87 = v59;
  id v88 = v45;
  id v89 = v43;
  id v90 = v41;
  id v91 = v39;
  id v92 = v37;
  id v93 = v35;
  id v94 = v33;
  id v95 = v31;
  id v96 = v29;
  id v97 = v27;
  id v28 = v27;
  id v30 = v29;
  id v32 = v31;
  id v34 = v33;
  id v36 = v35;
  id v38 = v37;
  id v40 = v39;
  id v42 = v41;
  id v44 = v43;
  id v46 = v45;
  id v60 = v59;
  id v62 = v61;
  id v69 = v68;
  id v49 = v48;
  id v55 = v54;
  id v51 = v50;
  id v53 = v52;
  id v18 = v58;
  id v19 = v56;
  id v20 = v57;
  id v21 = v63;
  id v22 = v64;
  id v23 = v65;
  id v24 = v66;
  id v25 = v67;
  dispatch_group_notify(group, MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v105);
  _Block_object_dispose(&v112, 8);
  _Block_object_dispose(&v116, 8);
  _Block_object_dispose(&v120, 8);
  _Block_object_dispose(&v124, 8);
  _Block_object_dispose(&v128, 8);
}

void __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_2_469(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 key];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 statusOfValueForKey:v3 error:0] == 2)
  {
    uint64_t v4 = [*(id *)(a1 + 32) _rollTypeFromMetadataItemKey:v3];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = objc_msgSend(v13, "tvp_numberValue");
      uint64_t v7 = [v6 unsignedIntegerValue];

      switch(v5)
      {
        case 3:
          uint64_t v8 = *(void *)(a1 + 56);
          break;
        case 2:
          uint64_t v8 = *(void *)(a1 + 48);
          break;
        case 1:
          uint64_t v8 = *(void *)(a1 + 40);
          break;
        default:
          goto LABEL_17;
      }
      *(void *)(*(void *)(v8 + 8) + 24) = v7;
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 32) _skipTypeFromMetadataItemKey:v3];
      if (v9)
      {
        if (v9 != 1) {
          goto LABEL_17;
        }
        uint64_t v10 = objc_msgSend(v13, "tvp_numberValue");
        uint64_t v11 = [v10 unsignedIntegerValue];
        uint64_t v12 = *(void *)(a1 + 64);
      }
      else
      {
        if (![v3 hasPrefix:@"com.apple.hls.advisory-info"]) {
          goto LABEL_17;
        }
        uint64_t v10 = objc_msgSend(v13, "tvp_numberValue");
        uint64_t v11 = [v10 unsignedIntegerValue];
        uint64_t v12 = *(void *)(a1 + 72);
      }
      *(void *)(*(void *)(v12 + 8) + 24) = v11;
    }
  }
LABEL_17:
}

void __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_476(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 296));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    *(void *)uint8_t buf = 0;
    uint64_t v58 = buf;
    uint64_t v59 = 0x2020000000;
    uint64_t v60 = 0;
    uint64_t v4 = [WeakRetained assetLoadContextAccessQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_2_477;
    block[3] = &unk_264CC7048;
    uint64_t v56 = buf;
    id v5 = v3;
    id v55 = v5;
    dispatch_sync(v4, block);

    if (*((void *)v58 + 3) == *(void *)(*(void *)(*(void *)(a1 + 240) + 8) + 24))
    {
      id v21 = [v5 _rollInfoFromMetadata:*(void *)(a1 + 32) keyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 248) + 8) + 40) forType:1 withTotalCount:*(void *)(*(void *)(*(void *)(a1 + 256) + 8) + 24)];
      uint64_t v6 = [v5 _rollInfoFromMetadata:*(void *)(a1 + 32) keyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 248) + 8) + 40) forType:2 withTotalCount:*(void *)(*(void *)(*(void *)(a1 + 264) + 8) + 24)];
      uint64_t v7 = [v5 _rollInfoFromMetadata:*(void *)(a1 + 32) keyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 248) + 8) + 40) forType:3 withTotalCount:*(void *)(*(void *)(*(void *)(a1 + 272) + 8) + 24)];
      uint64_t v8 = [v5 _skipInfoFromMetadata:*(void *)(a1 + 32) keyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 248) + 8) + 40) forType:1 withTotalCount:*(void *)(*(void *)(*(void *)(a1 + 280) + 8) + 24)];
      uint64_t v9 = [v5 _advisoryInfoFromMetadata:*(void *)(a1 + 32) keyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 248) + 8) + 40) withTotalCount:*(void *)(*(void *)(*(void *)(a1 + 288) + 8) + 24)];
      uint64_t v10 = [v5 _productPlacementInfoFromMetadata:*(void *)(a1 + 32) keyIdentifierMap:*(void *)(*(void *)(*(void *)(a1 + 248) + 8) + 40)];
      uint64_t v11 = objc_opt_new();
      [v11 addObjectsFromArray:v21];
      [v11 addObjectsFromArray:v6];
      [v11 addObjectsFromArray:v7];
      uint64_t v12 = [v5 mediaItem];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_3;
      v23[3] = &unk_264CC7278;
      id v13 = v5;
      id v24 = v13;
      id v14 = v11;
      id v25 = v14;
      id v15 = v8;
      id v26 = v15;
      id v27 = *(id *)(a1 + 40);
      id v28 = *(id *)(a1 + 48);
      id v29 = *(id *)(a1 + 56);
      id v30 = *(id *)(a1 + 64);
      id v16 = v9;
      id v31 = v16;
      id v32 = *(id *)(a1 + 72);
      id v17 = v10;
      id v33 = v17;
      id v34 = *(id *)(a1 + 80);
      id v35 = *(id *)(a1 + 88);
      id v36 = *(id *)(a1 + 96);
      id v37 = *(id *)(a1 + 104);
      id v38 = *(id *)(a1 + 112);
      id v39 = *(id *)(a1 + 120);
      id v40 = *(id *)(a1 + 128);
      id v41 = *(id *)(a1 + 136);
      id v42 = *(id *)(a1 + 144);
      id v43 = *(id *)(a1 + 152);
      id v44 = *(id *)(a1 + 160);
      id v45 = *(id *)(a1 + 168);
      id v46 = *(id *)(a1 + 176);
      id v47 = *(id *)(a1 + 184);
      id v48 = *(id *)(a1 + 192);
      id v49 = *(id *)(a1 + 200);
      id v50 = *(id *)(a1 + 208);
      id v51 = *(id *)(a1 + 216);
      id v52 = *(id *)(a1 + 224);
      id v53 = *(id *)(a1 + 232);
      [v12 performMediaItemMetadataTransactionWithBlock:v23];

      id v18 = [v13 stateMachine];
      [v18 postEvent:@"AVAsset metadata did load successfully"];
    }
    else
    {
      id v20 = sMediaItemLoaderLogObject;
      if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v22 = 0;
        _os_log_impl(&dword_236FC5000, v20, OS_LOG_TYPE_DEFAULT, "Metadata key load completion is from previous attempt, ignoring", v22, 2u);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v19 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl(&dword_236FC5000, v19, OS_LOG_TYPE_DEFAULT, "Media item loader has been deallocated; ignoring Metadata key load completion",
        buf,
        2u);
    }
  }
}

uint64_t __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_2_477(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) assetLoadContext];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_3(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) mediaItem];
  [v2 setMediaItemMetadata:*(void *)(a1 + 40) forProperty:@"TVPMediaItemMetadataRollInfo"];

  uint64_t v3 = [*(id *)(a1 + 32) mediaItem];
  [v3 setMediaItemMetadata:*(void *)(a1 + 48) forProperty:@"TVPMediaItemMetadataSkipInfo"];

  uint64_t v4 = [*(id *)(a1 + 32) mediaItem];
  [v4 setMediaItemMetadata:*(void *)(a1 + 56) forProperty:@"TVPMediaItemMetadataPostPlayStartTime"];

  id v5 = [*(id *)(a1 + 32) mediaItem];
  [v5 setMediaItemMetadata:*(void *)(a1 + 64) forProperty:@"TVPMediaItemMetadataWatchedTime"];

  uint64_t v6 = [*(id *)(a1 + 32) mediaItem];
  [v6 setMediaItemMetadata:*(void *)(a1 + 72) forProperty:@"TVPMediaItemMetadataFeatureStartTime"];

  uint64_t v7 = [*(id *)(a1 + 32) mediaItem];
  [v7 setMediaItemMetadata:*(void *)(a1 + 80) forProperty:@"TVPMediaItemMetadataFeatureDuration"];

  uint64_t v8 = [*(id *)(a1 + 32) mediaItem];
  [v8 setMediaItemMetadata:*(void *)(a1 + 88) forProperty:@"TVPMediaItemMetadataAdvisoryInfo"];

  uint64_t v9 = [*(id *)(a1 + 32) mediaItem];
  [v9 setMediaItemMetadata:*(void *)(a1 + 96) forProperty:@"TVPMediaItemMetadataRatingImageURL"];

  uint64_t v10 = [*(id *)(a1 + 32) mediaItem];
  [v10 setMediaItemMetadata:*(void *)(a1 + 104) forProperty:@"TVPMediaItemMetadataProductPlacementInfo"];

  uint64_t v11 = [*(id *)(a1 + 32) mediaItem];
  [v11 setMediaItemMetadata:*(void *)(a1 + 112) forProperty:@"TVPMediaItemMetadataPhotoSensitivityImageURL"];

  uint64_t v12 = [*(id *)(a1 + 32) mediaItem];
  [v12 setMediaItemMetadata:*(void *)(a1 + 120) forProperty:@"TVPMediaItemMetadataPhotoSensitivityDuration"];

  id v13 = [*(id *)(a1 + 32) mediaItem];
  [v13 setMediaItemMetadata:*(void *)(a1 + 128) forProperty:@"TVPMediaItemMetadataPhotoSensitivityDescription"];

  id v14 = [*(id *)(a1 + 32) mediaItem];
  [v14 setMediaItemMetadata:*(void *)(a1 + 136) forProperty:@"TVPMediaItemMetadataHighMotionWarningImageURL"];

  id v15 = [*(id *)(a1 + 32) mediaItem];
  [v15 setMediaItemMetadata:*(void *)(a1 + 144) forProperty:@"TVPMediaItemMetadataHighMotionWarningDuration"];

  id v16 = [*(id *)(a1 + 32) mediaItem];
  [v16 setMediaItemMetadata:*(void *)(a1 + 152) forProperty:@"TVPMediaItemMetadataHighMotionWarningDescription"];

  id v17 = [*(id *)(a1 + 32) mediaItem];
  [v17 setMediaItemMetadata:*(void *)(a1 + 160) forProperty:@"TVPMediaItemMetadataRecommendedViewingRatio"];

  id v18 = [*(id *)(a1 + 32) mediaItem];
  id v19 = [v18 mediaItemMetadataForProperty:@"TVPMediaItemMetadataStoreItemIdentifier"];

  if ([v19 length])
  {
    if ([*(id *)(a1 + 168) length])
    {
      if (([v19 isEqualToString:*(void *)(a1 + 168)] & 1) == 0)
      {
        id v20 = sMediaItemLoaderLogObject;
        if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = *(void *)(a1 + 168);
          int v49 = 138412546;
          id v50 = v19;
          __int16 v51 = 2112;
          uint64_t v52 = v21;
          _os_log_impl(&dword_236FC5000, v20, OS_LOG_TYPE_DEFAULT, "Media item metadata and HLS store identifiers do not match. Media item:%@ HLS:%@", (uint8_t *)&v49, 0x16u);
        }
      }
    }
  }
  if ([*(id *)(a1 + 168) length])
  {
    id v22 = [*(id *)(a1 + 32) mediaItem];
    [v22 setMediaItemMetadata:*(void *)(a1 + 168) forProperty:@"TVPMediaItemMetadataStoreItemIdentifier"];
  }
  if ([*(id *)(a1 + 176) length])
  {
    uint64_t v23 = [*(id *)(a1 + 176) BOOLValue];
    id v24 = [*(id *)(a1 + 32) mediaItem];
    id v25 = [NSNumber numberWithBool:v23];
    [v24 setMediaItemMetadata:v25 forProperty:@"TVPMediaItemMetadataShouldDisplayRatingOverlay"];
  }
  id v26 = [*(id *)(a1 + 32) mediaItem];
  id v27 = [v26 mediaItemMetadataForProperty:@"TVPMediaItemMetadataMediaType"];

  if ([v27 isEqualToString:@"ATVMediaTypeTVEpisode"])
  {
    id v28 = @"TVPMediaItemMetadataTitle";
  }
  else
  {
    int v29 = [v27 isEqualToString:@"ATVMediaTypeTVEpisodePreview"];
    id v28 = @"TVPMediaItemMetadataTitle";
    if (!v29) {
      goto LABEL_15;
    }
  }
  if ([*(id *)(a1 + 184) length])
  {
    id v30 = [*(id *)(a1 + 32) mediaItem];
    [v30 setMediaItemMetadata:*(void *)(a1 + 184) forProperty:v28];

    id v31 = @"TVPMediaItemMetadataSeriesTitle";
    id v28 = v31;
  }
LABEL_15:
  if ([*(id *)(a1 + 192) length])
  {
    id v32 = [*(id *)(a1 + 32) mediaItem];
    [v32 setMediaItemMetadata:*(void *)(a1 + 192) forProperty:v28];
  }
  if ([*(id *)(a1 + 200) length])
  {
    id v33 = [*(id *)(a1 + 32) mediaItem];
    [v33 setMediaItemMetadata:*(void *)(a1 + 200) forProperty:@"TVPMediaItemMetadataLongDescription"];
  }
  if ([*(id *)(a1 + 208) length])
  {
    id v34 = [*(id *)(a1 + 32) mediaItem];
    [v34 setMediaItemMetadata:*(void *)(a1 + 208) forProperty:@"TVPMediaItemMetadataGenre"];
  }
  if ([*(id *)(a1 + 216) length])
  {
    id v35 = [*(id *)(a1 + 32) mediaItem];
    [v35 setMediaItemMetadata:*(void *)(a1 + 216) forProperty:@"TVPMediaItemMetadataContentRating"];
  }
  if ([*(id *)(a1 + 224) length])
  {
    id v36 = [*(id *)(a1 + 32) mediaItem];
    [v36 setMediaItemMetadata:*(void *)(a1 + 224) forProperty:@"TVPMediaItemMetadataContentRatingSystem"];
  }
  if (*(void *)(a1 + 232))
  {
    id v37 = [*(id *)(a1 + 32) mediaItem];
    [v37 setMediaItemMetadata:*(void *)(a1 + 232) forProperty:@"TVPMediaItemMetadataCommonSenseRating"];
  }
  if ([*(id *)(a1 + 240) length])
  {
    id v38 = [*(id *)(a1 + 32) _tomatoFreshnessFromString:*(void *)(a1 + 240)];
    id v39 = [*(id *)(a1 + 32) mediaItem];
    [v39 setMediaItemMetadata:v38 forProperty:@"TVPMediaItemMetadataTomatoFreshness"];
  }
  id v40 = *(void **)(a1 + 248);
  if (v40)
  {
    [v40 doubleValue];
    if (v41 >= 0.0)
    {
      [*(id *)(a1 + 248) doubleValue];
      unint64_t v43 = (unint64_t)(v42 * 100.0);
      id v44 = [*(id *)(a1 + 32) mediaItem];
      id v45 = [NSNumber numberWithUnsignedInteger:v43];
      [v44 setMediaItemMetadata:v45 forProperty:@"TVPMediaItemMetadataTomatoPercentage"];
    }
  }
  if ([*(id *)(a1 + 256) length])
  {
    id v46 = [*(id *)(a1 + 32) mediaItem];
    [v46 setMediaItemMetadata:*(void *)(a1 + 256) forProperty:@"TVPMediaItemMetadataArtworkURLFormat"];
  }
  id v47 = [*(id *)(a1 + 32) _contentKeyRequestParamsFromBase64String:*(void *)(a1 + 264)];
  id v48 = [*(id *)(a1 + 32) mediaItem];
  [v48 setMediaItemMetadata:v47 forProperty:@"TVPMediaItemMetadataContentKeyRequestParams"];
}

- (id)_rollInfoFromMetadata:(id)a3 keyIdentifierMap:(id)a4 forType:(unint64_t)a5 withTotalCount:(unint64_t)a6
{
  id v10 = a3;
  id v42 = a4;
  if (a6)
  {
    uint64_t v11 = [(TVPMediaItemLoader *)self _rollKeyNameFromType:a5];
    if ([v11 length])
    {
      [MEMORY[0x263EFF980] array];
      v40 = unint64_t v39 = a6;
      uint64_t v12 = 0;
      unint64_t v38 = a5;
      do
      {
        id v13 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.start", v11, v12];
        id v14 = [(TVPMediaItemLoader *)self _numberValueForKey:v13 fromMetadata:v10 andKeyIdentifierMap:v42];

        id v15 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.duration", v11, v12];
        id v16 = [(TVPMediaItemLoader *)self _numberValueForKey:v15 fromMetadata:v10 andKeyIdentifierMap:v42];

        if (v14) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17)
        {
          id v18 = [TVPMediaItemRollInfo alloc];
          [v14 doubleValue];
          double v20 = v19;
          [v16 doubleValue];
          id v22 = [(TVPMediaItemRollInfo *)v18 initWithType:a5 start:v20 duration:v21];
          uint64_t v23 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.adam-id", v11, v12];
          [(TVPMediaItemLoader *)self _numberValueForKey:v23 fromMetadata:v10 andKeyIdentifierMap:v42];
          id v24 = v11;
          v26 = id v25 = self;

          double v41 = (void *)v26;
          uint64_t v27 = v26;
          self = v25;
          uint64_t v11 = v24;
          [(TVPMediaItemRollInfo *)v22 setAdamID:v27];
          id v28 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.skippable", v24, v12];
          int v29 = [(TVPMediaItemLoader *)self _stringValueForKey:v28 fromMetadata:v10 andKeyIdentifierMap:v42];

          if ([v29 length]) {
            uint64_t v30 = [v29 BOOLValue];
          }
          else {
            uint64_t v30 = 1;
          }
          [(TVPMediaItemRollInfo *)v22 setSkippable:v30];
          id v31 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.dynamic-slot.data-set-id", v11, v12];
          [(TVPMediaItemLoader *)self _stringValueForKey:v31 fromMetadata:v10 andKeyIdentifierMap:v42];
          v33 = id v32 = v10;

          [(TVPMediaItemRollInfo *)v22 setDynamicSlotDataSetId:v33];
          [v40 addObject:v22];

          id v10 = v32;
          a5 = v38;
          a6 = v39;
        }

        ++v12;
      }
      while (a6 != v12);
      id v34 = v10;
      id v35 = v40;
    }
    else
    {
      id v34 = v10;
      id v35 = 0;
    }
  }
  else
  {
    id v34 = v10;
    id v35 = 0;
  }
  id v36 = (void *)[v35 copy];

  return v36;
}

- (id)_skipInfoFromMetadata:(id)a3 keyIdentifierMap:(id)a4 forType:(unint64_t)a5 withTotalCount:(unint64_t)a6
{
  id v37 = a3;
  id v36 = a4;
  if (a6)
  {
    id v10 = [(TVPMediaItemLoader *)self _skipKeyNameFromType:a5];
    if ([v10 length])
    {
      unint64_t v33 = a5;
      id v34 = [MEMORY[0x263EFF980] array];
      unint64_t v35 = a6;
      for (uint64_t i = 0; i != v19; ++i)
      {
        uint64_t v12 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.start", v10, i];
        id v13 = [(TVPMediaItemLoader *)self _numberValueForKey:v12 fromMetadata:v37 andKeyIdentifierMap:v36];

        id v14 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.duration", v10, i];
        id v15 = [(TVPMediaItemLoader *)self _numberValueForKey:v14 fromMetadata:v37 andKeyIdentifierMap:v36];

        id v16 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.target", v10, i];
        BOOL v17 = [(TVPMediaItemLoader *)self _numberValueForKey:v16 fromMetadata:v37 andKeyIdentifierMap:v36];

        id v18 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.label", v10, i];
        unint64_t v38 = [(TVPMediaItemLoader *)self _stringValueForKey:v18 fromMetadata:v37 andKeyIdentifierMap:v36];

        unint64_t v19 = v35;
        double v20 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.type", v10, i];
        double v21 = [(TVPMediaItemLoader *)self _stringValueForKey:v20 fromMetadata:v37 andKeyIdentifierMap:v36];

        if (v13 && v15 && v17)
        {
          id v22 = [TVPMediaItemSkipInfo alloc];
          [v13 doubleValue];
          double v24 = v23;
          [v15 doubleValue];
          double v26 = v25;
          [v17 doubleValue];
          id v28 = [(TVPMediaItemSkipInfo *)v22 initWithType:v33 start:v38 duration:v21 target:v24 localizedTitle:v26 skipIntroReportingType:v27];
          int v29 = [(TVPMediaItemLoader *)self _promoInfoFromMetadata:v37 keyIdentifierMap:v36 forSkipKey:v10 skipCounter:i];
          if (v29) {
            [(TVPMediaItemSkipInfo *)v28 setPromoInfo:v29];
          }
          [v34 addObject:v28];

          unint64_t v19 = v35;
        }
      }
      uint64_t v30 = v34;
    }
    else
    {
      uint64_t v30 = 0;
    }
  }
  else
  {
    uint64_t v30 = 0;
  }
  id v31 = (void *)[v30 copy];

  return v31;
}

- (id)_promoInfoFromMetadata:(id)a3 keyIdentifierMap:(id)a4 forSkipKey:(id)a5 skipCounter:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.enabled", v12, a6];
  id v14 = [(TVPMediaItemLoader *)self _stringValueForKey:v13 fromMetadata:v10 andKeyIdentifierMap:v11];

  if (!v14 || ![v14 length] || !objc_msgSend(v14, "BOOLValue"))
  {
    id v36 = 0;
    goto LABEL_12;
  }
  id v15 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.image", v12, a6];
  uint64_t v52 = [(TVPMediaItemLoader *)self _stringValueForKey:v15 fromMetadata:v10 andKeyIdentifierMap:v11];

  id v16 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.image-width", v12, a6];
  BOOL v17 = [(TVPMediaItemLoader *)self _stringValueForKey:v16 fromMetadata:v10 andKeyIdentifierMap:v11];

  double v18 = 0.0;
  double v19 = 0.0;
  if (v17)
  {
    [v17 floatValue];
    double v19 = v20;
  }
  id v50 = v17;
  double v21 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.image-height", v12, a6];
  id v22 = [(TVPMediaItemLoader *)self _stringValueForKey:v21 fromMetadata:v10 andKeyIdentifierMap:v11];

  if (v22)
  {
    [v22 floatValue];
    double v18 = v23;
  }
  int v49 = v22;
  double v24 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.title", v12, a6];
  __int16 v51 = [(TVPMediaItemLoader *)self _stringValueForKey:v24 fromMetadata:v10 andKeyIdentifierMap:v11];

  double v25 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.genre", v12, a6];
  id v48 = [(TVPMediaItemLoader *)self _stringValueForKey:v25 fromMetadata:v10 andKeyIdentifierMap:v11];

  double v26 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.rating-display-name", v12, a6];
  id v47 = [(TVPMediaItemLoader *)self _stringValueForKey:v26 fromMetadata:v10 andKeyIdentifierMap:v11];

  double v27 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.rating-system", v12, a6];
  id v46 = [(TVPMediaItemLoader *)self _stringValueForKey:v27 fromMetadata:v10 andKeyIdentifierMap:v11];

  id v28 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.runtime", v12, a6];
  id v45 = [(TVPMediaItemLoader *)self _stringValueForKey:v28 fromMetadata:v10 andKeyIdentifierMap:v11];

  int v29 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.canonical-id", v12, a6];
  uint64_t v30 = [(TVPMediaItemLoader *)self _stringValueForKey:v29 fromMetadata:v10 andKeyIdentifierMap:v11];

  id v31 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.up-next.is-added", v12, a6];
  uint64_t v32 = [(TVPMediaItemLoader *)self _stringValueForKey:v31 fromMetadata:v10 andKeyIdentifierMap:v11];

  unint64_t v43 = (void *)v32;
  id v44 = v14;
  if (!v32)
  {
    id v34 = (void *)v30;
    goto LABEL_16;
  }
  unint64_t v33 = (void *)v32;
  id v34 = (void *)v30;
  if (![v33 length])
  {
LABEL_16:
    char v35 = 0;
    goto LABEL_17;
  }
  char v35 = [v33 BOOLValue];
LABEL_17:
  unint64_t v38 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.up-next.add-label", v12, a6];
  id v42 = [(TVPMediaItemLoader *)self _stringValueForKey:v38 fromMetadata:v10 andKeyIdentifierMap:v11];

  unint64_t v39 = [NSString stringWithFormat:@"com.apple.hls.%@.%lu.promo.up-next.added-label", v12, a6];
  id v40 = [(TVPMediaItemLoader *)self _stringValueForKey:v39 fromMetadata:v10 andKeyIdentifierMap:v11];

  LOBYTE(v41) = v35;
  id v36 = [[TVPMediaItemPromoInfo alloc] initWithTitleImageURL:v52 originalTitleImageWidth:v51 originalTitleImageHeight:v48 title:v47 genre:v46 ratingDisplayName:v45 ratingSystem:v19 movieRuntime:v18 canonicalId:v34 isAddedToUpNext:v41 addToUpNextLabelString:v42 addedToUpNextLabelString:v40];

  id v14 = v44;
LABEL_12:

  return v36;
}

- (id)_advisoryInfoFromMetadata:(id)a3 keyIdentifierMap:(id)a4 withTotalCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    id v10 = [MEMORY[0x263EFF980] array];
    uint64_t v11 = 0;
    do
    {
      id v12 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.hls.advisory-info.%lu.value", v11);
      id v13 = [(TVPMediaItemLoader *)self _stringValueForKey:v12 fromMetadata:v8 andKeyIdentifierMap:v9];

      id v14 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.hls.advisory-info.%lu.key", v11);
      id v15 = [(TVPMediaItemLoader *)self _stringValueForKey:v14 fromMetadata:v8 andKeyIdentifierMap:v9];

      if ([v13 length])
      {
        id v16 = [[TVPMediaItemAdvisoryInfo alloc] initWithRatingDescription:v13];
        if ([v15 length]) {
          [(TVPMediaItemAdvisoryInfo *)v16 setRatingName:v15];
        }
        [v10 addObject:v16];
      }
      ++v11;
    }
    while (a5 != v11);
  }
  else
  {
    id v10 = 0;
  }
  BOOL v17 = (void *)[v10 copy];

  return v17;
}

- (id)_productPlacementInfoFromMetadata:(id)a3 keyIdentifierMap:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TVPMediaItemLoader *)self _stringValueForKey:@"com.apple.hls.product-placement-info.text" fromMetadata:v7 andKeyIdentifierMap:v6];
  id v9 = [(TVPMediaItemLoader *)self _numberValueForKey:@"com.apple.hls.product-placement-info.duration" fromMetadata:v7 andKeyIdentifierMap:v6];
  id v10 = [(TVPMediaItemLoader *)self _stringValueForKey:@"com.apple.hls.product-placement-info.image" fromMetadata:v7 andKeyIdentifierMap:v6];

  uint64_t v11 = [[TVPMediaItemProductPlacementInfo alloc] initWithLocalizedProductPlacementInfoString:v8 duration:v9 andImageURLStringFormat:v10];
  return v11;
}

- (id)_numberValueForKey:(id)a3 fromMetadata:(id)a4 andKeyIdentifierMap:(id)a5
{
  id v7 = a4;
  id v8 = [a5 objectForKeyedSubscript:a3];
  if (v8)
  {
    id v9 = [MEMORY[0x263EFA748] metadataItemsFromArray:v7 filteredByIdentifier:v8];
    id v10 = [v9 firstObject];

    uint64_t v11 = 0;
    if ([v10 statusOfValueForKey:@"value" error:0] == 2)
    {
      uint64_t v11 = objc_msgSend(v10, "tvp_numberValue");
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_stringValueForKey:(id)a3 fromMetadata:(id)a4 andKeyIdentifierMap:(id)a5
{
  id v7 = a4;
  id v8 = [a5 objectForKeyedSubscript:a3];
  if (v8)
  {
    id v9 = [MEMORY[0x263EFA748] metadataItemsFromArray:v7 filteredByIdentifier:v8];
    id v10 = [v9 firstObject];

    uint64_t v11 = 0;
    if ([v10 statusOfValueForKey:@"value" error:0] == 2)
    {
      uint64_t v11 = [v10 stringValue];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (unint64_t)_rollTypeFromMetadataItemKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.hls.pre-roll.count"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"com.apple.hls.mid-roll.count"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"com.apple.hls.post-roll.count"])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)_skipTypeFromMetadataItemKey:(id)a3
{
  return [a3 hasPrefix:@"com.apple.hls.skip"];
}

- (id)_rollKeyNameFromType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return off_264CC72E8[a3 - 1];
  }
}

- (id)_skipKeyNameFromType:(unint64_t)a3
{
  if (a3 == 1) {
    return @"skip";
  }
  else {
    return 0;
  }
}

- (void)_mediaItemPlaybackErrorDidOccur:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"TVPMediaItemPlaybackErrorKey"];

  id v7 = [v4 userInfo];

  id v8 = [v7 objectForKey:@"TVPMediaItemPlaybackErrorShouldStopKey"];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v10 = [v6 userInfo];
    uint64_t v11 = (void *)[v9 initWithDictionary:v10];

    [v11 setObject:v8 forKey:@"TVPMediaItemPlaybackErrorShouldStopKey"];
    id v12 = objc_alloc(MEMORY[0x263F087E8]);
    id v13 = [v6 domain];
    uint64_t v14 = objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, objc_msgSend(v6, "code"), v11);

    id v6 = (void *)v14;
  }
  if (v6)
  {
    float v20 = @"error";
    v21[0] = v6;
    id v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  }
  else
  {
    id v15 = 0;
  }
  id v16 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    double v19 = v6;
    _os_log_impl(&dword_236FC5000, v16, OS_LOG_TYPE_DEFAULT, "Media item playback error did occur: %@", (uint8_t *)&v18, 0xCu);
  }
  BOOL v17 = [(TVPMediaItemLoader *)self stateMachine];
  [v17 postEvent:@"Failure" withContext:0 userInfo:v15];
}

- (void)_mediaItemStopPlayback:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(MEMORY[0x263F087E8]);
  id v16 = @"TVPMediaItemLoaderSuppressErrorAndStopKey";
  v17[0] = MEMORY[0x263EFFA88];
  id v5 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  id v6 = (void *)[v4 initWithDomain:@"TVPlaybackErrorDomain" code:819 userInfo:v5];

  id v7 = (void *)sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [(TVPMediaItemLoader *)self mediaItem];
    *(_DWORD *)uint8_t buf = 138412290;
    id v15 = v9;
    _os_log_impl(&dword_236FC5000, v8, OS_LOG_TYPE_DEFAULT, "Media item requested stop: %@", buf, 0xCu);
  }
  id v10 = [(TVPMediaItemLoader *)self stateMachine];
  id v12 = @"error";
  id v13 = v6;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v10 postEvent:@"Failure" withContext:0 userInfo:v11];
}

- (void)_cleanUp
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (![(TVPMediaItemLoader *)self cleanedUp])
  {
    id v3 = [(TVPMediaItemLoader *)self diskSpaceMonitorTimer];
    [v3 invalidate];

    [(TVPMediaItemLoader *)self setDiskSpaceMonitorTimer:0];
    id v4 = [(TVPMediaItemLoader *)self assetLoadContextAccessQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__TVPMediaItemLoader__cleanUp__block_invoke;
    block[3] = &unk_264CC5470;
    void block[4] = self;
    dispatch_sync(v4, block);

    id v5 = [(TVPMediaItemLoader *)self assetInternalAccessQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __30__TVPMediaItemLoader__cleanUp__block_invoke_2;
    v10[3] = &unk_264CC5470;
    void v10[4] = self;
    dispatch_sync(v5, v10);

    id v6 = [(TVPMediaItemLoader *)self mediaItem];
    int v7 = [v6 hasTrait:@"TVPMediaItemTraitUseTempDownload"];

    if (v7) {
      [(id)objc_opt_class() removeTemporaryDownloadDirectory];
    }
    [(TVPMediaItemLoader *)self setTimingData:0];
    id v8 = [(TVPMediaItemLoader *)self mediaItem];
    if (objc_opt_respondsToSelector())
    {
      id v9 = sMediaItemLoaderLogObject;
      if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint8_t buf = 138412290;
        id v13 = v8;
        _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Calling cleanUpMediaItem for media item %@", buf, 0xCu);
      }
      [v8 cleanUpMediaItem];
    }
    [(TVPMediaItemLoader *)self setCleanedUp:1];
  }
}

uint64_t __30__TVPMediaItemLoader__cleanUp__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) assetLoadContext] + 1;
  id v3 = *(void **)(a1 + 32);
  return [v3 setAssetLoadContext:v2];
}

void __30__TVPMediaItemLoader__cleanUp__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) AVAssetInternal];

  if (v2)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263EF90F8] object:0];

    [*(id *)(a1 + 32) setContentKeySession:0];
    id v4 = [*(id *)(a1 + 32) AVAssetInternal];
    id v5 = [v4 resourceLoader];
    [v5 setDelegate:0 queue:0];

    id v6 = *(void **)(a1 + 32);
    [v6 setAVAssetInternal:0];
  }
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v5 = a4;
  id v6 = [v5 request];
  int v7 = [v6 URL];
  id v8 = [v7 scheme];
  if ([v8 isEqualToString:@"skd"])
  {

LABEL_6:
    uint64_t v14 = [(TVPMediaItemLoader *)self mediaItem];
    char v13 = objc_opt_respondsToSelector();
    if (v13)
    {
      id v15 = [[TVPSecureKeyRequest alloc] initWithAssetResourceLoadingRequest:v5];
      id v16 = [(TVPMediaItemLoader *)self mediaItem];
      int v17 = [v16 hasTrait:@"TVPMediaItemTraitIsRental"];

      if (v17)
      {
        int v18 = [(TVPMediaItemLoader *)self mediaItem];
        double v19 = [v18 mediaItemMetadataForProperty:@"TVPMediaItemMetadataRentalID"];

        [(TVPSecureKeyRequest *)v15 setRentalID:v19];
      }
      [v14 loadStreamingKeyForRequest:v15];
    }
    goto LABEL_11;
  }
  id v9 = (void *)MEMORY[0x263F08BC8];
  id v10 = [v5 request];
  uint64_t v11 = [v9 _protocolClassForRequest:v10];

  if (!v11) {
    goto LABEL_6;
  }
  id v12 = sMediaItemLoaderLogObject;
  char v13 = 0;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v21 = 0;
    _os_log_impl(&dword_236FC5000, v12, OS_LOG_TYPE_DEFAULT, "Bypassing loadStreamingKeyForRequest: since a protocol handler exists for this request", v21, 2u);
    char v13 = 0;
  }
LABEL_11:

  return v13 & 1;
}

- (TVPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (TVPMediaItemTimingData)timingData
{
  return self->_timingData;
}

- (void)setTimingData:(id)a3
{
}

- (void)setAVAsset:(id)a3
{
}

- (AVURLAsset)existingAVAsset
{
  return self->_existingAVAsset;
}

- (void)setExistingAVAsset:(id)a3
{
}

- (void)setContentKeySession:(id)a3
{
}

- (BOOL)allowsCellularUsage
{
  return self->_allowsCellularUsage;
}

- (void)setAllowsCellularUsage:(BOOL)a3
{
  self->_allowsCellularUsage = a3;
}

- (BOOL)allowsConstrainedNetworkUsage
{
  return self->_allowsConstrainedNetworkUsage;
}

- (void)setAllowsConstrainedNetworkUsage:(BOOL)a3
{
  self->_allowsConstrainedNetworkUsage = a3;
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (AVURLAsset)AVAssetInternal
{
  return self->_AVAssetInternal;
}

- (void)setAVAssetInternal:(id)a3
{
}

- (OS_dispatch_queue)assetInternalAccessQueue
{
  return self->_assetInternalAccessQueue;
}

- (void)setAssetInternalAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)assetLoadContextAccessQueue
{
  return self->_assetLoadContextAccessQueue;
}

- (void)setAssetLoadContextAccessQueue:(id)a3
{
}

- (unint64_t)assetLoadContext
{
  return self->_assetLoadContext;
}

- (void)setAssetLoadContext:(unint64_t)a3
{
  self->_assetLoadContext = a3;
}

- (unint64_t)refCount
{
  return self->_refCount;
}

- (void)setRefCount:(unint64_t)a3
{
  self->_refCount = a3;
}

- (NSString)mediaItemLoaderGUID
{
  return self->_mediaItemLoaderGUID;
}

- (void)setMediaItemLoaderGUID:(id)a3
{
}

- (NSTimer)diskSpaceMonitorTimer
{
  return self->_diskSpaceMonitorTimer;
}

- (void)setDiskSpaceMonitorTimer:(id)a3
{
}

- (BOOL)cleanedUp
{
  return self->_cleanedUp;
}

- (void)setCleanedUp:(BOOL)a3
{
  self->_cleanedUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskSpaceMonitorTimer, 0);
  objc_storeStrong((id *)&self->_mediaItemLoaderGUID, 0);
  objc_storeStrong((id *)&self->_assetLoadContextAccessQueue, 0);
  objc_storeStrong((id *)&self->_assetInternalAccessQueue, 0);
  objc_storeStrong((id *)&self->_AVAssetInternal, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
  objc_storeStrong((id *)&self->_existingAVAsset, 0);
  objc_storeStrong((id *)&self->_AVAsset, 0);
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_236FC5000, v0, v1, "Unable to retrieve file system attributes due to error %@", v2, v3, v4, v5, v6);
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "File name has zero length", v2, v3, v4, v5, v6);
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_236FC5000, v0, v1, "Error creating directory at %@: %@");
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Not enough free space for temporary download", v2, v3, v4, v5, v6);
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Unable to determine free space for temporary download", v2, v3, v4, v5, v6);
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_106_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_236FC5000, v0, v1, "Media item %@ has empty URL", v2, v3, v4, v5, v6);
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_106_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Not setting AVAsset destination URL since it is nil", v2, v3, v4, v5, v6);
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_114_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Unable to create AVURLAsset", v2, v3, v4, v5, v6);
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_114_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Creation of AVURLAsset using download token failed", v2, v3, v4, v5, v6);
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_5_189_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_236FC5000, v0, v1, "Error occurred while loading media item: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_onAssetInternalAccessQueue_updateContentKeySessionWithContentKeyLoader:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "AVAssetInternal is nil; unable to add content key recipient",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_contentKeyRequestParamsFromBase64String:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_236FC5000, v0, v1, "Unable to deserialize key request params: %@", v2, v3, v4, v5, v6);
}

- (void)_contentKeyRequestParamsFromBase64String:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_236FC5000, log, OS_LOG_TYPE_ERROR, "Key format version object is not a string or number", buf, 2u);
}

- (void)_contentKeyRequestParamsFromBase64String:(os_log_t)log .cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_236FC5000, log, OS_LOG_TYPE_ERROR, "Key request param object is not a dictionary", buf, 2u);
}

- (void)_contentKeyRequestParamsFromBase64String:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Key request param data is not an array", v2, v3, v4, v5, v6);
}

@end