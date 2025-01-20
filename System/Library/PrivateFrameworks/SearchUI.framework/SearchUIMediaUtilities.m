@interface SearchUIMediaUtilities
+ (BOOL)bundleIdentifierSupportsOpenIntent:(id)a3;
+ (BOOL)bundleIdentifierSupportsPlayIntent:(id)a3;
+ (BOOL)isCoreSpotlightMedia:(id)a3;
+ (BOOL)isCurrentMedia:(id)a3;
+ (BOOL)isMediaItem:(id)a3 equalToMediaItem:(id)a4;
+ (BOOL)isNowPlayingMedia:(id)a3;
+ (BOOL)isPlaying;
+ (SFMediaMetadata)currentMedia;
+ (id)appsThatSupportSearchIntents;
+ (id)backingItemForMediaMetadataCache;
+ (id)cardSectionsForListenToCardSection:(id)a3;
+ (id)fallbackPunchoutWithMetadata:(id)a3 forBundleIdentifier:(id)a4;
+ (id)generateAppsThatSupportSearchIntents;
+ (id)localAudioCache;
+ (id)mediaDestinationsForMediaMetadata:(id)a3;
+ (id)mediaSearchForMetadata:(id)a3;
+ (id)musicPlayer;
+ (id)musicPlayerQueue;
+ (id)musicStatusCache;
+ (id)supportedIntentsForApp:(id)a3;
+ (void)canPlayAppleMusicWithCompletionHandler:(id)a3;
+ (void)dispatchOnMusicQueueIfNecessary:(id)a3;
+ (void)getMusicUserDisclosureApprovalStatusWithCompletionHandler:(id)a3;
+ (void)initializeQueuesAndNotifications;
+ (void)pausePlayback;
+ (void)playCoreSpotlightMedia:(id)a3;
+ (void)playMedia:(id)a3;
+ (void)predictionForMediaMetadata:(id)a3 completion:(id)a4;
+ (void)prewarmMediaLibrary;
+ (void)resetMediaApps;
+ (void)resetPlayer;
+ (void)resumePlayback;
+ (void)setCurrentMedia:(id)a3;
+ (void)setIsPlaying:(BOOL)a3;
+ (void)updateBackingItemForMediaMetadata:(id)a3;
@end

@implementation SearchUIMediaUtilities

+ (id)fallbackPunchoutWithMetadata:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = objc_msgSend(a3, "mediaPunchouts", 0);
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 bundleIdentifier];
        int v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)mediaSearchForMetadata:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E4F30548];
    id v4 = a3;
    id v5 = [v3 alloc];
    uint64_t v6 = (int)[v4 mediaType];
    id v7 = [v4 mediaName];
    uint64_t v8 = [v4 artistName];
    v9 = [v4 albumName];

    v10 = (void *)[v5 initWithMediaType:v6 sortOrder:0 mediaName:v7 artistName:v8 albumName:v9 genreNames:0 moodNames:0 releaseDate:0 reference:0 mediaIdentifier:0];
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (BOOL)bundleIdentifierSupportsPlayIntent:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() supportedIntentsForApp:v3];

  id v5 = [MEMORY[0x1E4F305C8] description];
  char v6 = [v4 containsObject:v5];

  return v6;
}

+ (BOOL)bundleIdentifierSupportsOpenIntent:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() supportedIntentsForApp:v3];

  id v5 = [MEMORY[0x1E4F306A8] description];
  char v6 = [v4 containsObject:v5];

  return v6;
}

+ (id)supportedIntentsForApp:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:1 error:0];

  char v6 = [MEMORY[0x1E4F302B0] appInfoWithApplicationRecord:v5];
  id v7 = [v6 supportedIntents];

  return v7;
}

+ (void)predictionForMediaMetadata:(id)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = predictionForMediaMetadata_completion__onceToken;
  id v7 = a3;
  if (v6 != -1) {
    dispatch_once(&predictionForMediaMetadata_completion__onceToken, &__block_literal_global_19);
  }
  uint64_t v8 = (void *)predictionForMediaMetadata_completion__audioAppPredictorCache;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__SearchUIMediaUtilities_predictionForMediaMetadata_completion___block_invoke_2;
  v10[3] = &unk_1E6E734D8;
  id v11 = v5;
  id v9 = v5;
  [v8 getObjectForKey:v7 completionHandler:v10];
}

uint64_t __64__SearchUIMediaUtilities_predictionForMediaMetadata_completion___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = predictionForMediaMetadata_completion__audioAppPredictorCache;
  predictionForMediaMetadata_completion__audioAppPredictorCache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __64__SearchUIMediaUtilities_predictionForMediaMetadata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)mediaDestinationsForMediaMetadata:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v6 = [a1 appsThatSupportSearchIntents];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        int v12 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v11];
        if (([v12 isHidden] & 1) == 0) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v8);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v13 = [v4 mediaPunchouts];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        uint64_t v19 = [v18 bundleIdentifier];
        if (([v5 containsObject:v19] & 1) == 0)
        {
          v20 = [v18 bundleIdentifier];
          BOOL v21 = +[SearchUIUtilities isAppInstalledWithBundleId:v20];

          if (!v21) {
            continue;
          }
          uint64_t v19 = [v18 bundleIdentifier];
          [v5 addObject:v19];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v15);
  }

  v22 = [v4 bundleIdentifiersToExclude];

  if (v22)
  {
    v23 = (void *)MEMORY[0x1E4F1CAD0];
    v24 = [v4 bundleIdentifiersToExclude];
    v25 = [v23 setWithArray:v24];
    [v5 minusSet:v25];
  }
  v26 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v27 = v5;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v35 + 1) + 8 * k);
        v33 = objc_opt_new();
        objc_msgSend(v33, "setAppBundleIdentifier:", v32, (void)v35);
        [v33 setMediaMetadata:v4];
        [v26 addObject:v33];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v29);
  }

  return v26;
}

+ (id)cardSectionsForListenToCardSection:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = [v4 mediaMetadata];
  uint64_t v7 = [a1 mediaDestinationsForMediaMetadata:v6];

  obuint64_t j = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v13 = objc_opt_new();
        uint64_t v14 = [v4 cardSectionId];
        [v13 setCardSectionId:v14];

        uint64_t v15 = [v12 image];
        [v13 setImage:v15];

        uint64_t v16 = (void *)MEMORY[0x1E4F9A378];
        long long v17 = [v12 title];
        v18 = [v16 textWithString:v17];
        [v13 setLeadingText:v18];

        uint64_t v19 = [v12 command];
        [v13 setCommand:v19];

        [v5 addObject:v13];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  if ([v5 count]
    || ([v4 fallbackCardSection],
        v20 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v20,
        (isKindOfClass & 1) == 0))
  {
    [v5 sortUsingComparator:&__block_literal_global_199];
  }
  else
  {
    v22 = [v4 fallbackCardSection];
    [v5 addObject:v22];
  }
  return v5;
}

uint64_t __61__SearchUIMediaUtilities_cardSectionsForListenToCardSection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 leadingText];
  uint64_t v6 = [v5 text];
  uint64_t v7 = [v4 leadingText];

  uint64_t v8 = [v7 text];
  uint64_t v9 = [v6 localizedCaseInsensitiveCompare:v8];

  return v9;
}

+ (void)initializeQueuesAndNotifications
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SearchUIMediaUtilities_initializeQueuesAndNotifications__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initializeQueuesAndNotifications_onceToken != -1) {
    dispatch_once(&initializeQueuesAndNotifications_onceToken, block);
  }
}

void __58__SearchUIMediaUtilities_initializeQueuesAndNotifications__block_invoke(uint64_t a1)
{
  id v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v2 = dispatch_queue_create("searchUIMediaAppsFetchingQueue", v5);
  id v3 = (void *)searchUI_mediaQueue;
  searchUI_mediaQueue = (uint64_t)v2;

  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel_resetMediaApps name:@"com.apple.LaunchServices.applicationRegistered" object:0];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel_resetMediaApps name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
}

+ (void)prewarmMediaLibrary
{
  [a1 initializeQueuesAndNotifications];
  [a1 resetMediaApps];
}

+ (id)appsThatSupportSearchIntents
{
  [a1 initializeQueuesAndNotifications];
  id v3 = (void *)appsThatSupportSearch;
  if (!appsThatSupportSearch)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy__2;
    int v12 = __Block_byref_object_dispose__2;
    id v13 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__SearchUIMediaUtilities_appsThatSupportSearchIntents__block_invoke;
    v7[3] = &unk_1E6E73520;
    v7[4] = &v8;
    v7[5] = a1;
    dispatch_sync((dispatch_queue_t)searchUI_mediaQueue, v7);
    id v4 = (void *)appsThatSupportSearch;
    if (!appsThatSupportSearch) {
      id v4 = (void *)v9[5];
    }
    objc_storeStrong((id *)&appsThatSupportSearch, v4);
    _Block_object_dispose(&v8, 8);

    id v3 = (void *)appsThatSupportSearch;
  }
  id v5 = (void *)[v3 copy];
  return v5;
}

uint64_t __54__SearchUIMediaUtilities_appsThatSupportSearchIntents__block_invoke(uint64_t result)
{
  if (!appsThatSupportSearch)
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 40) generateAppsThatSupportSearchIntents];
    uint64_t v3 = *(void *)(*(void *)(v1 + 32) + 8);
    uint64_t v4 = *(void *)(v3 + 40);
    *(void *)(v3 + 40) = v2;
    return MEMORY[0x1F41817F8](v2, v4);
  }
  return result;
}

+ (void)resetMediaApps
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SearchUIMediaUtilities_resetMediaApps__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)searchUI_mediaQueue, block);
}

void __40__SearchUIMediaUtilities_resetMediaApps__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) generateAppsThatSupportSearchIntents];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__SearchUIMediaUtilities_resetMediaApps__block_invoke_2;
  v3[3] = &unk_1E6E72730;
  id v4 = v1;
  id v2 = v1;
  +[SearchUIUtilities dispatchMainIfNecessary:v3];
}

void __40__SearchUIMediaUtilities_resetMediaApps__block_invoke_2(uint64_t a1)
{
}

+ (id)generateAppsThatSupportSearchIntents
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)searchUI_mediaQueue);
  id v13 = (id)objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v7 = [MEMORY[0x1E4F302B0] appInfoWithApplicationRecord:v6];
        uint64_t v8 = [v7 supportedIntents];
        uint64_t v9 = [MEMORY[0x1E4F306A8] description];
        int v10 = [v8 containsObject:v9];

        if (v10)
        {
          uint64_t v11 = [v6 bundleIdentifier];
          [v13 addObject:v11];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }

  return v13;
}

+ (id)localAudioCache
{
  if (localAudioCache_onceToken != -1) {
    dispatch_once(&localAudioCache_onceToken, &__block_literal_global_205);
  }
  uint64_t v2 = (void *)localAudioCache_localAudioCache;
  return v2;
}

uint64_t __41__SearchUIMediaUtilities_localAudioCache__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = localAudioCache_localAudioCache;
  localAudioCache_localAudioCache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)isNowPlayingMedia:(id)a3
{
  id v4 = a3;
  char v5 = [a1 isCurrentMedia:v4];
  uint64_t v6 = [a1 backingItemForMediaMetadataCache];
  uint64_t v7 = [v6 objectForKey:v4];

  if (!v7 || _searchUIPlayState == 1)
  {
    char v9 = [a1 isPlaying];
  }
  else
  {
    uint64_t v8 = [a1 musicStatusCache];
    char v9 = [v8 playbackState] == 1;
  }
  return v5 & v9;
}

+ (BOOL)isCoreSpotlightMedia:(id)a3
{
  return [a3 hasPrefix:@"x-media-library://"];
}

+ (void)pausePlayback
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __39__SearchUIMediaUtilities_pausePlayback__block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = a1;
  [a1 dispatchOnMusicQueueIfNecessary:v2];
}

void __39__SearchUIMediaUtilities_pausePlayback__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) musicPlayer];
  [v1 pause];
}

+ (void)resumePlayback
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__SearchUIMediaUtilities_resumePlayback__block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = a1;
  [a1 dispatchOnMusicQueueIfNecessary:v2];
}

void __40__SearchUIMediaUtilities_resumePlayback__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) musicPlayer];
  [v1 play];
}

+ (void)playMedia:(id)a3
{
  id v4 = a3;
  char v5 = [v4 mediaIdentifier];
  int v6 = [v4 mediaType];
  if (v5)
  {
    int v7 = v6;
    if ([a1 isCurrentMedia:v4])
    {
      char v8 = [a1 isPlaying];
      if (v7 == 100)
      {
        if ((v8 & 1) == 0)
        {
          +[SearchUIVoicemailUtilities resumeVoicemail];
          goto LABEL_22;
        }
LABEL_7:
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __36__SearchUIMediaUtilities_playMedia___block_invoke;
        v21[3] = &unk_1E6E73548;
        id v22 = v5;
        +[SearchUIVoicemailUtilities playVoicemailWithIdentifier:v22 completionHandler:v21];

        goto LABEL_22;
      }
      if ((v8 & 1) == 0)
      {
        [a1 resumePlayback];
        goto LABEL_22;
      }
    }
    else if (v7 == 100)
    {
      goto LABEL_7;
    }
    char v9 = +[SearchUIUtilities bundleIdentifierForApp:11];
    BOOL v10 = +[SearchUIUtilities isAppInstalledWithBundleId:v9];

    if (v10)
    {
      uint64_t v11 = [v4 mediaIdentifier];
      _searchUIPlayState = 1;
      if ([a1 isCoreSpotlightMedia:v11])
      {
        [a1 playCoreSpotlightMedia:v4];
      }
      else if (v7)
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __36__SearchUIMediaUtilities_playMedia___block_invoke_215;
        v17[3] = &unk_1E6E73570;
        id v18 = v11;
        id v19 = v4;
        id v20 = a1;
        +[SearchUIMusicUtilities playMusicItemWithMediaMetadata:v19 completionHandler:v17];
      }
    }
    else
    {
      int v12 = objc_opt_new();
      id v13 = +[SearchUIUtilities bundleIdentifierForApp:11];
      [v12 setApplicationBundleIdentifier:v13];

      uint64_t v14 = +[SearchUICommandHandler handlerForCommand:v12 environment:0];
      if ([MEMORY[0x1E4FAE198] isMacOS]) {
        uint64_t v15 = 3;
      }
      else {
        uint64_t v15 = 2;
      }
      [v14 performCommand:v12 triggerEvent:v15 environment:0];
      long long v16 = SearchUIGeneralLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[SearchUIMediaUtilities playMedia:v16];
      }

      [a1 resetPlayer];
    }
  }
LABEL_22:
}

void __36__SearchUIMediaUtilities_playMedia___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = SearchUIGeneralLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __36__SearchUIMediaUtilities_playMedia___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

void __36__SearchUIMediaUtilities_playMedia___block_invoke_215(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = SearchUIGeneralLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __36__SearchUIMediaUtilities_playMedia___block_invoke_215_cold_1(a1, (uint64_t)v3, v4);
    }

    [*(id *)(a1 + 48) resetPlayer];
  }
  else
  {
    [*(id *)(a1 + 48) updateBackingItemForMediaMetadata:*(void *)(a1 + 40)];
  }
}

+ (void)resetPlayer
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__SearchUIMediaUtilities_resetPlayer__block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = a1;
  [a1 dispatchOnMusicQueueIfNecessary:v2];
}

void __37__SearchUIMediaUtilities_resetPlayer__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsPlaying:0];
  uint64_t v2 = [*(id *)(a1 + 32) musicPlayer];
  [v2 stop];

  [*(id *)(a1 + 32) setCurrentMedia:0];
  _searchUIPlayState = 0;
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SearchUIMusicDidResetNotification" object:0];
}

+ (void)playCoreSpotlightMedia:(id)a3
{
  id v4 = a3;
  char v5 = [v4 mediaIdentifier];
  int v6 = [a1 localAudioCache];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke;
  v8[3] = &unk_1E6E735E8;
  id v9 = v4;
  id v10 = a1;
  id v7 = v4;
  [v6 getObjectForKey:v5 completionHandler:v8];
}

void __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = objc_opt_new();
      char v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "persistentID"));
      int v6 = [MEMORY[0x1E4F31968] predicateWithValue:v5 forProperty:*MEMORY[0x1E4F31430]];
      [v4 addFilterPredicate:v6];
    }
    else
    {
      id v4 = 0;
    }
    id v7 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke_2;
    v9[3] = &unk_1E6E72560;
    id v10 = v4;
    id v13 = v7;
    id v11 = v3;
    id v12 = *(id *)(a1 + 32);
    id v8 = v4;
    [v7 dispatchOnMusicQueueIfNecessary:v9];
  }
}

void __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 56) musicPlayer];
  id v4 = v3;
  if (v2) {
    [v3 setQueueWithQuery:*(void *)(a1 + 32)];
  }
  else {
    [v3 setQueueWithItemCollection:*(void *)(a1 + 40)];
  }

  char v5 = [*(id *)(a1 + 56) musicPlayer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke_3;
  v8[3] = &unk_1E6E735C0;
  long long v7 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v7;
  long long v9 = v7;
  [v5 prepareToPlayWithCompletionHandler:v8];
}

void __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke_4;
  v8[3] = &unk_1E6E73598;
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  [v4 dispatchOnMusicQueueIfNecessary:v8];
}

uint64_t __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = SearchUIGeneralLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke_4_cold_1(v2, v3);
    }

    return [*(id *)(a1 + 48) resetPlayer];
  }
  else
  {
    id v5 = [*(id *)(a1 + 48) musicPlayer];
    [v5 play];

    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    return [v6 updateBackingItemForMediaMetadata:v7];
  }
}

+ (void)updateBackingItemForMediaMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [a1 musicStatusCache];
  id v6 = [v5 nowPlayingItem];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__SearchUIMediaUtilities_updateBackingItemForMediaMetadata___block_invoke;
  v9[3] = &unk_1E6E73598;
  id v11 = v4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v4;
  id v8 = v6;
  +[SearchUIUtilities dispatchMainIfNecessary:v9];
}

void __60__SearchUIMediaUtilities_updateBackingItemForMediaMetadata___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 48) backingItemForMediaMetadataCache];
  id v4 = v3;
  if (v2)
  {
    [v3 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
    uint64_t v5 = 2;
  }
  else
  {
    [v3 removeObjectForKey:*(void *)(a1 + 40)];
    uint64_t v5 = 0;
  }

  _searchUIPlayState = v5;
}

+ (void)getMusicUserDisclosureApprovalStatusWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (getMusicUserDisclosureApprovalStatusWithCompletionHandler__onceToken != -1) {
    dispatch_once(&getMusicUserDisclosureApprovalStatusWithCompletionHandler__onceToken, &__block_literal_global_221);
  }
  id v4 = (void *)getMusicUserDisclosureApprovalStatusWithCompletionHandler__musicDisclosureStatusCache;
  uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__SearchUIMediaUtilities_getMusicUserDisclosureApprovalStatusWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E6E73610;
  id v8 = v3;
  id v6 = v3;
  [v4 getObjectForKey:v5 completionHandler:v7];
}

uint64_t __84__SearchUIMediaUtilities_getMusicUserDisclosureApprovalStatusWithCompletionHandler___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = getMusicUserDisclosureApprovalStatusWithCompletionHandler__musicDisclosureStatusCache;
  getMusicUserDisclosureApprovalStatusWithCompletionHandler__musicDisclosureStatusCache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __84__SearchUIMediaUtilities_getMusicUserDisclosureApprovalStatusWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 BOOLValue];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

+ (id)musicStatusCache
{
  if (musicStatusCache_onceToken != -1) {
    dispatch_once(&musicStatusCache_onceToken, &__block_literal_global_226);
  }
  uint64_t v2 = (void *)musicStatusCache_musicStatusCache;
  return v2;
}

uint64_t __42__SearchUIMediaUtilities_musicStatusCache__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = musicStatusCache_musicStatusCache;
  musicStatusCache_musicStatusCache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)canPlayAppleMusicWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 musicStatusCache];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__SearchUIMediaUtilities_canPlayAppleMusicWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6E73610;
  id v8 = v4;
  id v6 = v4;
  [v5 getObjectForKey:&stru_1F40279D8 completionHandler:v7];
}

uint64_t __65__SearchUIMediaUtilities_canPlayAppleMusicWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 BOOLValue];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

+ (id)musicPlayerQueue
{
  if (musicPlayerQueue_onceToken != -1) {
    dispatch_once(&musicPlayerQueue_onceToken, &__block_literal_global_232);
  }
  uint64_t v2 = (void *)musicPlayerQueue_musicPlayerQueue;
  return v2;
}

void __42__SearchUIMediaUtilities_musicPlayerQueue__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v0 bundleIdentifier];

  id v1 = [NSString stringWithFormat:@"SearchUIMusicPlayerQueueIdentifier.%@", v6];
  uint64_t v2 = (const char *)[v1 UTF8String];
  uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v4 = dispatch_queue_create(v2, v3);
  uint64_t v5 = (void *)musicPlayerQueue_musicPlayerQueue;
  musicPlayerQueue_musicPlayerQueue = (uint64_t)v4;
}

+ (id)musicPlayer
{
  if ([MEMORY[0x1E4FAE198] isMacOS])
  {
    if (musicPlayer_onceToken != -1) {
      dispatch_once(&musicPlayer_onceToken, &__block_literal_global_238);
    }
    id v3 = [MEMORY[0x1E4F319C0] applicationQueuePlayer];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__SearchUIMediaUtilities_musicPlayer__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (musicPlayer_onceToken_240 != -1) {
      dispatch_once(&musicPlayer_onceToken_240, block);
    }
    id v3 = (id)musicPlayer_musicPlayerController;
  }
  return v3;
}

uint64_t __37__SearchUIMediaUtilities_musicPlayer__block_invoke()
{
  return [MEMORY[0x1E4F319B8] setShouldUseSystemMusicAppOnMacOS:0];
}

void __37__SearchUIMediaUtilities_musicPlayer__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v8 = [v2 bundleIdentifier];

  id v3 = [NSString stringWithFormat:@"SearchUIMusicPlayerIdentifier.%@", v8];
  id v4 = objc_alloc(MEMORY[0x1E4F319C0]);
  uint64_t v5 = [*(id *)(a1 + 32) musicPlayerQueue];
  uint64_t v6 = [v4 initWithClientIdentifier:v3 queue:v5];
  id v7 = (void *)musicPlayer_musicPlayerController;
  musicPlayer_musicPlayerController = v6;
}

+ (SFMediaMetadata)currentMedia
{
  return (SFMediaMetadata *)(id)_searchUIMediaUtilitiesCurrentMedia;
}

+ (void)setCurrentMedia:(id)a3
{
}

+ (BOOL)isPlaying
{
  return _searchUIMediaUtilitiesIsPlaying;
}

+ (void)setIsPlaying:(BOOL)a3
{
  _searchUIMediaUtilitiesIsPlaying = a3;
}

+ (BOOL)isCurrentMedia:(id)a3
{
  id v4 = a3;
  id v7 = [a1 backingItemForMediaMetadataCache];
  uint64_t v5 = [v7 objectForKey:v4];

  uint64_t v6 = [a1 currentMedia];
  LODWORD(v7) = [v6 isEqual:v4];

  if (!v7 && v5 && _searchUIPlayState != 1)
  {
    id v7 = [a1 musicStatusCache];
    id v8 = [v7 nowPlayingItem];

    LOBYTE(v7) = [a1 isMediaItem:v8 equalToMediaItem:v5];
  }

  return (char)v7;
}

+ (id)backingItemForMediaMetadataCache
{
  if (backingItemForMediaMetadataCache_onceToken != -1) {
    dispatch_once(&backingItemForMediaMetadataCache_onceToken, &__block_literal_global_245);
  }
  uint64_t v2 = (void *)backingItemForMediaMetadataCache_backingItemForMediaMetadata;
  return v2;
}

uint64_t __58__SearchUIMediaUtilities_backingItemForMediaMetadataCache__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = backingItemForMediaMetadataCache_backingItemForMediaMetadata;
  backingItemForMediaMetadataCache_backingItemForMediaMetadata = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)isMediaItem:(id)a3 equalToMediaItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v6;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    char v14 = [v5 isEqual:v6];
  }
  else
  {
    id v12 = [v8 modelObject];
    id v13 = [v10 modelObject];
    char v14 = [v12 isEqual:v13];
  }
  if (v5 == v6) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = v14;
  }

  return v15;
}

+ (void)dispatchOnMusicQueueIfNecessary:(id)a3
{
  blocuint64_t k = a3;
  if ([MEMORY[0x1E4FAE198] isMacOS])
  {
    +[SearchUIUtilities dispatchMainIfNecessary:block];
  }
  else
  {
    id v3 = +[SearchUIMediaUtilities musicPlayerQueue];
    dispatch_async(v3, block);
  }
}

+ (void)playMedia:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "mediaType"));
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1E45B5000, a3, OS_LOG_TYPE_ERROR, "Music app is not installed for media: %@ with type: %@", (uint8_t *)&v6, 0x16u);
}

void __36__SearchUIMediaUtilities_playMedia___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "Failed to play voicemail: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

void __36__SearchUIMediaUtilities_playMedia___block_invoke_215_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  __int16 v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "mediaType"));
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_error_impl(&dword_1E45B5000, a3, OS_LOG_TYPE_ERROR, "Failed to play media: %@ with type: %@ error: %@", (uint8_t *)&v7, 0x20u);
}

void __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke_4_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "Music player failed to prepare with error %@", (uint8_t *)&v3, 0xCu);
}

@end